import requests
import mysql.connector
from dotenv import load_dotenv
import os
from datetime import datetime
import pandas as pd

load_dotenv()

DB_HOST = os.getenv('DB_HOST')
DB_USER = os.getenv('DB_USER')
DB_PASSWORD = os.getenv('DB_PASSWORD')
DB_NAME = os.getenv('DB_NAME')

API_URL = 'https://fakestoreapi.com/carts'

def insert_cart_to_db(cart):
    conn = mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=DB_NAME
    )
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO carts (id, userId, date)
        VALUES (%s,%s,%s)
        ON DUPLICATE KEY UPDATE
            userId = VALUES(userId),
            date = VALUES(date)
    """, (cart['id'], cart['userId'], cart['date']))
    conn.commit()
    cursor.execute("SELECT * FROM carts WHERE id = %s", (cart['id'],))
    result = cursor.fetchone()
    cursor.close()
    conn.close()
    return result

if __name__ == "__main__":
    cart_payload = {
        "userId": 1,
        "date": datetime.now().strftime("%Y-%m-%d"),
        "products": []
    }

    response = requests.post(API_URL, json=cart_payload)
    cart_data = response.json()

    # Подставляем недостающие поля
    cart_data['userId'] = cart_payload['userId']
    cart_data['date'] = cart_payload['date']

    db_result = insert_cart_to_db(cart_data)
    print("API response:", cart_data)
    print("DB check result:", db_result)

    # -----------------------------
    # Отчёт через pandas
    # -----------------------------
    reports_dir = os.path.join(os.path.dirname(__file__), "..", "reports")
    if not os.path.exists(reports_dir):
        os.makedirs(reports_dir)

    df = pd.DataFrame([db_result], columns=['id', 'userId', 'date'])
    df.to_csv(os.path.join(reports_dir, "carts_report.csv"), index=False)
    df.to_html(os.path.join(reports_dir, "carts_report.html"), index=False)
    print("Отчёт создан:", os.path.join(reports_dir, "carts_report.html"))