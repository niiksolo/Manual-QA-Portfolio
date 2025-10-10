# Bug Report: Registration Works with Incorrect Phone Number

**ID:** BUG-004  
**Project:** Registration form  
**Priority:** High  
**Severity:** Major  
**Environment:** Windows 11 (23H2), Opera One 120.0.5543.93  

---

### Description
When registering via **“Receive code via SMS”**, the system accepts a phone number of insufficient length and continues the process without a validation error.

---

### Preconditions
Open the website: [MD Fashion](https://md-fashion.ua)

---

### Steps to Reproduce
1. Click **“Register”** in the header  
2. Enter a short phone number in the **“Phone”** field (e.g., `11111`)  
3. Click **“Confirm”**  

---

### Expected Result
An error should appear for the invalid phone number; the system should not proceed to the code entry step.

---

### Actual Result
A window opens with the message: *“Enter the code from Viber or SMS sent to the number”*, even though the number is incorrect.

---

### Attachments
<img src="screenshots/bug4.png" width="300"/>   