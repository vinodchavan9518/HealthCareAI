<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
String role = (String) session.getAttribute("userRole");

if(role == null || !"ADMIN".equals(role)){

    response.sendRedirect("login.jsp");

    return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Admin Dashboard</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#f1f5f9;
}

/* NAVBAR */

.navbar{
    width:100%;
    background:#0f172a;
    padding:18px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.logo{
    color:white;
    font-size:24px;
    font-weight:700;
    text-decoration:none;
}

.logo span{
    color:#38bdf8;
}

.nav-links{
    display:flex;
    gap:20px;
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
    padding:10px 18px;
    border-radius:8px;
    color:white;
    text-decoration:none;
    font-weight:600;
}

.logout:hover{
    background:#dc2626;
}

/* CONTAINER */

.container{
    padding:40px;
}

.heading{
    margin-bottom:30px;
}

.heading h1{
    font-size:34px;
    color:#0f172a;
}

.heading p{
    color:#64748b;
    margin-top:6px;
}

/* CARDS */

.cards{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:25px;
}

.card{
    background:white;
    border-radius:20px;
    padding:30px;
    text-decoration:none;
    transition:0.3s;
    box-shadow:0px 5px 15px rgba(0,0,0,0.08);
}

.card:hover{
    transform:translateY(-5px);
    box-shadow:0px 10px 20px rgba(0,0,0,0.15);
}

.icon{
    width:70px;
    height:70px;
    border-radius:50%;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:30px;
    margin-bottom:20px;
}

/* CARD COLORS */

.blue{
    background:#dbeafe;
    color:#2563eb;
}

.green{
    background:#dcfce7;
    color:#16a34a;
}

.orange{
    background:#ffedd5;
    color:#ea580c;
}

.purple{
    background:#ede9fe;
    color:#7c3aed;
}

.card h3{
    color:#0f172a;
    margin-bottom:10px;
}

.card p{
    color:#64748b;
    font-size:14px;
    line-height:22px;
}

/* FOOTER */

.footer{
    text-align:center;
    padding:20px;
    margin-top:40px;
    color:#64748b;
    font-size:14px;
}

</style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <a href="admin-dashboard.jsp" class="logo">
        🏥 AI<span>HealthCare</span>
    </a>

    <div class="nav-links">

        <a href="admin-dashboard.jsp">
            Dashboard
        </a>

        <a href="admin-appointments.jsp">
            Appointments
        </a>

        <a href="admin-beds.jsp">
            Beds
        </a>

        <a href="admin-users.jsp">
            Patients
        </a>

        <a href="admin-doctors.jsp">
            Doctors
        </a>

    </div>

    <a href="logout" class="logout">
        Logout
    </a>

</div>

<!-- CONTENT -->

<div class="container">

    <div class="heading">

        <h1>
            🛡️ Admin Dashboard
        </h1>

        <p>
            Manage hospital appointments, patients, doctors and beds.
        </p>

    </div>

    <!-- CARDS -->

    <div class="cards">

        <!-- APPOINTMENTS -->

        <a href="admin-appointments.jsp" class="card">

            <div class="icon blue">
                📅
            </div>

            <h3>
                Manage Appointments
            </h3>

            <p>
                View, confirm and manage all patient appointments.
            </p>

        </a>

        <!-- BEDS -->

        <a href="admin-beds.jsp" class="card">

            <div class="icon green">
                🏥
            </div>

            <h3>
                Hospital Beds
            </h3>

            <p>
                Update hospital bed status and patient assignments.
            </p>

        </a>

        <!-- USERS -->

        <a href="admin-users.jsp" class="card">

            <div class="icon orange">
                👥
            </div>

            <h3>
                All Patients
            </h3>

            <p>
                View registered patients and healthcare records.
            </p>

        </a>

        <!-- DOCTORS -->

        <a href="admin-doctors.jsp" class="card">

            <div class="icon purple">
                👨‍⚕️
            </div>

            <h3>
                Doctors Management
            </h3>

            <p>
                Manage doctor profiles, availability and schedules.
            </p>

        </a>

    </div>

</div>

<!-- FOOTER -->

<div class="footer">

    © 2026 AI Healthcare Management System

</div>

</body>

</html>