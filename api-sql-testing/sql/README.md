# Redmi QA Project

Мини-проект демонстрирует workflow QA: API → Python → MySQL → Отчёты.

## Скрипты
- `products.py`, `users.py`, `carts.py` — создают/обновляют данные через API и пишут в БД
- `generate_report.py` — формирует HTML и CSV отчёты

## Отчёты
- [Products Report](reports/products_report.html)  
- [Users Report](reports/users_report.html)  
- [Carts Report](reports/carts_report.html)  
- [Full Report](reports/full_report.html)

## Как запустить
```bash
pip install -r requirements.txt
python scripts/products.py
python scripts/users.py
python scripts/carts.py
python scripts/generate_report.py