<%@page import="com.payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%

	//Initiaize----------------------------
	
		session.setAttribute("statusMsg","");
		System.out.println("Trying to process");
		
	//Save-------------------------------------------
	
	if (request.getParameter("pay_id") != null)
	{
		payment paymentObj = new payment();
		String stsMsg = "";
	
	//Insert----------------------------------
	
	if (request.getParameter("hidPaymentIDSave") == "")
	{
		stsMsg = paymentObj.insertPayment (	
		request.getParameter("Card_holder"),
		request.getParameter("Card_number"),
		request.getParameter("CVV"),
		request.getParameter("Date"),
		request.getParameter("Total_amount")
		);
	}
	else
	//Update------------------------------------------
	
	{
		stsMsg = paymentObj.updatePayment(request.getParameter("hidPaymentIDSave"),
				request.getParameter("Card_holder"),
				request.getParameter("Card_number"),
				request.getParameter("CVV"),
				request.getParameter("Date"),
				request.getParameter("Total_amount")
				);
	}
	session.setAttribute("statusMsg", stsMsg);
	}
	
	//Delete-------------------------------------------
	
	if (request.getParameter("hidPaymentIDDelete") != null)
	{
		payment paymentObj = new payment();
		String stsMsg =
		paymentObj.deletePayment(request.getParameter("hidPaymentIDDelete"));
		session.setAttribute("statusMsg", stsMsg);
	}

%>    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Management</title>
<script type="text/javascript" src="Components/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="Components/payment.js"></script>
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
					<input type="hidden" id="hidPaymentIDSave" name="hidPaymentIDSave" value="">
				</form>
				
				<div id ="alertSuccess" class="alert alert-success">
				<%
				out.print(session.getAttribute("statusMsg"));
				%>
				</div>
				<div id="alertError" class="alert alert-danger"></div>
				
				<br>
				
				<%
					payment paymentObj = new payment();
					out.print(paymentObj.readPayment());
					
				%>
		</div>
	</div>
</div>

</body>
</html>