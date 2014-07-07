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

</body>
</html>
