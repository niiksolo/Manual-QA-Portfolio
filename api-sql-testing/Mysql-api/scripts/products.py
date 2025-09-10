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

API_URL = 'https://fakestoreapi.com/products'

def insert_product_to_db(product):
    conn = mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=DB_NAME
    )
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO products (id, title, price, description, category)
        VALUES (%s,%s,%s,%s,%s)
        ON DUPLICATE KEY UPDATE
            title = VALUES(title),
            price = VALUES(price),
            description = VALUES(description),
            category = VALUES(category)
    """, (product['id'], product['title'], product['price'], product['description'], product['category']))
    conn.commit()
    cursor.execute("SELECT * FROM products WHERE id = %s", (product['id'],))
    result = cursor.fetchone()
    cursor.close()
    conn.close()
    return result

if __name__ == "__main__":
    # Создаём продукт через API
    product_payload = {
        "title": "Test Product",
        "price": 19.99,
        "description": "Description test",
        "category": "electronics"
    }
    response = requests.post(API_URL, json=product_payload)
    product_data = response.json()

    db_result = insert_product_to_db(product_data)
    print("API response:", product_data)
    print("DB check result:", db_result)

    # -----------------------------
    # Отчёт через pandas
    # -----------------------------
    reports_dir = os.path.join(os.path.dirname(__file__), "..", "reports")
    if not os.path.exists(reports_dir):
        os.makedirs(reports_dir)

    df = pd.DataFrame([db_result], columns=['id', 'title', 'price', 'description', 'category'])
    df.to_csv(os.path.join(reports_dir, "products_report.csv"), index=False)
    df.to_html(os.path.join(reports_dir, "products_report.html"), index=False)
    print("Отчёт создан:", os.path.join(reports_dir, "products_report.html"))