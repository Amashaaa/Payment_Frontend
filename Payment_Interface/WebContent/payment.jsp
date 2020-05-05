<%@page import="com.payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Management</title>
<script type="text/javascript" src="Components/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="Components/payment.js"></script>
<link  rel="stylesheet" href="Views/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-light bg-primary mt-1">
		  <a class="navbar-brand" style="color:white;" href="#">Payment Management</a>
		</nav>	
	</div>
	<div class="container">
		<div class="jumbotron mt-5 col-12">
		  <h1 class="display-4">My Doctor Payment Management</h1>
		  <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
		  <hr class="my-4">
		  <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
		  <p class="lead">
		    <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
		  </p>
		</div>
		
		<div class="row">
			<div class="col-12">
			
				<div class="card">
				  <div class="card-body">
				    <h5 class="card-title">Payment Management</h5>
				    	<form id="formPayment" name="formPayment" method="post" action="payment.jsp">
				    		<div class="input-group">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="">Payment ID</span>
							  </div>
							  <input type="text" id="pay_id" name="pay_id" class="form-control">
							</div>
							<br>
							<div class="input-group">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="">Card Holder</span>
							  </div>
							  <input type="text" id="Card_holder" name="Card_holder" class="form-control">
							</div>
							<br>
							<div class="input-group">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="">Card Number</span>
							  </div>
							  <input type="text" id="Card_number" name="Card_number" class="form-control">
							</div>
							<br>
							<div class="input-group">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="">CVV</span>
							  </div>
							  <input type="text" id="CVV" name="CVV" class="form-control">
							</div>
							<br>
							
							<br> Date:
							<input id="Date" name="Date" type="month"
							class="form-control form-control-sm">
							<br>
							<div class="input-group">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="">Total Amount</span>
							  </div>
							  <input type="text" id="Total_amount" name="Total_amount" class="form-control">
							</div>
							<br>
							
							<input id="btnSave" name="btnSave" type="button" value="Save"
							class="btn btn-primary">
							<input type="hidden" id="hidPaymentIDSave" name="hidPaymentIDSave" value="">
						</form>
				  </div>
				</div>
				<br>
				<div id ="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				
				<div id="divPaymentGrid" class="col-12 table-responsive mb-5"> 
				
					<br>
					
					<%
						payment paymentObj = new payment();
						out.print(paymentObj.readPayment());
						
					%>
				</div>
				<br>
		</div>
	</div>
</div>

</body>
</html>