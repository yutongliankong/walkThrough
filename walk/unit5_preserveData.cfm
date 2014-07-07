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

<cfform name="queryArtist">

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
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><cfinput name="search" type="submit" value="Search"></td>
	</tr>
	</table>

</cfform>

<cfif IsDefined("Form.Search")>
	<cfparam name="Form.LastName" default="All" />
	<cfquery name="qArtistsResults" datasource="ftcf800_artGalleryLab">
	SELECT FirstName, LastName, City
	FROM Artists
	<cfif Form.LastName IS NOT "All">
		WHERE LastName = '#Form.LastName#'
	</cfif>
	ORDER BY LastName ASC 
	</cfquery>
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

</body>
</html>
