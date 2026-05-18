<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
    if(session.getAttribute("user")==null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>AI Report Analyzer</title>

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
    color:#cbd5e1;
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

/* MAIN CONTAINER */

.container{
    width:100%;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:50px 20px;
}

/* CARD */

.form-card{
    width:100%;
    max-width:700px;
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

.header-icon{
    text-align:center;
    font-size:60px;
    margin-bottom:10px;
}

h2{
    text-align:center;
    color:#0f172a;
    margin-bottom:10px;
    font-size:30px;
}

.subtitle{
    text-align:center;
    color:#64748b;
    font-size:14px;
    margin-bottom:25px;
    line-height:1.6;
}

/* FORM */

.form-group{
    margin-bottom:22px;
}

label{
    display:block;
    margin-bottom:8px;
    font-weight:600;
    color:#1e293b;
}

textarea{
    width:100%;
    padding:16px;
    border:1px solid #cbd5e1;
    border-radius:14px;
    resize:none;
    font-size:14px;
    line-height:1.7;
    transition:0.3s;
    background:#f8fafc;
}

textarea:focus{
    outline:none;
    border-color:#2563eb;
    box-shadow:0px 0px 10px rgba(37,99,235,0.25);
    background:white;
}

/* BUTTON */

.btn-primary{
    width:100%;
    padding:15px;
    border:none;
    border-radius:14px;
    background:linear-gradient(90deg,#2563eb,#1d4ed8);
    color:white;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

.btn-primary:hover{
    transform:translateY(-2px);
    box-shadow:0px 8px 18px rgba(37,99,235,0.35);
}

/* ALERTS */

.alert-success{
    background:#dcfce7;
    color:#15803d;
    padding:14px;
    border-radius:10px;
    margin-bottom:18px;
    text-align:center;
}

.alert-danger{
    background:#fee2e2;
    color:#dc2626;
    padding:14px;
    border-radius:10px;
    margin-bottom:18px;
    text-align:center;
}

/* INFO BOX */

.info-box{
    margin-top:25px;
    background:#eff6ff;
    border-left:5px solid #2563eb;
    padding:18px;
    border-radius:12px;
}

.info-box h3{
    color:#1e3a8a;
    margin-bottom:10px;
    font-size:18px;
}

.info-box ul{
    margin-left:18px;
    color:#334155;
    line-height:1.8;
    font-size:14px;
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

    </ul>

    <a href="logout" class="logout">
        Logout
    </a>

</nav>

<!-- MAIN CONTENT -->

<div class="container">

    <div class="form-card">

        <div class="header-icon">
            📋
        </div>

        <h2>
            AI Medical Report Analyzer
        </h2>

        <div class="subtitle">
            Paste your medical report below and our AI system will analyze the report,
            explain abnormal values, and provide easy-to-understand insights instantly.
        </div>

        <% if(request.getAttribute("success") != null){ %>

            <div class="alert-success">
                <%= request.getAttribute("success") %>
            </div>

        <% } %>

        <% if(request.getAttribute("error") != null){ %>

            <div class="alert-danger">
                <%= request.getAttribute("error") %>
            </div>

        <% } %>

        <form action="report-analyzer" method="post">

            <div class="form-group">

                <label>
                    Paste Medical Report
                </label>

                <textarea
                    name="reportText"
                    rows="12"
                    placeholder="Example:

Blood Test Report:
Hemoglobin: 9.5 g/dL (Low)
Glucose: 180 mg/dL (High)
Cholesterol: 220 mg/dL (High)
Vitamin D: 15 ng/mL (Low)

Paste full medical report here..."
                    required></textarea>

            </div>

            <button type="submit" class="btn-primary">
                🔬 Analyze Report with AI
            </button>

        </form>

        <!-- INFO -->

        <div class="info-box">

            <h3>
                📌 Supported Reports
            </h3>

            <ul>
                <li>Blood Test Reports</li>
                <li>Diabetes Reports</li>
                <li>Cholesterol Reports</li>
                <li>Vitamin Reports</li>
                <li>Thyroid Reports</li>
                <li>General Health Reports</li>
            </ul>

        </div>

    </div>

</div>

</body>

</html>