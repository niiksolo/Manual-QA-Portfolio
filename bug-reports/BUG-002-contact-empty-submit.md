# Bug Report: Contact Form Accepts Empty Messages

**ID:** BUG-002  
**Project:** Contact form  
**Priority:** Medium  
**Severity:** Major  
**Environment:** Windows 11 (23H2), Opera One 120.0.5543.93  

---

### Description
When sending a message through the **Contact** form without filling in any fields, the site confirms successful submission. This is incorrect behavior because no actual data was entered.

---

### Steps to Reproduce
1. Go to the website: [demoblaze](https://www.demoblaze.com/)  
2. Click the **Contact** button  
3. Without filling in the form, click **Send message**  

---

### Expected Result
The system should show an error or warning message:  
*“Please fill out the required fields”*.  

---

### Actual Result
A pop-up appears: *“Thanks for the message!!”*, as if the message was successfully sent.