
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.healthcare.model.User" %>

<%
User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>AI Healthcare Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#eef2f7;
}

/* ================= NAVBAR ================= */

.navbar{
    width:100%;
    background:#0f172a;
    padding:18px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    position:sticky;
    top:0;
    z-index:1000;
}

.logo{
    color:white;
    text-decoration:none;
    font-size:30px;
    font-weight:700;
}

.logo span{
    color:#38bdf8;
}

.nav-links{
    display:flex;
    gap:25px;
}

.nav-links a{
    color:white;
    text-decoration:none;
    font-size:15px;
    transition:0.3s;
}

.nav-links a:hover{
    color:#38bdf8;
}

.logout{
    background:#ef4444;
    color:white;
    padding:11px 20px;
    border-radius:12px;
    text-decoration:none;
    font-weight:600;
}

/* ================= CONTAINER ================= */

.container{
    width:95%;
    margin:30px auto;
}

/* ================= HERO ================= */

.hero{
    background:linear-gradient(135deg,#0ea5e9,#2563eb);
    padding:60px;
    border-radius:35px;
    color:white;
    margin-bottom:45px;
    box-shadow:0 10px 35px rgba(37,99,235,0.25);
}

.hero h1{
    font-size:55px;
    margin-bottom:15px;
}

.hero p{
    font-size:22px;
    opacity:0.95;
}

/* ================= STATS ================= */

.stats-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:30px;
    margin-bottom:50px;
}

.stat-card{
    background:white;
    padding:40px;
    border-radius:28px;
    text-align:center;
    box-shadow:0 8px 25px rgba(0,0,0,0.07);
    transition:0.3s;
}

.stat-card:hover{
    transform:translateY(-8px);
}

.stat-icon{
    font-size:65px;
    margin-bottom:20px;
}

.stat-title{
    font-size:26px;
    color:#0f172a;
    font-weight:600;
}

/* ================= SECTION ================= */

.section-title{
    font-size:45px;
    margin-bottom:35px;
    color:#0f172a;
}

/* ================= CARDS ================= */

.cards-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(330px,1fr));
    gap:35px;
    margin-bottom:50px;
}

.card{
    background:white;
    padding:45px 35px;
    border-radius:30px;
    text-decoration:none;
    min-height:260px;
    position:relative;
    overflow:hidden;
    box-shadow:0 8px 25px rgba(0,0,0,0.08);
    transition:0.4s;
}

.card:hover{
    transform:translateY(-10px);
    box-shadow:0 18px 40px rgba(37,99,235,0.18);
}

.card::before{
    content:'';
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:6px;
    background:linear-gradient(135deg,#0ea5e9,#2563eb);
}

.card-icon{
    font-size:75px;
    margin-bottom:25px;
}

.card h3{
    font-size:30px;
    margin-bottom:15px;
    color:#0f172a;
}

.card p{
    color:#64748b;
    line-height:28px;
    font-size:16px;
}

/* ================= PROFILE ================= */

.profile{
    background:white;
    padding:40px;
    border-radius:30px;
    box-shadow:0 8px 25px rgba(0,0,0,0.08);
    margin-bottom:40px;
}

.profile h2{
    font-size:34px;
    margin-bottom:25px;
}

.profile table{
    width:100%;
}

.profile td{
    padding:18px;
    border-bottom:1px solid #e2e8f0;
    font-size:18px;
}

.label{
    color:#64748b;
    font-weight:600;
}

.value{
    color:#0f172a;
    font-weight:700;
}

/* ================= HEALTH TIPS ================= */

.health-tip{
    background:white;
    padding:40px;
    border-radius:30px;
    margin-bottom:50px;
    box-shadow:0 8px 25px rgba(0,0,0,0.08);
}

.health-tip h2{
    font-size:34px;
    margin-bottom:25px;
}

.health-tip ul{
    padding-left:25px;
}

.health-tip li{
    margin-bottom:16px;
    font-size:18px;
    color:#475569;
}

/* ================= CHATBOT ================= */

.chat-btn{
    position:fixed;
    right:25px;
    bottom:25px;
    width:80px;
    height:80px;
    border:none;
    border-radius:50%;
    background:linear-gradient(135deg,#0ea5e9,#2563eb);
    color:white;
    font-size:35px;
    cursor:pointer;
    box-shadow:0 8px 25px rgba(0,0,0,0.25);
}

.chat-box{
    position:fixed;
    right:25px;
    bottom:120px;
    width:360px;
    height:500px;
    background:white;
    border-radius:25px;
    overflow:hidden;
    display:none;
    flex-direction:column;
    box-shadow:0 12px 35px rgba(0,0,0,0.25);
}

.chat-box.open{
    display:flex;
}

.chat-header{
    background:#2563eb;
    color:white;
    padding:18px;
    font-weight:600;
}

.chat-messages{
    flex:1;
    padding:18px;
    overflow:auto;
    background:#f8fafc;
}

.msg{
    padding:12px 15px;
    border-radius:15px;
    margin-bottom:12px;
    max-width:80%;
}

.msg-user{
    background:#2563eb;
    color:white;
    margin-left:auto;
}

.msg-bot{
    background:#e2e8f0;
    color:#0f172a;
}

.chat-input{
    display:flex;
}

.chat-input input{
    flex:1;
    padding:16px;
    border:none;
    outline:none;
}

.chat-input button{
    width:70px;
    border:none;
    background:#2563eb;
    color:white;
    font-size:18px;
}

/* ================= FOOTER ================= */

.footer{
    text-align:center;
    padding:25px;
    color:#64748b;
    font-size:16px;
}

/* ================= RESPONSIVE ================= */

@media(max-width:768px){

    .navbar{
        flex-direction:column;
        gap:15px;
    }

    .nav-links{
        flex-wrap:wrap;
        justify-content:center;
    }

    .hero{
        padding:35px;
    }

    .hero h1{
        font-size:38px;
    }

    .section-title{
        font-size:35px;
    }
}

</style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <a href="dashboard.jsp" class="logo">
        🏥 AI<span>HealthCare</span>
    </a>

    <div class="nav-links">

        <a href="symptom-checker">Symptom Check</a>

        <a href="report-analyzer">Reports</a>

        <a href="book-appointment.jsp">Appointments</a>

        <a href="medicine-reminder.jsp">Reminders</a>

        <a href="bed-status.jsp">Bed Status</a>

    </div>

    <a href="logout" class="logout">
        Logout
    </a>

</div>

<!-- MAIN -->

<div class="container">

    <!-- HERO -->

    <div class="hero">

        <h1>
            👋 Welcome,
            <%= user.getFullName() %>
        </h1>

        <p>
            Your AI-powered healthcare management dashboard.
        </p>

    </div>

    <!-- STATS -->

    <div class="stats-grid">

        <div class="stat-card">
            <div class="stat-icon">🩺</div>
            <div class="stat-title">AI Symptom Checker</div>
        </div>

        <div class="stat-card">
            <div class="stat-icon">📋</div>
            <div class="stat-title">Report Analyzer</div>
        </div>

        <div class="stat-card">
            <div class="stat-icon">📅</div>
            <div class="stat-title">Appointments</div>
        </div>

        <div class="stat-card">
            <div class="stat-icon">💊</div>
            <div class="stat-title">Medicine Reminder</div>
        </div>

    </div>

    <!-- QUICK ACTION -->

    <h2 class="section-title">
        🚀 Quick Actions
    </h2>

    <div class="cards-grid">

        <a href="symptom-checker" class="card">
            <div class="card-icon">🩺</div>
            <h3>AI Symptom Checker</h3>
            <p>
                Analyze symptoms using AI technology and get specialist suggestions.
            </p>
        </a>

        <a href="report-analyzer" class="card">
            <div class="card-icon">📋</div>
            <h3>Medical Reports</h3>
            <p>
                Upload and analyze medical reports instantly.
            </p>
        </a>

        <a href="book-appointment.jsp" class="card">
            <div class="card-icon">📅</div>
            <h3>Book Appointment</h3>
            <p>
                Book doctor appointments online quickly and easily.
            </p>
        </a>

        <a href="my-appointments.jsp" class="card">
            <div class="card-icon">🗓️</div>
            <h3>My Appointments</h3>
            <p>
                View upcoming and completed appointments.
            </p>
        </a>

        <a href="medicine-reminder.jsp" class="card">
            <div class="card-icon">💊</div>
            <h3>Medicine Reminder</h3>
            <p>
                Set medicine reminders and alerts daily.
            </p>
        </a>

        <a href="bed-status.jsp" class="card">
            <div class="card-icon">🏥</div>
            <h3>Bed Availability</h3>
            <p>
                Check live hospital bed availability.
            </p>
        </a>

        <a href="ambulance.jsp" class="card">
            <div class="card-icon">🚑</div>
            <h3>Ambulance Booking</h3>
            <p>
                Book emergency ambulance services instantly.
            </p>
        </a>

        <a href="payment.jsp" class="card">
            <div class="card-icon">💳</div>
            <h3>Online Payment</h3>
            <p>
                Secure online payment for appointments.
            </p>
        </a>

        <a href="#" class="card" onclick="toggleChat()">
            <div class="card-icon">🤖</div>
            <h3>AI Health Assistant</h3>
            <p>
                Chat with AI healthcare assistant anytime.
            </p>
        </a>

    </div>

    <!-- PROFILE -->

    <div class="profile">

        <h2>
            👤 My Profile
        </h2>

        <table>

            <tr>
                <td class="label">Full Name</td>
                <td class="value">
                    <%= user.getFullName() %>
                </td>
            </tr>

            <tr>
                <td class="label">Email</td>
                <td class="value">
                    <%= user.getEmail() %>
                </td>
            </tr>

            <tr>
                <td class="label">Phone</td>
                <td class="value">
                    <%= user.getPhone() %>
                </td>
            </tr>

            <tr>
                <td class="label">Age</td>
                <td class="value">
                    <%= user.getAge() %>
                </td>
            </tr>

            <tr>
                <td class="label">Blood Group</td>
                <td class="value" style="color:red;">
                    <%= user.getBloodGroup() %>
                </td>
            </tr>

        </table>

    </div>

    <!-- HEALTH TIPS -->

    <div class="health-tip">

        <h2>
            🧠 AI Daily Health Tips
        </h2>

        <ul>

            <li>💧 Drink at least 8 glasses of water daily</li>

            <li>🚶 Walk 30 minutes every day</li>

            <li>🥗 Eat healthy green vegetables</li>

            <li>😴 Sleep minimum 7 hours daily</li>

            <li>🩺 Regular health checkups are important</li>

        </ul>

    </div>

</div>

<!-- CHATBOT -->

<div class="chat-box" id="chatBox">

    <div class="chat-header">
        🤖 AI Health Assistant
    </div>

    <div class="chat-messages" id="chatMessages">

        <div class="msg msg-bot">
            Hello 👋 How can I help you today?
        </div>

    </div>

    <div class="chat-input">

        <input type="text"
               id="chatInput"
               placeholder="Ask health questions...">

        <button onclick="sendChat()">
            ➤
        </button>

    </div>

</div>

<button class="chat-btn"
        onclick="toggleChat()">

    🤖

</button>

<!-- FOOTER -->

<div class="footer">
    © 2026 AI Healthcare Management System
</div>

<script>

<button onclick="getLocation()">
Get My Location
</button>

<p id="locationText"></p>

function toggleChat(){

    document
    .getElementById("chatBox")
    .classList.toggle("open");
}

function sendChat(){

    let input =
    document.getElementById("chatInput");

    let msg =
    input.value;

    if(msg.trim() === "")
        return;

    let chat =
    document.getElementById("chatMessages");

    chat.innerHTML +=
    "<div class='msg msg-user'>" +
    msg +
    "</div>";

    chat.innerHTML +=
    "<div class='msg msg-bot'>AI is analyzing your health query...</div>";

    input.value = "";

    chat.scrollTop =
    chat.scrollHeight;
}

</script>

</body>

</html>