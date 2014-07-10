<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Update Artist Form</title>
</head>

<body>

<h2>Update an Artist </h2>

<cfparam name="URL.ArtistID" default="1">
<cfquery name="qArtist" datasource="ftcf800_artGalleryLab">
	SELECT FirstName, LastName, ArtistID
	FROM Artists
	WHERE Artists.ArtistID = #URL.ArtistID#
	
</cfquery>

<cfform name="updArtist">

First Name: 
<cfinput type="text" name="FirstName" size="20" maxlength="20" required="yes" message="Please input an Artist's first name." validateat="onServer" id="FirstName" value="#qArtist.FirstName#">
<br />

Last Name: 
<cfinput type="text" name="LastName" size="20" maxlength="20" required="yes" message="Please input an Artist's last name." validateat="onSubmit" id="LastName" value="#qArtist.LastName#">
<br />

<cfinput type="submit" name="update" value="Update Artist" id="update">
<cfinput type="hidden" name="AitsitID" value="#qArtist.ArtistID#">
</cfform>   

</body>
</html>

