# 🧪 API Testing — FakeStoreAPI

Учебный проект по **API тестирования**.  
Инструменты: **Postman** (ручное тестирование), **Newman** (автоматический прогон и HTML-отчёты).  

---

## 📌 Что сделано
- Коллекции для **Products**, **Users**, **Carts**, **Auth**  
- Переменные окружений для каждой коллекции   
- Авторизация и сохранение токена  
- JSON Schema validation  
- Генерация HTML-отчётов через Newman  

---

## 📊 API Отчёты
- [Products Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/postman/reports/Products_Report.html)  
- [Users Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/postman/reports/Users_Report.html)  
- [Carts Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/postman/reports/Carts_Report.html)  
- [Auth Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/postman/reports/Auth_Report.html)  

---

## 🚀 Как запустить тесты

Открой терминал или PowerShell в корне проекта и запусти команды Newman:

```bash
newman run collections/Products.postman_collection.json -e environments/Products_Env.postman_environment.json -r cli,html --reporter-html-export reports/Products_Report.html
newman run collections/Users.postman_collection.json -e environments/Users_Env.postman_environment.json -r cli,html --reporter-html-export reports/Users_Report.html
newman run collections/Carts.postman_collection.json -e environments/Carts_Env.postman_environment.json -r cli,html --reporter-html-export reports/Carts_Report.html
newman run collections/Auth.postman_collection.json -e environments/Auth_Env.postman_environment.json -r cli,html --reporter-html-export reports/Auth_Report.html