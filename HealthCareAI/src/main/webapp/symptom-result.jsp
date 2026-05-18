<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    if(session.getAttribute("user")==null){
        response.sendRedirect("login.jsp");
        return;
    }

    String sev = (String)request.getAttribute("severity");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>AI Symptom Result</title>

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
    padding:16px 40px;
    background:#0f172a;
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
    color:#38bdf8;
}

.navbar ul{
    display:flex;
    gap:20px;
    list-style:none;
}

.navbar ul li a{
    color:#e2e8f0;
    text-decoration:none;
    font-size:14px;
    transition:0.3s;
}

.navbar ul li a:hover{
    color:#38bdf8;
}

.logout{
    padding:10px 18px;
    background:#ef4444;
    color:white;
    text-decoration:none;
    border-radius:10px;
    font-size:14px;
    transition:0.3s;
}

.logout:hover{
    background:#dc2626;
}

/* MAIN */

.container{
    max-width:900px;
    margin:40px auto;
    padding:20px;
}

.result-box{
    background:white;
    border-radius:22px;
    padding:35px;
    box-shadow:0px 10px 30px rgba(0,0,0,0.08);
    animation:fadeIn 0.7s ease;
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

.result-title{
    text-align:center;
    font-size:32px;
    color:#0f172a;
    margin-bottom:10px;
}

.result-subtitle{
    text-align:center;
    color:#64748b;
    margin-bottom:30px;
    font-size:14px;
}

/* RESULT ITEMS */

.result-item{
    background:#f8fafc;
    border:1px solid #e2e8f0;
    border-radius:16px;
    padding:20px;
    margin-bottom:18px;
    transition:0.3s;
}

.result-item:hover{
    transform:translateY(-2px);
    box-shadow:0px 8px 20px rgba(0,0,0,0.05);
}

.label{
    font-size:14px;
    color:#64748b;
    margin-bottom:10px;
    font-weight:600;
}

.value{
    font-size:17px;
    color:#0f172a;
    line-height:1.7;
    font-weight:500;
}

/* BADGES */

.badge{
    padding:10px 18px;
    border-radius:50px;
    color:white;
    font-size:13px;
    font-weight:600;
    display:inline-block;
}

.badge-red{
    background:#ef4444;
}

.badge-yellow{
    background:#f59e0b;
}

.badge-green{
    background:#10b981;
}

/* ACTION BUTTONS */

.action-buttons{
    display:flex;
    gap:15px;
    margin-top:30px;
}

.btn{
    flex:1;
    padding:15px;
    border:none;
    border-radius:14px;
    font-size:15px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
    text-decoration:none;
    text-align:center;
    color:white;
}

.btn-primary{
    background:linear-gradient(90deg,#2563eb,#1d4ed8);
}

.btn-secondary{
    background:#475569;
}

.btn:hover{
    transform:translateY(-3px);
    box-shadow:0px 10px 20px rgba(0,0,0,0.15);
}

/* ICON HEADER */

.top-icon{
    text-align:center;
    font-size:65px;
    margin-bottom:12px;
}

/* RESPONSIVE */

@media(max-width:768px){

    .navbar{
        flex-direction:column;
        gap:15px;
        padding:20px;
    }

    .navbar ul{
        flex-wrap:wrap;
        justify-content:center;
    }

    .action-buttons{
        flex-direction:column;
    }

    .result-box{
        padding:25px;
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
            <a href="dashboard.jsp">
                🏠 Dashboard
            </a>
        </li>

        <li>
            <a href="symptom-checker">
                🩺 Check Again
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

        <div class="top-icon">
            🤖
        </div>

        <h1 class="result-title">
            AI Health Analysis Result
        </h1>

        <p class="result-subtitle">
            Smart AI-powered symptom prediction and doctor recommendation
        </p>

        <!-- Symptoms -->

        <div class="result-item">

            <div class="label">
                📝 Your Symptoms
            </div>

            <div class="value">
                <%= request.getAttribute("symptoms") %>
            </div>

        </div>

        <!-- Disease -->

        <div class="result-item">

            <div class="label">
                🦠 Possible Disease / Condition
            </div>

            <div class="value">
                <%= request.getAttribute("disease") %>
            </div>

        </div>

        <!-- Specialist -->

        <div class="result-item">

            <div class="label">
                👨‍⚕️ Recommended Specialist
            </div>

            <div class="value">
                <%= request.getAttribute("specialist") %>
            </div>

        </div>

        <!-- Severity -->

        <div class="result-item">

            <div class="label">
                ⚠️ Severity Level
            </div>

            <div class="value">

                <% if("HIGH".equals(sev)) { %>

                    <span class="badge badge-red">
                        HIGH RISK
                    </span>

                <% } else if("MEDIUM".equals(sev)) { %>

                    <span class="badge badge-yellow">
                        MEDIUM RISK
                    </span>

                <% } else { %>

                    <span class="badge badge-green">
                        LOW RISK
                    </span>

                <% } %>

            </div>

        </div>

        <!-- Advice -->

        <div class="result-item">

            <div class="label">
                💡 AI Health Advice
            </div>

            <div class="value">
                <%= request.getAttribute("advice") %>
            </div>

        </div>

        <!-- ACTION BUTTONS -->

        <div class="action-buttons">

            <a href="book-appointment.jsp" class="btn btn-primary">
                📅 Book Appointment
            </a>

            <a href="symptom-checker" class="btn btn-secondary">
                🔁 Check Again
            </a>

        </div>

    </div>

</div>

</body>
</html>