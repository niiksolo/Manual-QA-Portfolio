import requests
import mysql.connector
from dotenv import load_dotenv
import os
import pandas as pd

load_dotenv()

DB_HOST = os.getenv('DB_HOST')
DB_USER = os.getenv('DB_USER')
DB_PASSWORD = os.getenv('DB_PASSWORD')
DB_NAME = os.getenv('DB_NAME')

API_URL = 'https://fakestoreapi.com/users'

def insert_user_to_db(user):
    conn = mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=DB_NAME
    )
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO users (id, email, username, password, name_first, name_last)
        VALUES (%s,%s,%s,%s,%s,%s)
        ON DUPLICATE KEY UPDATE
            email = VALUES(email),
            username = VALUES(username),
            password = VALUES(password),
            name_first = VALUES(name_first),
            name_last = VALUES(name_last)
    """, (user['id'], user['email'], user['username'], user['password'],
          user['name']['firstname'], user['name']['lastname']))
    conn.commit()
    cursor.execute("SELECT * FROM users WHERE id = %s", (user['id'],))
    result = cursor.fetchone()
    cursor.close()
    conn.close()
    return result

if __name__ == "__main__":
    user_payload = {
        "email": "test@example.com",
        "username": "testuser",
        "password": "12345678",
        "name": {"firstname": "John", "lastname": "Doe"}
    }

    response = requests.post(API_URL, json=user_payload)
    user_data = response.json()

    # Подставляем недостающие поля
    user_data['email'] = user_payload['email']
    user_data['username'] = user_payload['username']
    user_data['password'] = user_payload['password']
    user_data['name'] = user_payload['name']

    db_result = insert_user_to_db(user_data)
    print("API response:", user_data)
    print("DB check result:", db_result)

    # -----------------------------
    # Отчёт через pandas
    # -----------------------------
    reports_dir = os.path.join(os.path.dirname(__file__), "..", "reports")
    if not os.path.exists(reports_dir):
        os.makedirs(reports_dir)

    df = pd.DataFrame([db_result], columns=['id', 'email', 'username', 'password', 'name_first', 'name_last'])
    df.to_csv(os.path.join(reports_dir, "users_report.csv"), index=False)
    df.to_html(os.path.join(reports_dir, "users_report.html"), index=False)
    print("Отчёт создан:", os.path.join(reports_dir, "users_report.html"))