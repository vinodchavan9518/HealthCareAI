<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*,com.healthcare.model.*" %>

<%
    if(session.getAttribute("user")==null){
        response.sendRedirect("login.jsp");
        return;
    }

    List<MedicineReminder> reminders =
        (List<MedicineReminder>)request.getAttribute("reminders");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Medicine Reminder - AI HealthCare</title>

<link rel="stylesheet" href="css/styles.css">

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial, sans-serif;
    background:#f4f7fb;
}

/* NAVBAR */

.navbar{
    background:#0b5ed7;
    padding:14px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.brand{
    color:white;
    text-decoration:none;
    font-size:24px;
    font-weight:bold;
}

.brand span{
    color:#ffd166;
}

.navbar ul{
    list-style:none;
    display:flex;
    gap:20px;
    margin:0;
    padding:0;
}

.navbar ul li a{
    color:white;
    text-decoration:none;
    font-weight:600;
}

.logout{
    color:white;
    text-decoration:none;
    background:#dc3545;
    padding:8px 16px;
    border-radius:6px;
}

/* CONTAINER */

.container{
    width:95%;
    max-width:1300px;
    margin:30px auto;
}

/* GRID */

.main-grid{
    display:grid;
    grid-template-columns:1fr 1.2fr;
    gap:25px;
}

/* CARD */

.card{
    background:white;
    padding:25px;
    border-radius:12px;
    box-shadow:0px 2px 10px rgba(0,0,0,0.08);
}

.card h2{
    margin-top:0;
    color:#0b5ed7;
}

/* FORM */

.form-group{
    margin-bottom:16px;
}

.form-group label{
    display:block;
    margin-bottom:6px;
    font-weight:bold;
    color:#444;
}

.form-group input,
.form-group select{
    width:100%;
    padding:11px;
    border:1px solid #ccc;
    border-radius:6px;
    font-size:14px;
}

.two-col{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:15px;
}

.btn-primary{
    width:100%;
    padding:12px;
    border:none;
    background:#0b5ed7;
    color:white;
    font-size:16px;
    border-radius:6px;
    cursor:pointer;
    font-weight:bold;
}

.btn-primary:hover{
    background:#084298;
}

/* ALERT */

.alert{
    padding:12px;
    border-radius:6px;
    margin-bottom:15px;
    font-size:14px;
}

.alert-success{
    background:#d1e7dd;
    color:#0f5132;
}

.alert-danger{
    background:#f8d7da;
    color:#842029;
}

/* TABLE */

.table-wrap{
    overflow-x:auto;
}

table{
    width:100%;
    border-collapse:collapse;
}

table th{
    background:#0b5ed7;
    color:white;
    padding:12px;
    text-align:left;
}

table td{
    padding:12px;
    border-bottom:1px solid #eee;
}

table tr:hover{
    background:#f7f9fc;
}

/* BUTTON */

.btn-red{
    background:#dc3545;
    color:white;
    border:none;
    padding:8px 12px;
    border-radius:5px;
    cursor:pointer;
}

.btn-red:hover{
    background:#bb2d3b;
}

/* BADGE */

.badge{
    background:#e7f1ff;
    color:#0b5ed7;
    padding:4px 10px;
    border-radius:20px;
    font-size:12px;
    font-weight:bold;
}

/* MOBILE */

@media(max-width:900px){

    .main-grid{
        grid-template-columns:1fr;
    }

    .navbar{
        flex-direction:column;
        gap:12px;
    }

}

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar">

    <a href="dashboard.jsp" class="brand">
        🏥 AI<span>HealthCare</span>
    </a>

    <ul>
        <li>
            <a href="dashboard.jsp">🏠 Dashboard</a>
        </li>
    </ul>

    <a href="logout" class="logout">
        Logout
    </a>

</nav>

<!-- MAIN -->

<div class="container">

    <div class="main-grid">

        <!-- ADD REMINDER -->

        <div class="card">

            <h2>💊 Add Medicine Reminder</h2>

            <% if(request.getAttribute("success") != null){ %>

                <div class="alert alert-success">
                    ✅ <%= request.getAttribute("success") %>
                </div>

            <% } %>

            <% if(request.getAttribute("error") != null){ %>

                <div class="alert alert-danger">
                    ❌ <%= request.getAttribute("error") %>
                </div>

            <% } %>

            <form action="reminder" method="post">

                <input type="hidden" name="action" value="add">

                <div class="form-group">

                    <label>Medicine Name</label>

                    <input type="text"
                           name="medicineName"
                           placeholder="Enter medicine name"
                           required>

                </div>

                <div class="form-group">

                    <label>Dosage</label>

                    <input type="text"
                           name="dosage"
                           placeholder="Example: 1 Tablet"
                           required>

                </div>

                <div class="form-group">

                    <label>Frequency</label>

                    <select name="frequency" required>

                        <option value="">Select Frequency</option>

                        <option>Once Daily</option>
                        <option>Twice Daily</option>
                        <option>Three Times Daily</option>
                        <option>Every 6 Hours</option>
                        <option>Weekly</option>

                    </select>

                </div>

                <div class="form-group">

                    <label>Reminder Time</label>

                    <input type="time"
                           name="reminderTime"
                           required>

                </div>

                <div class="two-col">

                    <div class="form-group">

                        <label>Start Date</label>

                        <input type="date"
                               name="startDate"
                               required>

                    </div>

                    <div class="form-group">

                        <label>End Date</label>

                        <input type="date"
                               name="endDate">

                    </div>

                </div>

                <button type="submit" class="btn-primary">
                    ➕ Add Reminder
                </button>

            </form>

        </div>

        <!-- REMINDER LIST -->

        <div class="card">

            <h2>📋 Active Medicine Reminders</h2>

            <div class="table-wrap">

                <table>

                    <thead>

                        <tr>
                            <th>Medicine</th>
                            <th>Dosage</th>
                            <th>Frequency</th>
                            <th>Time</th>
                            <th>Action</th>
                        </tr>

                    </thead>

                    <tbody>

                    <%

                    if(reminders != null && !reminders.isEmpty()){

                        for(MedicineReminder r : reminders){

                    %>

                        <tr>

                            <td>
                                <b>
                                    <%= r.getMedicineName() %>
                                </b>
                            </td>

                            <td>
                                <%= r.getDosage() %>
                            </td>

                            <td>
                                <span class="badge">
                                    <%= r.getFrequency() %>
                                </span>
                            </td>

                            <td>
                                ⏰ <%= r.getReminderTime() %>
                            </td>

                            <td>

                                <a href="reminder?action=delete&id=<%= r.getReminderId() %>">

                                    <button type="button" class="btn-red">
                                        🗑 Remove
                                    </button>

                                </a>

                            </td>

                        </tr>

                    <%

                        }

                    }else{

                    %>

                        <tr>

                            <td colspan="5"
                                style="text-align:center;
                                       padding:30px;
                                       color:#999;">

                                No active reminders found

                            </td>

                        </tr>

                    <% } %>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

</div>

</body>
</html>