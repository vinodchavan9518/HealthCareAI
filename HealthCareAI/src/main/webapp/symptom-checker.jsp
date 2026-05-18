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

<title>AI Symptom Checker</title>

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
    line-height:1.7;
    margin-bottom:30px;
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
    transition:0.3s;
    background:#f8fafc;
}

textarea:focus{
    outline:none;
    border-color:#2563eb;
    box-shadow:0px 0px 10px rgba(37,99,235,0.25);
    background:white;
}

/* SYMPTOMS GRID */

.symptom-grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:15px;
    margin-bottom:25px;
}

.symptom-item{
    background:#f8fafc;
    border:1px solid #dbeafe;
    padding:14px;
    border-radius:14px;
    display:flex;
    align-items:center;
    gap:10px;
    cursor:pointer;
    transition:0.3s;
    font-size:14px;
    color:#1e293b;
}

.symptom-item:hover{
    background:#eff6ff;
    transform:translateY(-2px);
}

.symptom-item input{
    transform:scale(1.2);
    cursor:pointer;
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

        <div class="icon">
            🩺
        </div>

        <h2>
            AI Symptom Checker
        </h2>

        <div class="subtitle">
            Describe your symptoms below and our AI healthcare system
            will analyze your condition and recommend the right specialist doctor.
        </div>

        <form action="symptom-checker" method="post">

            <div class="form-group">

                <label>
                    Describe Your Symptoms
                </label>

                <textarea
                    name="symptoms"
                    rows="6"
                    placeholder="Example: I have chest pain, fever, headache, dizziness and shortness of breath..."
                    required></textarea>

            </div>

            <!-- COMMON SYMPTOMS -->

            <div class="symptom-grid">

                <label class="symptom-item">
                    <input type="checkbox" name="s1" value="Fever">
                    🌡️ Fever
                </label>

                <label class="symptom-item">
                    <input type="checkbox" name="s2" value="Headache">
                    🤕 Headache
                </label>

                <label class="symptom-item">
                    <input type="checkbox" name="s3" value="Chest Pain">
                    💔 Chest Pain
                </label>

                <label class="symptom-item">
                    <input type="checkbox" name="s4" value="Cough">
                    😷 Cough
                </label>

                <label class="symptom-item">
                    <input type="checkbox" name="s5" value="Joint Pain">
                    🦴 Joint Pain
                </label>

                <label class="symptom-item">
                    <input type="checkbox" name="s6" value="Skin Rash">
                    🩹 Skin Rash
                </label>

                <label class="symptom-item">
                    <input type="checkbox" name="s7" value="Stomach Pain">
                    🤢 Stomach Pain
                </label>

                <label class="symptom-item">
                    <input type="checkbox" name="s8" value="Fatigue">
                    😴 Fatigue
                </label>

            </div>

            <button type="submit" class="btn-primary">
                🔍 Analyze Symptoms
            </button>

        </form>

        <!-- INFO -->

        <div class="info-box">

            <h3>
                📌 AI Features
            </h3>

            <ul>
                <li>Smart disease prediction</li>
                <li>Doctor specialization suggestion</li>
                <li>Instant symptom analysis</li>
                <li>24/7 AI healthcare support</li>
            </ul>

        </div>

    </div>

</div>

</body>

</html>