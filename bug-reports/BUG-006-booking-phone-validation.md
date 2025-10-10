# Bug Report: Booking Form Accepts Incorrect Phone Number

**ID:** BUG-006  
**Project:** Booking form  
**Priority:** High  
**Severity:** Major  
**Environment:** Windows 11 (23H2), Opera One 120.0.5543.93  

---

### Description
In the ticket booking form, the **Phone** field allows entering invalid data. The input passes validation, and the booking request is submitted successfully.

---

### Preconditions
Go to the website: [KS-TRANS](https://kstrans.com.ua)  

---

### Steps to Reproduce
1. Click **“Routes”** at the top of the page  
2. In the list, select **“Germany”**  
3. On the new page, find the route **“Ukraine – Germany”**  
4. Click **“Book”**  
5. Fill in the booking form fields:  
   - Contact Person → `1`  
   - Phone → `1111111111111111`  
6. Click **“Send”**  

---

### Expected Result
The system should show an error for the invalid phone number.  
The booking should not be submitted.  

---

### Actual Result
A window appears confirming successful booking, even though the phone number is invalid.  

---

### Attachments
<img src="screenshots/bug6-1.png" width="300"/>  
<img src="screenshots/bug6-2.png" width="300"/>  