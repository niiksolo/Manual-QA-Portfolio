# Bug Report: Поля имени принимают цифры и спецсимволы

**ID:** BUG-001  
**Project:** Registration form  
**Priority:** Medium  
**Severity:** Major  
**Environment:** Windows 11 (23H2), Opera One 120.0.5543.93  
**Attachments:** [Скриншот 1](screenshots/bug1.png), [Скриншот 2](screenshots/bug1.1.png)

---

### Description
Поля **First Name**, **Middle Name**, **Last Name** в форме регистрации позволяют вводить цифры и специальные символы. Данные сохраняются без каких-либо предупреждений.

---

### Steps to Reproduce
1. Открыть сайт: `https://exe.ua`
2. Нажать кнопку **Sign up**.
3. Ввести цифры или спецсимволы (например: `123`, `@#$`) в поля First/Middle/Last Name.
4. Заполнить остальные поля корректно.
5. Нажать **Sign up**.

---

### Expected Result
Система должна отклонять недопустимые символы и выводить сообщение об ошибке:  
*“Only letters allowed”*.  
Регистрация не должна завершаться успешно.

---

### Actual Result
Регистрация проходит успешно, поле имени сохраняется с цифрами/символами.