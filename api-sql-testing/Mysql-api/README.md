# MySQL-API Project

This mini-project demonstrates QA workflow: API → Python → MySQL → Reports.  
It shows how to fetch data from FakeStoreAPI, store it in a database, and generate **HTML/CSV** reports.

## Scripts
- `products.py`, `users.py`, `carts.py` — create/update data via API and write to the database  
- `generate_report.py` — generates HTML and CSV reports  

## Reports (via GitHub Pages)
- [Full Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/Mysql-api/reports/full_report.html)  
- [Products Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/Mysql-api/reports/products_report.html)  
- [Users Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/Mysql-api/reports/users_report.html)  
- [Carts Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/Mysql-api/reports/carts_report.html)  

## How to run
```bash
pip install -r requirements.txt
python scripts/products.py
python scripts/users.py
python scripts/carts.py
python scripts/generate_report.py

