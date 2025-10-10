# Bug Report: Name Fields Accept Numbers and Special Characters

**ID:** BUG-001  
**Project:** Registration form  
**Priority:** Medium  
**Severity:** Major  
**Environment:** Windows 11 (23H2), Opera One 120.0.5543.93  

---

### Description
In the registration form, the fields **First Name**, **Middle Name**, and **Last Name** allow entering numbers and special characters. The data is saved and the system does not show any warnings.

---

### Steps to Reproduce
1. Go to the website: [exe.ua](https://exe.ua)  
2. Click the **Sign up** button  
3. Enter numbers or symbols in the name fields (for example: `123`, `@#$`)  
4. Fill in the other fields correctly  
5. Click **Sign up**  

---

### Expected Result
The system should reject invalid input and display an error message:  
*“Only letters allowed”*.  
Registration should not be completed.

---

### Actual Result
Registration is completed successfully, and numbers or symbols are saved in the name fields.

---

### Attachments
<img src="screenshots/bug1.png" width="250"/> <img src="screenshots/bug1.1.png" width="250"/>  