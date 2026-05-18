<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Ambulance Booking</title>

<link rel="stylesheet"
      href="css/styles.css">

</head>

<body>

<div class="container">

<div class="form-card">

<h2>🚑 Emergency Ambulance</h2>

<form action="ambulance"
      method="post">

<div class="form-group">

<label>Patient Name</label>

<input type="text"
       name="patientName"
       required>

</div>

<div class="form-group">

<label>Current Location</label>

<input type="text"
       name="location"
       required>

</div>

<div class="form-group">

<label>Phone Number</label>

<input type="text"
       name="phone"
       required>

</div>

<button type="submit"
        class="btn-primary">

🚑 Request Ambulance

</button>

</form>

</div>

</div>

</body>
</html>