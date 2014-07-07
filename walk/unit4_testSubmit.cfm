<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pizza Order Form</title>
</head>

<body>

<form action="unit4_testSubmit.cfm" method="post" name="orderSearch">

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
			<select name="toppings" size="4" multiple>
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
		<td>Notes</td>
		<td><textarea name="notes" cols="35" rows="3"></textarea></td>
	</tr>
	<tr>
		<td><input name="order" type="submit" value="Order Now" /></td>
		<td><input name="" type="reset" value="Reset Now" /></td>
	</tr>
</table>


</form>

</body>
</html>
