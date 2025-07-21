# AI-Driven NLP to SQL Query and Visualization

This project implements an AI-powered system that converts natural language queries into SQL statements and visualizes the results. The system allows users to interact with databases without needing to write SQL queries manually.

## Features
- 📝 Converts natural language to SQL queries  
- 📊 Visualizes query results with interactive charts  
- 🔐 Admin panel for managing configurations and viewing analytics  
- 🛠️ Built with Flask, MySQL, and modern front-end libraries

## Planned Features (Upcoming)
- Dynamic SQL generation with support for complex queries  
- Data visualization with different chart types (bar, pie, line)  
- Secure user authentication and role-based access    
- Error handling and query optimization suggestions  
- Responsive UI with improved user experience

## How to Run
1. Clone this repository  
2. Install required dependencies using:
```bash
pip install -r requirements.txt
```
3. Configure your database connection in the `config.py` or `app.py` file  
4. Run the Flask app:
```bash
python app.py
```
5. Access the application at:`http://localhost:5000`

## Admin Login Credentials
> To access the admin panel, use:  
- **Username:** `admin`  
- **Password:** `admin123`  

> **Note:** Currently, the admin has access **only to add database tables**. Other admin functionalities are under development.

## Admin Login Credentials
> To access the admin panel, use:  
- **Username:** `admin`  
- **Password:** `admin123`  

> **Note:**  
Currently, the admin has access **only to add database tables**.  
Other admin functionalities are under development.

## Database Configuration  
We are using **XAMPP's phpMyAdmin MySQL server**, which by default does **not require a password** to access the database (`root` user with an empty password).  

If you are using MySQL with a password, update the database connection in `app.py` like this:  

## Admin Login Credentials
> To access the admin panel, use:  
- **Username:** `admin`  
- **Password:** `admin123`  

> **Note:**  
Currently, the admin has access **only to add database tables**.  
Other admin functionalities are under development.

## Database Configuration  
We are using **XAMPP's phpMyAdmin MySQL server**, which by default does **not require a password** to access the database (`root` user with an empty password).  

If you are using MySQL with a password, update the database connection in `app.py` like this:  

```python
import mysql.connector

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'your_mysql_password',  # 🔒 Add your MySQL password here
    'database': 'your_database_name'
}

def run_query(query):
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    cursor.execute(query)
    result = cursor.fetchall()
    conn.close()
    return result
```
## 📝 Sample complex Prompts to Try (Advanced SQL Queries)

| # | Prompt |
|---|--------|
| 1️⃣ | Show the department(s) with the highest average student age. |
| 2️⃣ | List the courses that have more than 5 students enrolled. |
| 3️⃣ | Find students who are enrolled in all courses offered by their department. |
| 4️⃣ | List departments where female students have an average grade of ‘A’ in their enrollments. |
| 5️⃣ | Show total number of students who joined each year, ordered by most recent year. |
| 6️⃣ | Find all courses that have no enrollments yet. |
| 7️⃣ | List top 3 departments with the highest number of enrolled students. |
| 8️⃣ | Show average credits per course grouped by department. |
| 9️⃣ | Find students who are enrolled in both ‘Data Structures’ and ‘Algorithms’. |
| 🔟 | Show departments that have no students enrolled in any course. |


## Repository Access
This repository has been shared with the required team members for NS Code Review purposes.

## License
This project is developed for educational and hackathon purposes.
