<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ page import="java.util.*,com.healthcare.model.*" %>

<%
if(session.getAttribute("user") == null){

    response.sendRedirect("login.jsp");

    return;
}
%>

<%
List<HospitalBed> beds =
(List<HospitalBed>) request.getAttribute("beds");
%>

<%
int available =
request.getAttribute("available") != null
? (int) request.getAttribute("available") : 0;
%>

<%
int occupied =
request.getAttribute("occupied") != null
? (int) request.getAttribute("occupied") : 0;
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Hospital Bed Status</title>

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
    padding:40px;
}

.heading{
    margin-bottom:30px;
}

.heading h1{
    color:#0f172a;
    font-size:34px;
}

.heading p{
    color:#64748b;
    margin-top:8px;
}

/* STATS */

.stats{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:20px;
    margin-bottom:35px;
}

.card{
    background:white;
    border-radius:18px;
    padding:25px;
    box-shadow:0px 5px 15px rgba(0,0,0,0.08);
}

.card h2{
    font-size:34px;
    margin-bottom:10px;
}

.card p{
    color:#64748b;
    font-size:15px;
}

.green{
    border-left:6px solid #22c55e;
}

.red{
    border-left:6px solid #ef4444;
}

.blue{
    border-left:6px solid #3b82f6;
}

/* TABLE */

.table-box{
    background:white;
    border-radius:18px;
    padding:25px;
    box-shadow:0px 5px 15px rgba(0,0,0,0.08);
    overflow:auto;
}

table{
    width:100%;
    border-collapse:collapse;
}

table th{
    background:#0f172a;
    color:white;
    padding:15px;
    text-align:left;
    font-size:14px;
}

table td{
    padding:14px;
    border-bottom:1px solid #e2e8f0;
    font-size:14px;
}

.badge{
    padding:6px 12px;
    border-radius:30px;
    font-size:12px;
    font-weight:600;
}

.available{
    background:#dcfce7;
    color:#15803d;
}

.occupied{
    background:#fee2e2;
    color:#b91c1c;
}

.empty{
    text-align:center;
    padding:30px;
    color:#64748b;
}

/* FOOTER */

.footer{
    text-align:center;
    margin-top:40px;
    padding:20px;
    color:#64748b;
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

        <a href="bed-status">
            Beds
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
            🏥 Hospital Bed Availability
        </h1>

        <p>
            View live hospital bed status and patient occupancy.
        </p>

    </div>

    <!-- STATS -->

    <div class="stats">

        <div class="card green">

            <h2>
                <%= available %>
            </h2>

            <p>
                Available Beds
            </p>

        </div>

        <div class="card red">

            <h2>
                <%= occupied %>
            </h2>

            <p>
                Occupied Beds
            </p>

        </div>

        <div class="card blue">

            <h2>
                <%= available + occupied %>
            </h2>

            <p>
                Total Beds
            </p>

        </div>

    </div>

    <!-- TABLE -->

    <div class="table-box">

        <table>

            <thead>

                <tr>

                    <th>ID</th>
                    <th>Ward</th>
                    <th>Bed Number</th>
                    <th>Type</th>
                    <th>Status</th>
                    <th>Patient</th>
                    <th>Doctor</th>
                    <th>Admitted Date</th>

                </tr>

            </thead>

            <tbody>

            <%

            if(beds != null && !beds.isEmpty()){

                int i = 1;

                for(HospitalBed b : beds){

            %>

                <tr>

                    <td>
                        <%= i++ %>
                    </td>

                    <td>
                        <b><%= b.getWardName() %></b>
                    </td>

                    <td>
                        <%= b.getBedNumber() %>
                    </td>

                    <td>
                        <%= b.getBedType() %>
                    </td>

                    <td>

                    <% if("AVAILABLE".equals(b.getStatus())){ %>

                        <span class="badge available">
                            ✅ Available
                        </span>

                    <% } else { %>

                        <span class="badge occupied">
                            🔴 Occupied
                        </span>

                    <% } %>

                    </td>

                    <td>
                        <%= b.getPatientName() != null ? b.getPatientName() : "-" %>
                    </td>

                    <td>
                        <%= b.getDoctorName() != null ? b.getDoctorName() : "-" %>
                    </td>

                    <td>
                        <%= b.getAdmittedDate() != null ? b.getAdmittedDate() : "-" %>
                    </td>

                </tr>

            <%
                }

            } else {
            %>

                <tr>

                    <td colspan="8" class="empty">

                        No Bed Data Available

                    </td>

                </tr>

            <%
            }
            %>

            </tbody>

        </table>

    </div>

</div>

<!-- FOOTER -->

<div class="footer">

    © 2026 AI Healthcare Management System

</div>

</body>

</html>