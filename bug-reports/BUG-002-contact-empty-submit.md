# Bug Report: Contact-форма принимает пустые сообщения

**ID:** BUG-002  
**Project:** Contact form  
**Priority:** Medium  
**Severity:** Major  
**Environment:** Windows 11 (23H2), Opera One 120.0.5543.93  

---

### Description
При отправке сообщения через форму **Contact** без заполнения полей сайт подтверждает успешную отправку. Это ложное поведение, так как данные фактически не введены.  

---

### Steps to Reproduce
1. Перейти на сайт: [demoblaze](https://www.demoblaze.com/)  
2. Нажать кнопку **Contact**  
3. Не заполняя форму, нажать **Send message**  

---

### Expected Result
Система должна вывести сообщение об ошибке или предупреждение:  
*“Пожалуйста, заполните обязательные поля”*.  

---

### Actual Result
Появляется поп-ап: *“Thanks for the message!!”*, как будто сообщение отправлено успешно.  