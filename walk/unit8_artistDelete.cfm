<cfquery name="qArtist" datasource="ftcf800_artGalleryLab">
SELECT ArtistID, FirstName, LastName
FROM Artists 
ORDER BY LastName
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Artist List</title>
</head>

<body>

<h2>Artists</h2>

<table border="1" cellpadding="3">
<tr>
	<td>Artist ID</td>
	<td>First Name</td>
	<td>Last Name</td>
	<td></td>
</tr>
<cfoutput query="qArtist">
<tr>
	<td>#qArtist.ArtistID#</td>
	<td>#qArtist.FirstName#</td>
	<td>#qArtist.LastName#</td>
	<td><a href="unit8_artistDelete.cfm?ArtistID=#qArtist.ArtistID#">[ Delete ]</a></td>
</tr>
</cfoutput>
</table>

</body>
</html>
