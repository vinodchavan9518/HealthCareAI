<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*,com.healthcare.model.*" %>

<%
    if(session.getAttribute("user")==null){
        response.sendRedirect("login.jsp");
        return;
    }

    List<Appointment> appts =
        (List<Appointment>)request.getAttribute("appointments");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Appointments - AI HealthCare</title>

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
    padding:15px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    flex-wrap:wrap;
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
    background:#dc3545;
    color:white;
    text-decoration:none;
    padding:9px 16px;
    border-radius:6px;
    font-weight:bold;
}

/* CONTAINER */

.container{
    width:95%;
    max-width:1300px;
    margin:30px auto;
}

/* TITLE */

.page-title{
    color:#0b5ed7;
    margin-bottom:25px;
    font-size:30px;
}

/* TABLE */

.table-card{
    background:white;
    padding:25px;
    border-radius:12px;
    box-shadow:0px 2px 10px rgba(0,0,0,0.08);
}

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
    padding:14px;
    text-align:left;
    font-size:14px;
}

table td{
    padding:14px;
    border-bottom:1px solid #eee;
    font-size:14px;
}

table tr:hover{
    background:#f7f9fc;
}

/* BADGES */

.badge{
    padding:6px 12px;
    border-radius:20px;
    color:white;
    font-size:12px;
    font-weight:bold;
}

.badge-green{
    background:#198754;
}

.badge-yellow{
    background:#ffc107;
    color:#222;
}

.badge-red{
    background:#dc3545;
}

.badge-blue{
    background:#0d6efd;
}

/* EMPTY */

.empty{
    text-align:center;
    padding:40px;
    color:#888;
    font-size:16px;
}

.empty a{
    color:#0b5ed7;
    text-decoration:none;
    font-weight:bold;
}

/* RESPONSIVE */

@media(max-width:900px){

    .navbar{
        flex-direction:column;
        gap:12px;
    }

    .navbar ul{
        flex-wrap:wrap;
        justify-content:center;
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

        <li>
            <a href="book-appointment.jsp">📅 Book Appointment</a>
        </li>

    </ul>

    <a href="logout" class="logout">
        Logout
    </a>

</nav>

<!-- MAIN CONTENT -->

<div class="container">

    <h2 class="page-title">
        📂 My Appointments
    </h2>

    <div class="table-card">

        <div class="table-wrap">

            <table>

                <thead>

                    <tr>

                        <th>#</th>
                        <th>Doctor</th>
                        <th>Specialization</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Symptoms</th>
                        <th>Status</th>

                    </tr>

                </thead>

                <tbody>

                <%

                if(appts != null && !appts.isEmpty()) {

                    int i = 1;

                    for(Appointment a : appts) {

                %>

                    <tr>

                        <td>
                            <%= i++ %>
                        </td>

                        <td>
                            <b>
                                <%= a.getDoctorName() %>
                            </b>
                        </td>

                        <td>
                            <%= a.getSpecialization() %>
                        </td>

                        <td>
                            <%= a.getApptDate() %>
                        </td>

                        <td>
                            ⏰ <%= a.getApptTime() %>
                        </td>

                        <td>
                            <%= a.getSymptoms() != null
                                ? a.getSymptoms()
                                : "-" %>
                        </td>

                        <td>

                        <%

                        String st = a.getStatus();

                        if("CONFIRMED".equals(st)){

                        %>

                            <span class="badge badge-green">
                                ✅ Confirmed
                            </span>

                        <%

                        }else if("PENDING".equals(st)){

                        %>

                            <span class="badge badge-yellow">
                                ⏳ Pending
                            </span>

                        <%

                        }else if("CANCELLED".equals(st)){

                        %>

                            <span class="badge badge-red">
                                ❌ Cancelled
                            </span>

                        <%

                        }else{

                        %>

                            <span class="badge badge-blue">
                                <%= st %>
                            </span>

                        <% } %>

                        </td>

                    </tr>

                <%

                    }

                } else {

                %>

                    <tr>

                        <td colspan="7" class="empty">

                            No appointments found.<br><br>

                            <a href="book-appointment.jsp">
                                📅 Book Appointment Now
                            </a>

                        </td>

                    </tr>

                <% } %>

                </tbody>

            </table>

        </div>

    </div>

</div>

</body>
</html>