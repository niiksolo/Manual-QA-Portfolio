# 🧪 API Testing — FakeStoreAPI

A training project for **API testing**.  
Tools: **Postman** (manual testing), **Newman** (automated run with HTML reports).

---

## 📌 What is done
- Collections for **Products**, **Users**, **Carts**, **Auth**  
- Environment variables for each collection  
- Authorization and token saving  
- JSON Schema validation  
- HTML report generation via Newman  

---

## 📊 API Reports
- [Products Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/postman/reports/Products_Report.html)  
- [Users Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/postman/reports/Users_Report.html)  
- [Carts Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/postman/reports/Carts_Report.html)  
- [Auth Report](https://niiksolo.github.io/Manual-QA-Portfolio/api-sql-testing/postman/reports/Auth_Report.html)  

---

## 🚀 How to run tests

Open terminal or PowerShell in the project root and run the Newman commands:

```bash
newman run collections/Products.postman_collection.json -e environments/Products_Env.postman_environment.json -r cli,html --reporter-html-export reports/Products_Report.html
newman run collections/Users.postman_collection.json -e environments/Users_Env.postman_environment.json -r cli,html --reporter-html-export reports/Users_Report.html
newman run collections/Carts.postman_collection.json -e environments/Carts_Env.postman_environment.json -r cli,html --reporter-html-export reports/Carts_Report.html
newman run collections/Auth.postman_collection.json -e environments/Auth_Env.postman_environment.json -r cli,html --reporter-html-export reports/Auth_Report.html
Копировать код
