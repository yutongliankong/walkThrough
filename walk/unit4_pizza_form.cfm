<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pizza Order Form</title>
</head>
<body>
<form action="unit4_pizza_action.cfm" method="post" name="orderSearch">
	<table border="0">
		<tr>
			<td><label for="customerName">Customer&nbsp;Name</label></td>
			<td><input type="text" id="customerName" name="customerName" size="20" maxlength="50"></td>
		</tr>
		<tr>
			<td><label>Size</label></td>
			<td>
				<table>
					<tr><input type="radio" name="size" id="small" value="Small" checked>Small</tr>
					<tr><input type="radio" name="size" id="medium" value="Medium">Medium</tr>
					<tr><input type="radio" name="size" id="large" value="Large">Large</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><label for="delivery">delivery</label></td>
			<td><input type="checkbox"  id="delivery" name="delivery" value="Yes" checked></td>
		</tr>
		<tr>
			<td><label for="topping">Toppings</label></td>
			<td>
				<select name="topping" size="4" multiple>
					<option value="1">Pepperoni</option>
					<option value="2">Mushrooms</option>
					<option value="3">Anchovy</option>
					<option value="4">Extra Cheese</option>
					<option value="5">Sausage</option>
					<option value="6">Onions</option>
					<option value="7">Olives</option>
					<option value="8">Canadian Bacon</option>
				</select> 
			</td>
		</tr>
		<tr>
			<td><label for="notes">Notes</label></td>
			<td><textarea id="notes" name="notes" rows="3" cols="35"></textarea></td>
		</tr>
		<tr>
			<td><input type="submit" name="order" value="Order Now"></td>
			<td><input type="reset" name="reset" value="Reset Now"></td>
		</tr>
	</table>
</form>
</body>
</html>