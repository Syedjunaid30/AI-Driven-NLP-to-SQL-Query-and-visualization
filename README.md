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

## Repository Access
This repository has been shared with the required team members for NS Code Review purposes.

## License
This project is developed for educational and hackathon purposes.
