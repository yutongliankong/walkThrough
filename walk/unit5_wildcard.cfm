<cfquery name="qGetArtist" datasource="ftcf800_artGalleryLab">
SELECT FirstName, LastName 
FROM Artists
ORDER BY LastName
</cfquery>

<html>
<head>
<title>Dynamic Query Form</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<cfform name="queryArtist" preservedata="yes">

	<table>
	<tr>
		<td>Artist:</td>
		<td>
			<cfselect name="lastName"
				size="1"
				query="qGetArtist"
				display="LastName"
				value="LastName"
				queryPosition="below">
				<option value="All">All Artists</option>
			</cfselect>
		</td>
	</tr>
	<tr>
		<td>City:</td>
		<td><cfinput name="city" type="text" maxlength="20" size="20"></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><cfinput name="search" type="submit" value="Search"></td>
	</tr>
	</table>

</cfform>

<cfif IsDefined("Form.Search")>
	<cfparam name="Form.LastName" default="All" />
	<cfparam name="Form.City" default="" />
	<cfquery name="qArtistsResults" datasource="ftcf800_artGalleryLab" result="resultInfo">
	SELECT FirstName, LastName, City
	FROM Artists
	WHERE 0 = 0
	<cfif Form.LastName IS NOT "All">
		AND LastName = '#Form.LastName#'
	</cfif>
	<cfif Form.City IS NOT "">
		AND City = '#Form.City#'
	</cfif>
	ORDER BY LastName ASC 
	</cfquery>
	<cfif resultInfo.RecordCount eq 0>
		No Records Matched the Search Criteria.
	<cfelse>
		<table border="1">
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>City</th>
			</tr>
			<cfoutput query="qArtistsResults">
				<tr>
					<td>#qArtistsResults.FirstName#</td>
					<td>#qArtistsResults.LastName#</td>
					<td>#qArtistsResults.City#</td>
				</tr>
			</cfoutput>
		</table>
	</cfif>
</cfif>

</body>
</html>
