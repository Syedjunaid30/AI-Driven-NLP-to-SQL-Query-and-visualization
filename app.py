from flask import Flask, render_template, request, jsonify, redirect, url_for, session, flash
from flask_cors import CORS
from sqlalchemy import create_engine, text
import re
import os
import requests

app = Flask(__name__)
app.secret_key = 'your_secret_key_here'
CORS(app)

# ✅ MySQL Connection
db_engine = create_engine('mysql+pymysql://root:@localhost/college')
try:
    with db_engine.connect() as conn:
        conn.execute(text("SELECT 1"))
    print("✅ Database connection successful!")
except Exception as e:
    print(f"❌ Database connection failed: {e}")

# ✅ Groq Cloud API Setup
GROQ_API_KEY = "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"
if not GROQ_API_KEY:
    print("❌ Warning: GROQ_API_KEY environment variable not set!")

GROQ_API_URL = "https://api.groq.com/openai/v1/chat/completions"

# ✅ Groq Query Function
def groq_generate_sql(prompt):
    headers = {
        "Authorization": f"Bearer {GROQ_API_KEY}",
        "Content-Type": "application/json"
    }
    system_prompt = """
    You are a MySQL SQL query generator for a college database. Database Schema:
    - students(student_id, name, age, gender, department_id, year_of_joining)
    - departments(department_id, name)
    - courses(course_id, name, department_id, credits)
    - enrollments(enrollment_id, student_id, course_id, grade)
    Relationships:
    - students.department_id → departments.department_id
    - courses.department_id → departments.department_id
    - enrollments.student_id → students.student_id
    - enrollments.course_id → courses.course_id
    ONLY output the SQL query inside a triple backtick SQL code block. Do not explain anything.
    """
    payload = {
        "model": "llama3-70b-8192",
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": prompt}
        ],
        "temperature": 0.2,
        "max_tokens": 300
    }
    try:
        response = requests.post(GROQ_API_URL, headers=headers, json=payload, timeout=10)
        if response.status_code == 200:
            return response.json()['choices'][0]['message']['content'].strip()
        else:
            return f"-- Error: Groq API returned status {response.status_code}: {response.text}"
    except Exception as e:
        return f"-- Error: {str(e)}"

# ✅ SQL Extractor (Supports ```sql ``` blocks)
def extract_sql_query(text):
    sql_block = re.search(r'```(?:sql)?\s*(.*?)\s*```', text, re.DOTALL | re.IGNORECASE)
    if sql_block:
        return sql_block.group(1).strip()
    sql_line = re.search(r'^\s*(SELECT|SHOW|INSERT|UPDATE|DELETE|CREATE|WITH)\b.*', text, re.IGNORECASE | re.MULTILINE)
    return sql_line.group(0).strip() if sql_line else "-- Error: No valid SQL found."

# ✅ Routes
@app.route('/db-test')
def db_test():
    try:
        with db_engine.connect() as conn:
            conn.execute(text("SELECT 1"))
        return "✅ Database connection is OK"
    except Exception as e:
        return f"❌ Database connection failed: {e}"

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/chat')
def chat():
    role = session.get('role')
    return render_template('chatbot.html', role=role)

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        role = request.form.get('role')
        session['username'] = username
        session['role'] = role
        return redirect(url_for('chat'))
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.clear()
    flash("You have been logged out.", "info")
    return redirect(url_for('index'))

@app.route('/ask-query', methods=['POST'])
def ask_query():
    data = request.get_json()
    question = data.get('question', '').strip()

    if not question:
        return jsonify({
            "sql_query": "-- Error: No question provided.",
            "chart_type": None,
            "chart_data": {"labels": [], "data": []},
            "table_data": [],
            "error": "Question is required."
        })

    generated_sql = groq_generate_sql(question)
    extracted_sql = extract_sql_query(generated_sql)

    print("Prompt:", question)
    print("Groq Output:", generated_sql)
    print("Extracted SQL:", extracted_sql)

    if extracted_sql.startswith("-- Error"):
        return jsonify({
            "sql_query": extracted_sql,
            "chart_type": None,
            "chart_data": {"labels": [], "data": []},
            "table_data": [],
            "error": extracted_sql
        })

    try:
        with db_engine.connect() as conn:
            result = conn.execute(text(extracted_sql))
            rows = [dict(row._mapping) for row in result]

        labels = []
        data_points = []
        chart_type = None

        if rows:
            headers = list(rows[0].keys())
            first_col = headers[0]
            second_col = headers[1] if len(headers) > 1 else None

            try:
                data_points = [float(row[second_col]) for row in rows]
                labels = [str(row[first_col]) for row in rows]
                chart_type = "bar"
            except Exception:
                labels = [str(row[first_col]) for row in rows]
                data_points = [1 for _ in rows]  # count bars
                chart_type = "bar"

        return jsonify({
            "sql_query": extracted_sql,
            "chart_type": chart_type,
            "chart_data": {"labels": labels, "data": data_points},
            "table_data": rows,
            "error": None
        })

    except Exception as e:
        return jsonify({
            "sql_query": extracted_sql,
            "chart_type": None,
            "chart_data": {"labels": [], "data": []},
            "table_data": [],
            "error": f"SQL Execution Error: {str(e)}"
        })

@app.route('/admin', methods=['GET', 'POST'])
def admin():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        if username == "admin" and password == "admin123":
            return redirect(url_for('admin_dashboard'))
        else:
            flash("Invalid credentials", "danger")
            return render_template('admin.html')
    return render_template('admin.html')

@app.route("/admin/dashboard", methods=["GET", "POST"])
def admin_dashboard():
    result = error = None

    if request.method == "POST":
        prompt = request.form.get("prompt")
        try:
            generated_sql = groq_generate_sql(prompt)
            extracted_sql = extract_sql_query(generated_sql)

            with db_engine.connect() as conn:
                conn.execute(text(extracted_sql))

            result = extracted_sql
        except Exception as e:
            error = str(e)

    return render_template("admin_dashboard.html", result=result, error=error)

if __name__ == '__main__':
    app.run(debug=True)