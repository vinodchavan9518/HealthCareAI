<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Add Doctor</title>

<link rel="stylesheet" href="css/styles.css">

</head>

<body>

<div class="container">

<div class="form-card">

<h2>👨‍⚕️ Add Doctor</h2>

<form action="doctor" method="post">

<input type="hidden"
       name="action"
       value="add">

<div class="form-group">

<label>Doctor Name</label>

<input type="text"
       name="fullName"
       required>

</div>

<div class="form-group">

<label>Specialization</label>

<input type="text"
       name="specialization"
       required>

</div>

<div class="form-group">

<label>Email</label>

<input type="email"
       name="email">

</div>

<div class="form-group">

<label>Phone</label>

<input type="text"
       name="phone">

</div>

<div class="form-group">

<label>Experience</label>

<input type="number"
       name="experience">

</div>

<div class="form-group">

<label>Available Days</label>

<input type="text"
       name="availableDays"
       placeholder="Mon-Fri">

</div>

<div class="form-group">

<label>Available Time</label>

<input type="text"
       name="availableTime"
       placeholder="10AM - 5PM">

</div>

<div class="form-group">

<label>Consultation Fee</label>

<input type="number"
       name="fee">

</div>

<div class="form-group">

<label>Hospital Name</label>

<input type="text"
       name="hospitalName">

</div>

<button type="submit"
        class="btn-primary">

➕ Add Doctor

</button>

</form>

</div>

</div>

</body>
</html>