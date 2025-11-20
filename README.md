# 📝 Academic Information System (AIS)

## 📖 Project Description

The **Academic Information System (AIS)** is a web-based management platform built using **JSP**, **Servlets**, **Apache Tomcat**, and **MySQL**.  
It provides administrators, lecturers, academic staff, and students with a structured system for managing academic data efficiently.

This project focuses on delivering a **simple, clean, and functional interface** for performing CRUD operations across multiple academic modules such as Role, Jenis Kelamin, Jenjang, Prodi, User, and Mahasiswa. 

Additionally, the system includes a **CSV import feature** for bulk student data processing.

> **Note:**  
> This system currently supports **desktop layout only** and does not include advanced responsive UI or JavaScript-based interactivity.

---

## ✨ Main Features

### 🔐 Authentication
- Secure login  
- Role-based access control:  
  - **Admin** → full access  
  - **Dosen & Tendik** → access to Mahasiswa only  
  - **Mahasiswa** → login only

### 📦 Master Data (CRUD)
- Role Management
- Jenis Kelamin Management
- Jenjang Management
- Prodi Management
- User Management
- Mahasiswa Management

### 📥 CSV Import and Export
- Bulk import of student data  
- Automatic validation
- Export user data

---

## 🧰 Tech Stack

- **Backend:** JSP, Servlet  
- **Server:** Apache Tomcat  
- **Database:** MySQL  
- **Styling:** Custom CSS  
- **Runtime:** JDK  

---

## 🚀 Getting Started

### 1. Prerequisites
- Java JDK 21+
- Apache Tomcat 11  
- MySQL Server  
- IDE (VSCode/Eclipse/IntelliJ/NetBeans)

### 2. Clone Repository
Clone the project directly into the Apache Tomcat → webapps directory, as Tomcat automatically treats each folder inside webapps as a deployable web application.
```
cd "C:/Program Files/Apache Software Foundation/Tomcat <your-tomcat-version>/webapps"
git clone <your-repo-url>
```
This allows Tomcat to automatically detect and deploy the application.

### 3. Start MySQL Server
Adjust database configuration at:
```
WEB-INF/includes/config.jsp
```
Then import the provided SQL file into MySQL:
```
mysql -u root -p < path/to/db.sql
```
Or using phpMyAdmin:
- Open phpMyAdmin
- Create a new database
- Go to Import
- Select db.sql
- Click Go
Make sure the imported database name matches the configuration in the project.

### 4. Start Apache Tomcat
Start the Tomcat service using:
- services.msc
- Windows Service Manager
- Tomcat Monitor
- Your IDE (Eclipse / IntelliJ / NetBeans)
Once Tomcat is running, access the application at
```
http://localhost:8080/<project-folder-name>/
```
Login with sample credential:
```
# user / pass

admin / admin

dosen_si / dosen
dosen_ti / dosen

budi_tendik / tendik

mhs01 / 123456
mhs02 / 123456
mhs03 / 123456
...

```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

© 2025 Yoseph Kevin & Ryan Darmajaya. All rights reserved.
