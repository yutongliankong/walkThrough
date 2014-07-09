<cfquery name="qOrders" datasource="ftcf800_artGalleryLab">
SELECT OrderID, OrderDate, Status
FROM Orders, OrderStatus
WHERE Orders.OrderStatusID = OrderStatus.OrderStatusID
<cfif isDefined("URL.osid")>
	AND Orders.OrderStatusID = #URL.osid#
</cfif>
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Drill-Down Interface - Detail</title>
</head>

<body>

<cfoutput>
	<cfif isDefined("#URL.status#")>
		<h2>Orders with "#URL.status#"</h2>
	<cfelse>
		<h2>All Orders in the System</h2>
	</cfif>
	
</cfoutput>

<table border="1" cellpadding="3">
  <tr>
	<td>Order ID</td>
	<td>Order Date</td>
	<td>Order Status</td>
  </tr>
  <cfoutput query="qOrders">
	<tr>
	  <td>#qOrders.OrderID#</td>
	  <td>#DateFormat(qOrders.OrderDate)#</td>
	  <td>#qOrders.Status#</td>
	</tr>
  </cfoutput>
</table>

</body>
</html>
