<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/payment.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Payment Management</h1>
				
				<form id="formPayment" name="formPayment" method="post" action="payment.jsp">
					 Payment ID:
					<input id="pay_id" name="pay_id" type="text"
					class="form-control form-control-sm">
					<br> Card Holder:
					<input id="Card_holder" name="Card_holder" type="text"
					class="form-control form-control-sm">
					<br> Card number:
					<input id="Card_number" name="Card_number" type="text"
					class="form-control form-control-sm">
					<br> CVV:
					<input id="CVV" name="CVV" type="text"
					class="form-control form-control-sm">
					<br> Date:
					<input id="Date" name="Date" type="text"
					class="form-control form-control-sm">
					<br> Total Amount:
					<input id="Total_amount" name="Total_amount" type="text"
					class="form-control form-control-sm">
					<br>
					<input id="btnSave" name="btnSave" type="button" value="Save"
					class="btn btn-primary">
					<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
				</form>
				
				<div id ="alertSuccess" class="alert alert-success">
				<%
				out.print(session.getAttribute("statusMsg"));
				%>
				</div>
				<div id="alertError" class="alert alert-danger"></div>
</div>
</body>
</html>