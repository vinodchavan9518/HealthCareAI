<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>AI Healthcare Register</title>

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
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:30px;
    background:linear-gradient(135deg,#0f172a,#1e3a8a,#2563eb);
}

/* MAIN CARD */

.container{
    width:100%;
    max-width:480px;
    background:white;
    padding:40px;
    border-radius:25px;
    box-shadow:0px 15px 40px rgba(0,0,0,0.25);
    animation:fadeIn 0.8s ease;
}

/* ANIMATION */

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

/* LOGO */

.logo{
    text-align:center;
    font-size:70px;
    margin-bottom:10px;
}

/* TITLE */

.title{
    text-align:center;
    font-size:32px;
    font-weight:700;
    color:#0f172a;
    margin-bottom:6px;
}

.subtitle{
    text-align:center;
    color:#64748b;
    font-size:14px;
    margin-bottom:28px;
}

/* FORM */

.form-group{
    margin-bottom:18px;
}

label{
    display:block;
    margin-bottom:7px;
    font-size:14px;
    font-weight:600;
    color:#1e293b;
}

input,
select{
    width:100%;
    padding:14px;
    border:1px solid #cbd5e1;
    border-radius:12px;
    font-size:14px;
    transition:0.3s;
    background:#f8fafc;
}

input:focus,
select:focus{
    outline:none;
    border-color:#2563eb;
    box-shadow:0px 0px 10px rgba(37,99,235,0.25);
    background:white;
}

/* GRID */

.grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:15px;
}

/* BUTTON */

button{
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
    margin-top:10px;
}

button:hover{
    transform:translateY(-3px);
    box-shadow:0px 10px 20px rgba(37,99,235,0.4);
}

/* ALERTS */

.error{
    background:#fee2e2;
    color:#dc2626;
    padding:12px;
    border-radius:10px;
    margin-bottom:18px;
    text-align:center;
    font-size:14px;
}

.success{
    background:#dcfce7;
    color:#15803d;
    padding:12px;
    border-radius:10px;
    margin-bottom:18px;
    text-align:center;
    font-size:14px;
}

/* FOOTER */

.bottom{
    text-align:center;
    margin-top:22px;
    color:#475569;
    font-size:14px;
}

.bottom a{
    color:#2563eb;
    text-decoration:none;
    font-weight:600;
}

.bottom a:hover{
    text-decoration:underline;
}

/* MOBILE */

@media(max-width:600px){

    .container{
        padding:30px 22px;
    }

    .grid{
        grid-template-columns:1fr;
    }

    .title{
        font-size:26px;
    }

    .logo{
        font-size:60px;
    }
}

</style>

</head>

<body>

<div class="container">

    <!-- LOGO -->

    <div class="logo">
        🏥
    </div>

    <!-- TITLE -->

    <div class="title">
        AI Healthcare
    </div>

    <div class="subtitle">
        Create Your Smart Healthcare Account
    </div>

    <!-- ERROR MESSAGE -->

    <% if(request.getAttribute("error") != null){ %>

        <div class="error">
            <%= request.getAttribute("error") %>
        </div>

    <% } %>

    <!-- SUCCESS MESSAGE -->

    <% if(request.getAttribute("success") != null){ %>

        <div class="success">
            <%= request.getAttribute("success") %>
        </div>

    <% } %>

    <!-- FORM -->

    <form action="register" method="post">

        <div class="form-group">

            <label>Full Name</label>

            <input type="text"
                   name="fullName"
                   placeholder="Enter Full Name"
                   required>

        </div>

        <div class="form-group">

            <label>Email Address</label>

            <input type="email"
                   name="email"
                   placeholder="Enter Email"
                   required>

        </div>

        <div class="form-group">

            <label>Password</label>

            <input type="password"
                   name="password"
                   placeholder="Create Password"
                   required>

        </div>

        <div class="form-group">

            <label>Phone Number</label>

            <input type="text"
                   name="phone"
                   placeholder="Enter Phone Number"
                   required>

        </div>

        <div class="grid">

            <div class="form-group">

                <label>Age</label>

                <input type="number"
                       name="age"
                       placeholder="Age"
                       required>

            </div>

            <div class="form-group">

                <label>Blood Group</label>

                <select name="bloodGroup" required>

                    <option value="">
                        Select
                    </option>

                    <option>A+</option>
                    <option>A-</option>

                    <option>B+</option>
                    <option>B-</option>

                    <option>AB+</option>
                    <option>AB-</option>

                    <option>O+</option>
                    <option>O-</option>

                </select>

            </div>

        </div>

        <button type="submit">
            🚀 Create Account
        </button>

    </form>

    <!-- LOGIN LINK -->

    <div class="bottom">

        Already have an account?

        <a href="login.jsp">
            Login Here
        </a>

    </div>

</div>

</body>

</html>