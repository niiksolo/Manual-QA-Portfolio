# Redmi QA Project

Мини-проект демонстрирует workflow QA: API → Python → MySQL → Отчёты.

## Скрипты
- `products.py`, `users.py`, `carts.py` — создают/обновляют данные через API и пишут в БД
- `generate_report.py` — формирует HTML и CSV отчёты

## Отчёты (через GitHub Pages)
- [Full Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/sql/reports/full_report.html)
- [Products Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/sql/reports/products_report.html)
- [Users Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/sql/reports/users_report.html)
- [Carts Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/sql/reports/carts_report.html)

## Как запустить
```bash
pip install -r requirements.txt
python scripts/products.py
python scripts/users.py
python scripts/carts.py
python scripts/generate_report.py