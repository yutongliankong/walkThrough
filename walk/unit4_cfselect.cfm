<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pizza Order Form</title>
</head>

<body>
<cfquery name="qToppings" datasource="ftcf800_artGalleryLab">
	SELECT Topping_Desc, Topping_ID
	FROM Toppings
	ORDER BY Topping_Desc
</cfquery>
<cfoutput>
<cfif IsDefined("Form.order")>
	<cfparam name="Form.delivery" default="No" />
	The form has been submitted.<br />
	#Form.customerName#<br />
	#Form.size#<br />
	<cfif Form.delivery IS "Yes"> 
		Thanks! Your pizza will be delivered in 30 minutes.
	<cfelseif Form.delivery IS "No">
		Thanks! Your pizza will be ready for pick up in 30 minutes.
	</cfif><br />
	#Form.toppings#<br />
	#Form.notes#<br />
</cfif>
</cfoutput>
<br />

<cfform name="orderSearch">

<table>
	<tr>
		<td>Customer Name</td>
		<td><input name="customerName" type="text" size="20" maxlength="50" /></td>
	</tr>
	<tr>
		<td>Size</td>
		<td>
			<table width="200">
				<tr>
					<td><label>
						<input type="radio" name="size" value="Small" id="size_0" />
						Small</label></td>
				</tr>
				<tr>
					<td><label>
						<input type="radio" name="size" value="Medium" id="size_1" />
						Medium</label></td>
				</tr>
				<tr>
					<td><label>
						<input type="radio" name="size" value="Large" id="size_2" />
						Large</label></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>Delivery</td>
		<td><input name="delivery" type="checkbox" value="Yes" checked /></td>
	</tr>
	<tr>
		<td>Toppings</td>
		<td>
			<cfselect name="toppings" size="4" multiple
				query="qToppings"
				value="Topping_ID"
				display="Topping_Desc">
				
			</cfselect>
		</td>
	</tr>
	<tr>
		<td>Notes</td>
		<td><textarea name="notes" cols="35" rows="3"></textarea></td>
	</tr>
	<tr>
		<td><input name="order" type="submit" value="Order Now" /></td>
		<td><input name="" type="reset" value="Reset Now" /></td>
	</tr>
</table>

</cfform>

</body>
</html>