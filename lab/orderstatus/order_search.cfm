<cfinclude template="../templates/header.cfm">

<h1>Oeder Search</h1>
<h2>Enter one of the following search criteria to locate an order: </h2>
<cfquery name="qOrderStatusTypes" datasource="ftcf800_artGalleryLab">
	SELECT OrderStatusId, Status
	FROM OrderStatus
	ORDER BY Status
</cfquery>


<cfform name="orderStatus" preservedata="yes">
	<table>
		<tr>
			<td>Order ID:</td>
			<td><cfinput type="text" id="orderID" name="orderID" size="5" maxlength="5"></td>
		</tr>
		<tr>
			<td>Customer Last Name:</td>
			<td><cfinput type="text" id="customerLastName" name="customerLastName" size="30" maxlength="30"></td>
		</tr>
		<tr>
			<td>Status:</td>
			<td><cfselect name="status" query="qOrderStatusTypes" vlaue="OrderStatusID" display="Status" queryposition="below">
				<option value="All" >Select All</option>
			</cfselect>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><cfinput type="submit" name="oSearch" value="Search"></td>
		</tr>
	</table>
</cfform>

<cfif isDefined("oSearch")>
	<cfparam name="status" default="All" />
	<cfparam name="orderID" default="" />
	<cfparam name="customerLastName" default="" />
	<cfquery name="qGetOrders" datasource="ftcf800_artGalleryLab" result="orderResult">
		SELECT Orders.OrderID, Orders.CustomerLastName, Orders.OrderDate, OrderStatus.Status
		FROM Orders, OrderStatus
		WHERE Orders.OrderStatusID = OrderStatus.OrderStatusID
		<cfif Form.orderID NEQ "">
			AND Orders.OrderID = #Form.orderID#
		</cfif>
		<cfif Form.customerLastName NEQ "">
			AND Orders.CustomerLastName = '#Form.customerLastName#'
		</cfif>
		<cfif Form.status NEQ "All">
			AND Orders.OrderStatusId = #Form.status#
		</cfif>
	</cfquery>
	<cfif orderResult.RecordCount GT 0>
		<table>
			<tr>
				<th>Order ID</th>
				<th>Customer Lastname</th>
				<th>Order Date</th>
				<th>Status</th>
			</tr>
			<cfoutput query="qGetOrders">
			<tr>
				<td>#qGetOrders.OrderID#</td>
				<td>#qGetOrders.CustomerLastName#</td>
				<td>#DateFormat(qGetOrders.OrderDate)#</td>
				<td>#qGetOrders.Status#</td>
			</tr>
			</cfoutput>
		</table>
	<cfelse>
		No Records Matched the Search Criteria.
	</cfif>

</cfif>

<cfinclude template="../templates/footer.cfm">


