<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>AI HealthCare Management System</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    background:#f4f7fb;
    color:#333;
}

/* NAVBAR */

.navbar{
    width:100%;
    background:#0b5ed7;
    padding:15px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    position:sticky;
    top:0;
    z-index:1000;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

.brand{
    text-decoration:none;
    color:white;
    font-size:26px;
    font-weight:bold;
}

.brand span{
    color:#ffdd57;
}

.navbar ul{
    list-style:none;
    display:flex;
    gap:20px;
}

.navbar ul li a{
    text-decoration:none;
    color:white;
    font-size:15px;
    font-weight:bold;
    transition:0.3s;
}

.navbar ul li a:hover{
    color:#ffdd57;
}

/* HERO SECTION */

.hero{
    width:100%;
    min-height:85vh;
    background:linear-gradient(rgba(11,94,215,0.8),
               rgba(11,94,215,0.8)),
               url('https://images.unsplash.com/photo-1584515933487-779824d29309?q=80&w=1200&auto=format&fit=crop');
    background-size:cover;
    background-position:center;
    display:flex;
    flex-direction:column;
    justify-content:center;
    align-items:center;
    text-align:center;
    padding:20px;
    color:white;
}

.hero h1{
    font-size:52px;
    margin-bottom:20px;
}

.hero p{
    max-width:750px;
    font-size:20px;
    line-height:1.7;
    margin-bottom:35px;
}

/* BUTTONS */

.btn-hero{
    background:#ffdd57;
    color:#000;
    padding:14px 30px;
    border-radius:30px;
    text-decoration:none;
    font-size:17px;
    font-weight:bold;
    margin-right:15px;
    transition:0.3s;
}

.btn-hero:hover{
    background:#ffd000;
    transform:translateY(-2px);
}

.btn-outline{
    border:2px solid white;
    color:white;
    padding:13px 30px;
    border-radius:30px;
    text-decoration:none;
    font-size:17px;
    font-weight:bold;
    transition:0.3s;
}

.btn-outline:hover{
    background:white;
    color:#0b5ed7;
}

/* CONTAINER */

.container{
    width:90%;
    max-width:1200px;
    margin:60px auto;
}

/* SECTION TITLE */

.section-title{
    text-align:center;
    font-size:34px;
    color:#0b5ed7;
    margin-bottom:40px;
    font-weight:bold;
}

/* CARD GRID */

.cards-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
    gap:25px;
}

/* CARD */

.card{
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,0.08);
    transition:0.3s;
    text-align:center;
}

.card:hover{
    transform:translateY(-8px);
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
}

.icon{
    font-size:55px;
    margin-bottom:20px;
}

.card h3{
    color:#0b5ed7;
    margin-bottom:15px;
    font-size:24px;
}

.card p{
    color:#666;
    line-height:1.7;
    font-size:15px;
}

/* FOOTER */

.footer{
    background:#0b5ed7;
    color:white;
    text-align:center;
    padding:20px;
    margin-top:60px;
}

/* RESPONSIVE */

@media(max-width:768px){

    .navbar{
        flex-direction:column;
        gap:15px;
    }

    .hero h1{
        font-size:36px;
    }

    .hero p{
        font-size:17px;
    }

    .btn-hero,
    .btn-outline{
        display:block;
        margin:10px auto;
        width:220px;
    }
}

</style>

</head>

<body>

<!-- NAVBAR -->

<nav class="navbar">

    <a href="index.jsp" class="brand">
        🏥 AI<span>HealthCare</span>
    </a>

    <ul>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="register.jsp">Register</a></li>
    </ul>

</nav>

<!-- HERO SECTION -->

<div class="hero">

    <h1>
        🤖 AI-Powered Healthcare Management
    </h1>

    <p>
        Smart symptom checking, AI medical report analysis,
        doctor appointment booking, medicine reminders,
        hospital bed tracking and 24/7 AI chatbot support.
    </p>

    <div>

        <a href="register.jsp" class="btn-hero">
            Get Started Free
        </a>

        <a href="login.jsp" class="btn-outline">
            Login
        </a>

    </div>

</div>

<!-- FEATURES -->

<div class="container">

    <div class="section-title">
        Our AI Features
    </div>

    <div class="cards-grid">

        <div class="card">

            <div class="icon">🩺</div>

            <h3>AI Symptom Checker</h3>

            <p>
                Enter symptoms and AI predicts possible diseases
                with doctor recommendations.
            </p>

        </div>

        <div class="card">

            <div class="icon">📋</div>

            <h3>Report Analyzer</h3>

            <p>
                Upload blood test or medical reports and
                get instant AI-powered explanations.
            </p>

        </div>

        <div class="card">

            <div class="icon">📅</div>

            <h3>Appointment Booking</h3>

            <p>
                Easily schedule doctor appointments online
                with real-time availability.
            </p>

        </div>

        <div class="card">

            <div class="icon">💊</div>

            <h3>Medicine Reminder</h3>

            <p>
                Never miss medicines with smart reminder alerts
                and daily schedules.
            </p>

        </div>

        <div class="card">

            <div class="icon">🏥</div>

            <h3>Hospital Bed Management</h3>

            <p>
                Check live hospital bed availability across
                multiple departments and wards.
            </p>

        </div>

        <div class="card">

            <div class="icon">🤖</div>

            <h3>AI Chatbot Assistant</h3>

            <p>
                24/7 virtual healthcare assistant to answer
                patient questions instantly.
            </p>

        </div>

    </div>

</div>

<!-- FOOTER -->

<div class="footer">

    © 2026 AI HealthCare Management System |
   
</div>

</body>
</html>