<cfparam name="URL.ArtistID" default="1">

<cfquery name="qArtist" datasource="ftcf800_artGalleryLab">
SELECT ArtistID, FirstName, LastName
FROM Artists 
WHERE ArtistID = #URL.ArtistID#
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Update Artist Form</title>
</head>

<body>

<h2>Update an Artist </h2>

<cfform name="updArtist">

<cfinput type="hidden" name="ArtistID" value="#qArtist.ArtistID#">

First Name: 
<cfinput type="text" name="FirstName" size="20" maxlength="20" required="yes" message="Please input an Artist's first name." validateat="onServer" id="FirstName" value="#qArtist.FirstName#">
<br />

Last Name: 
<cfinput type="text" name="LastName" size="20" maxlength="20" required="yes" message="Please input an Artist's last name." validateat="onSubmit" id="LastName" value="#qArtist.LastName#">
<br />

<cfinput type="submit" name="update" value="Update Artist" id="update">

</cfform>   
<cfif isDefined("Form.update")>
	<cfquery name="qUpdateArtist" datasource="ftcf800_artGalleryLab">
	UPDATE Artists
	SET FirstName='#Form.FirstName#',
		LastName='#Form.LastName#'
	WHERE ArtistID = #Form.ArtistID#
	</cfquery>
	<cflocation url="unit8_artistList2.cfm" addtoken="no">
</cfif>

</body>
</html>

