$(document).ready(function()
{
	$("#alertSuccess").hide();
	$("#alertError").hide();
});
	
//SAVE ================================================================
$(document).on("click", "#btnSave", function(event)
{
		//event.preventDefault();
		// Clear alerts---------------------
		$("#alertSuccess").text("");
		$("#alertSuccess").hide();
		$("#alertError").text("");
		$("#alertError").hide();
	
	//Form validation-------------------
	var status = validatePaymentForm();
		if (status != true)
		{
			$("#alertError").text(status);
			$("#alertError").show();
			return;
		}

// If valid-------------------------
	var type = ($("#hidPaymentIDSave").val() == "") ? "POST" : "PUT";
	
	$.ajax(
			{
			url : "PaymentAPI",
			type : type,
			data : $("#formPayment").serialize(),
			dataType : "text",
			complete : function(response, status)
			{
			onPaymentSaveComplete(response.responseText, status);
			}
			});
});

function onPaymentSaveComplete(response, status)
{
	console.log(response);
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
			{
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divPaymentGrid").html(resultSet.data);
				
			} 
		else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
		else if (status == "error")
		{
			$("#alertError").text("Error while saving.");
			$("#alertError").show();
		} else
		{
			$("#alertError").text("Unknown error while saving..");
			$("#alertError").show();
		}	
			
		$("#hidPaymentIDSave").val("");
		$("#formPayment")[0].reset();
		
	}
}

//UPDATE=======================================================================
$(document).on("click", ".btnUpdate", function(event)
	{
		$("#hidPaymentIDSave").val($(this).closest("tr").find('#hidPaymentIDUpdate').val());
		$("#pay_id").val($(this).closest("tr").find('td:eq(0)').text());
		$("#Card_holder").val($(this).closest("tr").find('td:eq(1)').text());
		$("#Card_number").val($(this).closest("tr").find('td:eq(2)').text());
		$("#CVV").val($(this).closest("tr").find('td:eq(3)').text());
		$("#Date").val($(this).closest("tr").find('td:eq(4)').text());
		$("#Total_amount").val($(this).closest("tr").find('td:eq(5)').text());
		
	});

//DELETE========================================================================

$(document).on("click", ".btnRemove", function(event)
{
		$.ajax(
		{
			url : "PaymentAPI",
			type : "DELETE",
			data : "pay_id=" + $(this).data("payid"),
			dataType : "text",
			complete : function(response, status)
		{
				
		onPaymentDeleteComplete(response.responseText, status);
		
		}
		});
});

function onPaymentDeleteComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
	{
		$("#alertSuccess").text("Successfully deleted.");
		$("#alertSuccess").show();
		$("#divPaymentGrid").html(resultSet.data);
	} else if (resultSet.status.trim() == "error")
	{
		$("#alertError").text(resultSet.data);
		$("#alertError").show();
	}
	} else if (status == "error")
	{
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

	
	
//CLIENT-MODEL================================================================
function validatePaymentForm()
{
	// CODE
		if ($("#pay_id").val().trim() == "")
			
		{
			return "Insert Payment ID.";
		}
		// NAME
		if ($("#Card_holder").val().trim() == "")
		{
			return "Insert Card Holders name.";
		}
		
		// Card Number
		if ($("#Card_number").val().trim() == "")
		{
			return "Insert the card number.";
		}
		
		// CVV
		if ($("#CVV").val().trim() == "")
		{
			return "Insert the CVV of the card.";
		}
		
// 		//is numerical value
// 		var cvv = $("#CVV").val().trim();
// 		if (!$.isNumeric(cvv))
// 		{
// 			return "Insert a 3 digit numerical value for the CVV.";
// 		}
		
		// Date
		if ($("#Date").val().trim() == "")
		{
			return "Insert Expiry Date.";
		}
		
		// PRICE-------------------------------
		if ($("#Total_amount").val().trim() == "")
		{
			return "Insert the Total amount to be paid.";
		}
		
		// is numerical value
		var tmpPrice = $("#Total_amount").val().trim();
		if (!$.isNumeric(tmpPrice))
		{
			return "Insert a numerical value for the Total Amount to be paid.";
		}
		
		// convert to decimal price
		$("#Total_amount").val(parseFloat(tmpPrice).toFixed(3));
		
		
		
	return true;
	
	}
	
	
