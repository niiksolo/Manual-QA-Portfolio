import mysql.connector
from dotenv import load_dotenv
import os
import pandas as pd

load_dotenv()

DB_HOST = os.getenv('DB_HOST')
DB_USER = os.getenv('DB_USER')
DB_PASSWORD = os.getenv('DB_PASSWORD')
DB_NAME = os.getenv('DB_NAME')

reports_dir = os.path.join(os.path.dirname(__file__), "..", "reports")
if not os.path.exists(reports_dir):
    os.makedirs(reports_dir)

def fetch_table(table_name):
    conn = mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=DB_NAME
    )
    cursor = conn.cursor()
    cursor.execute(f"SELECT * FROM {table_name}")
    rows = cursor.fetchall()
    cursor.close()
    conn.close()
    return rows

def df_from_rows(rows, columns):
    if not rows:
        return pd.DataFrame(columns=columns)
    return pd.DataFrame(rows, columns=columns)

def generate_report():
    products = fetch_table('products')
    users = fetch_table('users')
    carts = fetch_table('carts')

    df_products = df_from_rows(products, ['id', 'title', 'price', 'description', 'category'])
    df_users = df_from_rows(users, ['id', 'email', 'username', 'password', 'name_first', 'name_last'])
    df_carts = df_from_rows(carts, ['id', 'userId', 'date'])

    df_products.to_csv(os.path.join(reports_dir, "products_report.csv"), index=False)
    df_users.to_csv(os.path.join(reports_dir, "users_report.csv"), index=False)
    df_carts.to_csv(os.path.join(reports_dir, "carts_report.csv"), index=False)

    df_products.to_html(os.path.join(reports_dir, "products_report.html"), index=False, border=1)
    df_users.to_html(os.path.join(reports_dir, "users_report.html"), index=False, border=1)
    df_carts.to_html(os.path.join(reports_dir, "carts_report.html"), index=False, border=1)

    full_html_path = os.path.join(reports_dir, "full_report.html")
    with open(full_html_path, "w", encoding="utf-8") as f:
        f.write("<html><head><title>Redmi QA Full Report</title></head><body>")
        f.write("<h1>Redmi QA Project Full Report</h1>")
        f.write("<h2>Products</h2>")
        f.write(df_products.to_html(index=False, border=1))
        f.write("<h2>Users</h2>")
        f.write(df_users.to_html(index=False, border=1))
        f.write("<h2>Carts</h2>")
        f.write(df_carts.to_html(index=False, border=1))
        f.write("</body></html>")

    print("Все отчёты созданы в папке:", reports_dir)
    print("Полный HTML отчёт:", full_html_path)

if __name__ == "__main__":
    generate_report()