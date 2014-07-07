<cfquery name="qOrderStatusTypes" datasource="ftcf800_artGalleryLab">
SELECT OrderStatusID, Status
FROM OrderStatus
ORDER BY Status ASC 
</cfquery>

<cfinclude template="../templates/header.cfm">

<h1>Order Search</h1>

<h2>Enter one of the following search criteria to locate an order: </h2>

<cfform name="orderStatus">

<table>
	<tr>
		<td>Order ID:</td>
		<td><cfinput name="orderID" size="5" maxlength="5" /></td>
	</tr>
	<tr>
		<td>Customer Last Name:</td>
		<td><cfinput name="customerLastName" size="30" maxlength="30" /></td>
	</tr>
	<tr>
		<td>Status:</td>
		<td>
			<cfselect 
				name="status" 
				query="qOrderStatusTypes" 
				display="Status"
				value="OrderStatusID"
				queryPosition="below">
				<option value="All">Select All</option>
			</cfselect>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><cfinput type="submit" name="oSearch" value="Search" /></td>
	</tr>
</table>

</cfform>

<cfif IsDefined("oSearch")>
	<cfparam name="orderID" default="" />
	<cfparam name="customerLastName" default="" />
	<cfparam name="status" default="All" />
	<cfoutput>
	#form.orderID#<br />
	#form.customerLastName#<br />
	#form.status#<br />
	</cfoutput>
</cfif>

<cfinclude template="../templates/footer.cfm">

