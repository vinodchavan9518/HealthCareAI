<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Login — AI HealthCare</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(rgba(11,94,215,0.75),
               rgba(11,94,215,0.75)),
               url('https://images.unsplash.com/photo-1584515933487-779824d29309?q=80&w=1200&auto=format&fit=crop');
    background-size:cover;
    background-position:center;
    padding:20px;
}

/* LOGIN CARD */

.login-card{
    width:420px;
    background:white;
    border-radius:20px;
    padding:35px;
    box-shadow:0 10px 30px rgba(0,0,0,0.2);
    animation:fadeIn 0.6s ease;
}

@keyframes fadeIn{
    from{
        opacity:0;
        transform:translateY(20px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}

.logo{
    text-align:center;
    margin-bottom:25px;
}

.logo .icon{
    font-size:60px;
}

.logo h2{
    color:#0b5ed7;
    margin-top:10px;
    font-size:28px;
}

.logo p{
    color:#777;
    font-size:14px;
    margin-top:6px;
}

/* ALERTS */

.alert{
    padding:12px;
    border-radius:8px;
    margin-bottom:18px;
    font-size:14px;
    text-align:center;
}

.alert-danger{
    background:#ffe5e5;
    color:#c0392b;
}

.alert-success{
    background:#e9fbe9;
    color:#1e8449;
}

/* FORM */

.form-group{
    margin-bottom:18px;
}

.form-group label{
    display:block;
    margin-bottom:6px;
    font-size:14px;
    font-weight:bold;
    color:#333;
}

.form-group input{
    width:100%;
    padding:13px;
    border:1px solid #ccc;
    border-radius:10px;
    font-size:15px;
    transition:0.3s;
}

.form-group input:focus{
    border-color:#0b5ed7;
    outline:none;
    box-shadow:0 0 5px rgba(11,94,215,0.3);
}

/* BUTTON */

.btn-login{
    width:100%;
    padding:14px;
    border:none;
    border-radius:10px;
    background:#0b5ed7;
    color:white;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

.btn-login:hover{
    background:#084298;
    transform:translateY(-2px);
}

/* LINKS */

.bottom-text{
    text-align:center;
    margin-top:18px;
    font-size:14px;
    color:#666;
}

.bottom-text a{
    color:#0b5ed7;
    text-decoration:none;
    font-weight:bold;
}

.bottom-text a:hover{
    text-decoration:underline;
}

/* ADMIN BOX */

.admin-box{
    margin-top:18px;
    background:#f4f7fb;
    border-left:4px solid #0b5ed7;
    padding:12px;
    border-radius:8px;
    font-size:13px;
    color:#444;
    line-height:1.7;
}

.admin-box b{
    color:#0b5ed7;
}

/* MOBILE */

@media(max-width:500px){

    .login-card{
        width:100%;
        padding:25px;
    }

    .logo h2{
        font-size:24px;
    }

}

</style>

</head>

<body>

<div class="login-card">

    <!-- LOGO -->

    <div class="logo">

        <div class="icon">🏥</div>

        <h2>AI HealthCare</h2>

        <p>
            Secure Login Portal
        </p>

    </div>

    <!-- ERROR MESSAGE -->

    <% if(request.getAttribute("error") != null) { %>

        <div class="alert alert-danger">

            ❌ <%= request.getAttribute("error") %>

        </div>

    <% } %>

    <!-- SUCCESS MESSAGE -->

    <% if(request.getAttribute("success") != null) { %>

        <div class="alert alert-success">

            ✅ <%= request.getAttribute("success") %>

        </div>

    <% } %>

    <!-- LOGIN FORM -->

    <form action="login" method="post">

        <div class="form-group">

            <label>Email Address</label>

            <input type="email"
                   name="email"
                   placeholder="Enter your email"
                   required>

        </div>

        <div class="form-group">

            <label>Password</label>

            <input type="password"
                   name="password"
                   placeholder="Enter your password"
                   required>

        </div>

        <button type="submit" class="btn-login">

            🔐 Login

        </button>

    </form>

    <!-- REGISTER -->

    <div class="bottom-text">

        Don't have an account?

        <a href="register.jsp">

            Register Here

        </a>

    </div>

    <!-- ADMIN LOGIN -->

    <div class="admin-box">

        <b>Admin Login</b><br>

        Email:
        admin@healthcare.com
        <br>

        Password:
        admin123

    </div>

</div>

</body>
</html>