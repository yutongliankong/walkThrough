<cfinclude template="../templates/header.cfm">

<h1>Oeder Search</h1>
<h2>Enter one of the following search criteria to locate an order: </h2>
<cfquery name="qOrderStatusTypes" datasource="ftcf800_artGalleryLab">
	SELECT OrderStatusId, Status
	FROM OrderStatus
	ORDER BY Status
</cfquery>
<cfform name="orderStatus">
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
<cfoutput>
<cfif isDefined("oSearch")>
	<cfparam name="status" default="All" />
	<cfparam name="orderID" default="" />
	<cfparam name="customerLastName" default="" />
	#Form.status# <br />
	#Form.orderId# <br />
	#Form.customerLastName# <br />
</cfif>
</cfoutput>
<cfinclude template="../templates/footer.cfm">


