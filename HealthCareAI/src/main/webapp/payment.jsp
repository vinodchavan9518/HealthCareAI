<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Payment</title>

<link rel="stylesheet"
      href="css/styles.css">

</head>

<body>

<div class="container">

<div class="form-card">

<h2>💳 Appointment Payment</h2>

<% if(request.getAttribute("success") != null){ %>

<div class="alert alert-success">

<%= request.getAttribute("success") %>

</div>

<% } %>

<% if(request.getAttribute("error") != null){ %>

<div class="alert alert-danger">

<%= request.getAttribute("error") %>

</div>

<% } %>

<form action="payment"
      method="post">

<div class="form-group">

<label>Appointment ID</label>

<input type="number"
       name="apptId"
       required>

</div>

<div class="form-group">

<label>Amount</label>

<input type="number"
       name="amount"
       required>

</div>

<div class="form-group">

<label>Payment Method</label>

<select name="paymentMethod">

<option>UPI</option>
<option>Card</option>
<option>Cash</option>

</select>

</div>

<button type="submit"
        class="btn-primary">

💳 Pay Now

</button>

</form>

</div>

</div>

</body>
</html>