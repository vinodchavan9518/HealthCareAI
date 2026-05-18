<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
if(session.getAttribute("user") == null){

    response.sendRedirect("login.jsp");

    return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Book Appointment</title>

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
    transition:0.3s;
}

.nav-links a:hover{
    color:#38bdf8;
}

.logout{
    background:#ef4444;
    color:white;
    padding:10px 18px;
    border-radius:8px;
    text-decoration:none;
    font-weight:600;
}

.logout:hover{
    background:#dc2626;
}

/* CONTAINER */

.container{
    display:flex;
    justify-content:center;
    padding:40px 20px;
}

/* FORM CARD */

.form-card{
    width:100%;
    max-width:650px;
    background:white;
    padding:35px;
    border-radius:20px;
    box-shadow:0px 5px 20px rgba(0,0,0,0.08);
}

.form-card h2{
    color:#0f172a;
    margin-bottom:25px;
    text-align:center;
}

/* ALERT */

.alert{
    padding:14px;
    border-radius:10px;
    margin-bottom:20px;
    font-size:14px;
}

.success{
    background:#dcfce7;
    color:#166534;
}

.error{
    background:#fee2e2;
    color:#991b1b;
}

/* FORM */

.form-group{
    margin-bottom:20px;
}

.form-group label{
    display:block;
    margin-bottom:8px;
    color:#334155;
    font-weight:500;
}

.form-group input,
.form-group select,
.form-group textarea{
    width:100%;
    padding:14px;
    border:1px solid #cbd5e1;
    border-radius:10px;
    font-size:14px;
    outline:none;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus{
    border:1px solid #38bdf8;
}

/* BUTTON */

.btn{
    width:100%;
    background:#0ea5e9;
    color:white;
    border:none;
    padding:15px;
    border-radius:10px;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    background:#0284c7;
}

/* FOOTER */

.footer{
    text-align:center;
    padding:20px;
    color:#64748b;
    font-size:14px;
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

        <a href="dashboard.jsp">
            Dashboard
        </a>

        <a href="my-appointments.jsp">
            My Appointments
        </a>

    </div>

    <a href="logout" class="logout">
        Logout
    </a>

</div>

<!-- FORM -->

<div class="container">

    <div class="form-card">

        <h2>
            📅 Book Doctor Appointment
        </h2>

        <% if(request.getAttribute("success") != null){ %>

            <div class="alert success">

                ✅ <%= request.getAttribute("success") %>

            </div>

        <% } %>

        <% if(request.getAttribute("error") != null){ %>

            <div class="alert error">

                ❌ <%= request.getAttribute("error") %>

            </div>

        <% } %>

        <form action="appointment" method="post">

            <input type="hidden"
                   name="action"
                   value="book">

            <!-- DOCTOR -->

            <div class="form-group">

                <label>
                    Select Doctor
                </label>

                <select name="doctorId" required>

                    <option value="">
                        -- Select Doctor --
                    </option>

                    <option value="1">
                        Dr. Rahul Sharma — Cardiologist (₹800)
                    </option>

                    <option value="2">
                        Dr. Priya Mehta — Neurologist (₹900)
                    </option>

                    <option value="3">
                        Dr. Amit Joshi — General Physician (₹500)
                    </option>

                    <option value="4">
                        Dr. Sunita Patil — Dermatologist (₹700)
                    </option>

                    <option value="5">
                        Dr. Vikram Rao — Orthopedic (₹1000)
                    </option>

                </select>

            </div>

            <!-- DATE -->

            <div class="form-group">

                <label>
                    Appointment Date
                </label>

                <input type="date"
                       name="apptDate"
                       required
                       min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">

            </div>

            <!-- TIME -->

            <div class="form-group">

                <label>
                    Preferred Time
                </label>

                <select name="apptTime" required>

                    <option>
                        09:00 AM
                    </option>

                    <option>
                        10:00 AM
                    </option>

                    <option>
                        11:00 AM
                    </option>

                    <option>
                        12:00 PM
                    </option>

                    <option>
                        02:00 PM
                    </option>

                    <option>
                        03:00 PM
                    </option>

                    <option>
                        04:00 PM
                    </option>

                    <option>
                        05:00 PM
                    </option>

                </select>

            </div>

            <!-- SYMPTOMS -->

            <div class="form-group">

                <label>
                    Describe Symptoms
                </label>

                <textarea name="symptoms"
                          rows="4"
                          placeholder="Describe symptoms or reason for appointment..."
                          style="resize:none;"></textarea>

            </div>

            <!-- NOTES -->

            <div class="form-group">

                <label>
                    Additional Notes
                </label>

                <input type="text"
                       name="notes"
                       placeholder="Any additional information">

            </div>

            <!-- BUTTON -->

            <button type="submit" class="btn">

                ✅ Confirm Appointment

            </button>

        </form>

    </div>

</div>

<!-- FOOTER -->

<div class="footer">

    © 2026 AI Healthcare Management System

</div>

</body>

</html>