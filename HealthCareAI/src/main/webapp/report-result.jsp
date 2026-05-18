<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
    if(session.getAttribute("user")==null){
        response.sendRedirect("login.jsp");
        return;
    }

    String analysis = (String)request.getAttribute("analysis");

    if(analysis != null){
        analysis = analysis.replace("\n","<br>");
    }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>AI Report Analysis Result</title>

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
    background:#f4f7fb;
    min-height:100vh;
}

/* NAVBAR */

.navbar{
    width:100%;
    background:linear-gradient(90deg,#0f172a,#1e3a8a,#2563eb);
    padding:16px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0px 4px 15px rgba(0,0,0,0.15);
}

.brand{
    color:white;
    text-decoration:none;
    font-size:24px;
    font-weight:700;
}

.brand span{
    color:#93c5fd;
}

.navbar ul{
    list-style:none;
    display:flex;
    gap:20px;
}

.navbar ul li a{
    color:white;
    text-decoration:none;
    font-size:15px;
    transition:0.3s;
}

.navbar ul li a:hover{
    color:#dbeafe;
}

.logout{
    background:#ef4444;
    color:white;
    padding:10px 18px;
    border-radius:10px;
    text-decoration:none;
    font-weight:600;
    transition:0.3s;
}

.logout:hover{
    background:#dc2626;
}

/* MAIN */

.container{
    width:100%;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:50px 20px;
}

/* RESULT CARD */

.result-box{
    width:100%;
    max-width:850px;
    background:white;
    padding:35px;
    border-radius:20px;
    box-shadow:0px 10px 30px rgba(0,0,0,0.08);
    animation:fadeIn 0.8s ease;
}

@keyframes fadeIn{
    from{
        opacity:0;
        transform:translateY(20px);
    }
    to{
        opacity:1;
        transform:translateY(0px);
    }
}

.icon{
    text-align:center;
    font-size:60px;
    margin-bottom:10px;
}

h2{
    text-align:center;
    color:#0f172a;
    font-size:30px;
    margin-bottom:10px;
}

.subtitle{
    text-align:center;
    color:#64748b;
    font-size:14px;
    margin-bottom:30px;
    line-height:1.7;
}

/* ANALYSIS BOX */

.analysis-box{
    background:#f8fafc;
    border:1px solid #dbeafe;
    border-left:6px solid #2563eb;
    border-radius:16px;
    padding:25px;
    margin-top:20px;
    font-size:15px;
    color:#1e293b;
    line-height:1.9;
    box-shadow:0px 4px 12px rgba(0,0,0,0.04);
}

/* BUTTONS */

.button-group{
    display:flex;
    gap:15px;
    margin-top:30px;
    flex-wrap:wrap;
}

.btn{
    flex:1;
    text-decoration:none;
}

.btn button{
    width:100%;
    padding:15px;
    border:none;
    border-radius:14px;
    color:white;
    font-size:15px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

.btn-primary{
    background:linear-gradient(90deg,#2563eb,#1d4ed8);
}

.btn-primary:hover{
    transform:translateY(-2px);
    box-shadow:0px 8px 18px rgba(37,99,235,0.35);
}

.btn-secondary{
    background:linear-gradient(90deg,#475569,#334155);
}

.btn-secondary:hover{
    transform:translateY(-2px);
    box-shadow:0px 8px 18px rgba(71,85,105,0.35);
}

/* STATUS */

.status{
    background:#dcfce7;
    color:#15803d;
    padding:12px;
    border-radius:10px;
    text-align:center;
    margin-bottom:20px;
    font-size:14px;
    font-weight:600;
}

/* EMPTY */

.empty{
    background:#fee2e2;
    color:#dc2626;
    padding:14px;
    border-radius:12px;
    text-align:center;
    font-weight:600;
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
            <a href="dashboard.jsp">
                🏠 Dashboard
            </a>
        </li>

        <li>
            <a href="report-analyzer">
                📋 Analyze Again
            </a>
        </li>

    </ul>

    <a href="logout" class="logout">
        Logout
    </a>

</nav>

<!-- MAIN CONTENT -->

<div class="container">

    <div class="result-box">

        <div class="icon">
            📊
        </div>

        <h2>
            AI Medical Report Analysis
        </h2>

        <div class="subtitle">
            Your uploaded medical report has been analyzed successfully by our AI healthcare system.
        </div>

        <% if(analysis != null){ %>

            <div class="status">
                ✅ Analysis Completed Successfully
            </div>

            <div class="analysis-box">

                <%= analysis %>

            </div>

        <% } else { %>

            <div class="empty">
                ❌ No analysis result found.
            </div>

        <% } %>

        <!-- BUTTONS -->

        <div class="button-group">

            <a href="book-appointment.jsp" class="btn">

                <button class="btn-primary">
                    📅 Book Doctor Appointment
                </button>

            </a>

            <a href="report-analyzer" class="btn">

                <button class="btn-secondary">
                    🔁 Analyze Another Report
                </button>

            </a>

        </div>

    </div>

</div>

</body>

</html>