# 🏥 AI Healthcare Management System
### Full Stack Java Web Application
**By: Vinod Chavan**

---

## 📌 Project Features

| # | Feature | Description |
|---|---------|-------------|
| 1 | 🩺 AI Symptom Checker | Enter symptoms → AI detects disease + recommends doctor |
| 2 | 📋 AI Report Analyzer | Paste lab report → AI explains results in simple language |
| 3 | 📅 Appointment Booking | Find doctors, book appointments with AI chatbot assistance |
| 4 | 💊 Medicine Reminder | Set & manage daily medicine reminders |
| 5 | 🏥 Bed Management | Real-time hospital bed availability across wards |
| 6 | 🤖 AI Chatbot | 24/7 health assistant answers queries instantly |
| 7 | 🛡️ Admin Panel | Manage users, appointments, beds, doctors |

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | HTML5, CSS3, JavaScript (Vanilla) |
| Backend | Java, Advanced Java, Servlet, JSP |
| Framework | Spring MVC / Java EE MVC Pattern |
| Database | Oracle XE (SQL) |
| Connectivity | JDBC |
| Architecture | MVC (Model-View-Controller) |
| Server | Apache Tomcat 9+ |
| Build Tool | Maven |

---

## 📁 Project Structure

```
HealthCareAI/
├── pom.xml
├── database/
│   └── healthcare_db.sql          ← Run this in Oracle XE first
└── src/main/
    ├── java/com/healthcare/
    │   ├── model/
    │   │   ├── User.java
    │   │   ├── Doctor.java
    │   │   ├── Appointment.java
    │   │   ├── MedicineReminder.java
    │   │   └── HospitalBed.java
    │   ├── dao/
    │   │   ├── UserDAO.java
    │   │   └── AllDAO.java
    │   ├── controller/
    │   │   ├── AuthServlet.java
    │   │   ├── SymptomCheckerServlet.java
    │   │   ├── ReportAnalyzerServlet.java
    │   │   ├── AppointmentServlet.java
    │   │   ├── ReminderServlet.java
    │   │   ├── BedServlet.java
    │   │   └── ChatbotServlet.java
    │   └── util/
    │       ├── DBConnection.java
    │       └── AIEngine.java          ← Core AI logic
    └── webapp/
        ├── css/styles.css
        ├── index.jsp
        ├── login.jsp
        ├── register.jsp
        ├── dashboard.jsp
        ├── symptom-checker.jsp
        ├── symptom-result.jsp
        ├── report-analyzer.jsp
        ├── report-result.jsp
        ├── book-appointment.jsp
        ├── my-appointments.jsp
        ├── medicine-reminder.jsp
        ├── bed-status.jsp
        └── admin-dashboard.jsp
```

---

## ⚙️ Setup Instructions

### Step 1 — Install Requirements
- Java JDK 11+
- Apache Tomcat 9+
- Oracle XE 18c/21c
- Eclipse IDE / IntelliJ IDEA
- Maven 3+

### Step 2 — Database Setup
```sql
-- Open Oracle SQL Plus or SQL Developer
-- Run the file:
@database/healthcare_db.sql
```

### Step 3 — Configure DB Connection
Open `src/main/java/com/healthcare/util/DBConnection.java`
```java
private static final String URL  = "jdbc:oracle:thin:@localhost:1521:xe";
private static final String USER = "system";        // your Oracle username
private static final String PASS = "oracle";        // your Oracle password
```

### Step 4 — Add Oracle JDBC Driver
- Download `ojdbc8.jar` from Oracle website
- Add to project: `WEB-INF/lib/ojdbc8.jar`

### Step 5 — Deploy on Tomcat
```bash
# Maven build
mvn clean package

# Copy WAR to Tomcat
cp target/HealthCareAI.war $TOMCAT_HOME/webapps/

# Start Tomcat
$TOMCAT_HOME/bin/startup.sh
```

### Step 6 — Open in Browser
```
http://localhost:8080/HealthCareAI/
```

---

## 🔑 Default Login Credentials

| Role | Email | Password |
|------|-------|----------|
| Admin | admin@healthcare.com | admin123 |
| Patient | Register new account | — |

---

## 🤖 AI Engine Features

### Symptom Checker
- Detects 20+ diseases from symptom keywords
- Recommends the right specialist
- Assigns severity: HIGH / MEDIUM / LOW

### Report Analyzer
- Detects: Blood Sugar, Hemoglobin, Cholesterol, BP, Thyroid, Infections
- Explains results in simple language
- Recommends specialist based on findings

### AI Chatbot
- Responds to health queries 24/7
- Guides users to right features
- Emergency alert for critical conditions

---

## 📞 Developer Contact
**Vinod Chavan**
- 📧 vinodchavan9518@gmail.com
- 🐙 github.com/vinodchavan9518
- 💼 linkedin.com/in/vinodchavn12
