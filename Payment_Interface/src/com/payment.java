package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;



public class payment {
	

	// A common method to connect to the DB
	private Connection connect() {
		Connection con = null;
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");

			// Provide the correct details: DBServer/DBName, username, password
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/payment?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
		
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return con;
	}

	public String insertPayment(String Card_holder, String Card_number, String CVV, String Date, String Total_amount) 
	{
		String output = "";

		try 
		{
			Connection con = connect();
		
			if (con == null) 
			{
				return "Error while connecting to the database for inserting.";
			}
			
			// create a prepared statement
			String query = " insert into pay_form(pay_id,Card_holder,Card_number,CVV,Date,Total_amount)" + " values (?, ?, ?, ?, ?, ?)";
			
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, Card_holder);
			preparedStmt.setInt(3, Integer.parseInt(Card_number));
			preparedStmt.setInt(4, Integer.parseInt(CVV));
			preparedStmt.setString(5, Date);
			preparedStmt.setString(6, Total_amount);
			
			// execute the statement
			preparedStmt.execute();
			con.close();
			
			String newPayment = readPayment();
			output = "{\"status\":\"success\", \"data\": \"" +
			newPayment + "\"}";
			
			//output = "Inserted successfully";

		} catch (Exception e) 
		{
		
			//output = "Error while inserting the payment.";
			
			output = "{\"status\":\"error\", \"data\":\"Error while inserting the payment.\"}";
			
			System.err.println(e.getMessage());
		}
		
		return output;
	}

	public String readPayment() 
	{
		String output = "";
		try 
		{
			Connection con = connect();
			if (con == null) 
			{
				return "Error while connecting to the database for reading.";
			}
			
			// Prepare the html table to be displayed
			output = "<table class=\"table table-hover\" ><tr  class=\"table-secondary\"><th scope=\"col\">pay_id</th> <th scope=\"col\">Card_holder</th> <th scope=\"col\">Card_number</th> <th scope=\"col\">CVV</th> <th scope=\"col\">Date</th> <th scope=\"col\">Total_amount</th> <th scope=\"col\">Update</th> <th scope=\"col\">Remove</th> </tr>";
			String query = "select * from pay_form";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			// iterate through the rows in the result set
			while (rs.next()) 
			{
				String pay_id = Integer.toString(rs.getInt("pay_id"));
				String Card_holder = rs.getString("Card_holder");
				String Card_number = rs.getString("Card_number");
				String CVV = rs.getString("CVV");
				String Date = rs.getString("Date");
				String Total_amount = Double.toString(rs.getDouble("Total_amount"));
				
				// Add into the html table
				
				output += "<tr><td><input id='hidPaymentIDUpdate' name='hidPaymentIDUpdate' type='hidden' value='" + pay_id + "'>" + pay_id + "</td>";
				output += "<td>" + Card_holder + "</td>";
				output += "<td>" + Card_number + "</td>";
				output += "<td>" + CVV + "</td>";
				output += "<td>" + Date + "</td>";
				output += "<td>" + Total_amount + "</td>";
				// buttons
				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"
						+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-payid='"	+ pay_id + "'>" + "</td></tr>";
			}
			con.close();
			// Complete the html table
			output += "</table>";
		} 
		catch (Exception e) 
		{
			output = "Error while reading the payment.";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String updatePayment(String pay_id, String Card_holder, String Card_number, String CVV, String Date, String Total_amount) 
	{

		String output = "";
		
		try 
		{
			Connection con = connect();
			
			if (con == null) 
			{
				return "Error while connecting to the database for updating the payment.";
			}
			
			// create a prepared statement
			String query = "UPDATE pay_form SET Card_holder=? ,Card_number=? ,CVV=? ,Date=?, Total_amount=? WHERE pay_id=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			// binding values
			preparedStmt.setString(1, Card_holder);
			preparedStmt.setInt(2, Integer.parseInt(Card_number));
			preparedStmt.setInt(3, Integer.parseInt(CVV));
			preparedStmt.setString(4, Date);
			preparedStmt.setDouble(5, Double.parseDouble(Total_amount));
			preparedStmt.setInt(6, Integer.parseInt(pay_id));
			
			// execute the statement
			preparedStmt.execute();
			con.close();
			
			//output = "Payments Updated successfully";
			
			String newPayment = readPayment();
			output = "{\"status\":\"success\", \"data\": \"" +
			newPayment + "\"}";
			
		} 
		catch (Exception e) 
		{
			//output = "Error while updating the payments.";
			output = "{\"status\":\"error\", \"data\": \"Error while updating the item.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String deletePayment(String pay_id) 
	{
		String output = "";
		
		try 
		{
			Connection con = connect();
			
			if (con == null) 
			{
				
				return "Error while connecting to the database for deleting.";
			}

			// create a prepared statement
			String query = "delete from pay_form where pay_id=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(pay_id));
			
			// execute the statement
			preparedStmt.execute();
			con.close();
			
			//output = "Payment Deleted successfully";
			String newPayment = readPayment();
			output = "{\"status\":\"success\", \"data\": \"" +
			newPayment + "\"}";
		
		} 
		catch (Exception e) 
		{
			output = "Error while deleting the payment.";
			System.err.println(e.getMessage());
		}
		
		return output;
	}
		
	public User readLogin(String Patient_username, String Patient_password) {
		try{
			Connection con = connect();
			
			if (con == null){
				System.out.println("Executed before Comparison");
				return null;
			}
		


		// create a prepared statement
			String query = "select * from patientdetails where Patient_username = '"+Patient_username+"'";
			
			
			PreparedStatement preparedStmt = con.prepareStatement(query);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			


			while (rs.next()){
				System.out.println(rs.getString("Patient_id"));
	
				User u = new User(rs.getString("Patient_id"), rs.getString("Patient_name"), rs.getString("Patient_username"), "patient");
				
				String password = rs.getString("Patient_password");
	
				if(password.equals(Patient_password)){
					System.out.println("true from db");
					return u;
				}else{
					System.out.println("false from db");
				}
			}
			
			
			con.close();

		}catch (Exception e){
				System.err.println(e.getMessage());
		}
		
		return null;
			
	}

	public User readAdminlogin(String Admin_username, String Admin_password) {
	try{
		Connection con = connect();
		
		if (con == null){
			System.out.println("Executed before Comparision");
			return null;
		}
	


	// create a prepared statement
		String query = "select * from admin_details where Admin_username = '"+Admin_username+"'";
		PreparedStatement preparedStmt = con.prepareStatement(query);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);


		while (rs.next()){
			
			System.out.println(rs.getString("Admin_id"));
			
			User u = new User(rs.getString("Admin_id"), rs.getString("Admin_name"), rs.getString("Admin_username"), "Admin");
			
			String password = rs.getString("Admin_password");

			if(password.equals(Admin_password)){
				System.out.println("true from db");
				return u;
			}else{
				System.out.println("false from db");
			}
		}
		
		con.close();

	}catch (Exception e){
			System.err.println(e.getMessage());
	}
	
	return null;
		
}



}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


