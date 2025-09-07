# Bug Report: Registration Validation Passes with Incomplete Phone Number

**ID:** BUG-013  
**Project:** MD Fashion website  
**Priority:** High  
**Severity:** Major  
**Environment:** Windows 11 (23H2), Opera One 120.0.5543.93  

---

### Description
When using the **“Get code via SMS”** registration option, the system incorrectly accepts phone numbers with too few digits. The form passes validation and proceeds with the registration flow, instead of blocking the input.  

---

### Preconditions
Navigate to the website: [MD Fashion](https://md-fashion.com.ua/)  

---

### Steps to Reproduce
1. In the header, click **“Зареєструватися”** (Register).  
2. In the **“Phone”** field, enter an invalid short number (e.g., `11111`).  
3. Click **“Підтвердити”** (Confirm).  

---

### Expected Result
The system should reject the input, showing an error message that the phone number is invalid. Registration must not proceed until a valid number is entered.  

---

### Actual Result
A new window appears with the text:  
*"Введіть код з Viber або SMS отриманого на номер"* (Enter the code from Viber or SMS received on the number).  

---

### Attachments
<img src="screenshots/bug4.png" width="400"/>  