<cfquery name="qMixedMedia" datasource="ftcf800_artGalleryLab">
SELECT Art.ArtName, Art.Description, Art.Price, Art.Largeimage, Artists.FirstName, Artists.LastName
FROM Art, Artists
WHERE Art.ArtistID = Artists.ArtistID
	AND Art.ArtType_ID = 2
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Mixed Media</title>
</head>

<body>

<table cellpadding="5">
<cfoutput query="qMixedMedia">
	<tr>
		<td><img src="../lab/images/artwork/#qMixedMedia.Largeimage#" /></td>
		<td valign="top">
			#qMixedMedia.ArtName#<br />
			<em>by #qMixedMedia.FirstName# #qMixedMedia.FirstName#</em><br />
			#qMixedMedia.Description#<br />
		</td>
	</tr>
</cfoutput>
</table>


</body>
</html>
