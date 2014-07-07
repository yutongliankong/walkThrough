<cfquery name="qArtist" datasource="ftcf800_artGalleryLab">
SELECT FirstName, LastName, Artists.City
FROM Artists 
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Outputting the Result Structure</title>
</head>

<body>

<h2>Artists</h2>

<cfoutput>
There are [X] artists in the database.<br /><br />
</cfoutput>

<table border="1">
	<tr>
		<th>Row #</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>City</th>
	</tr>
	<cfoutput query="qArtist">
		<tr>
			<td></td>
			<td>#qArtist.FirstName#</td>
			<td>#qArtist.LastName#</td>
			<td>#qArtist.City#</td>
		</tr>
	</cfoutput>
</table>

</body>
</html>
