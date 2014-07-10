<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert Artist Form</title>
</head>

<body>

<h2>Insert an Artist</h2>

<cfform name="insArtist">

First Name:
<cfinput type="text" name="FirstName" maxlength="20" required="yes" message="Please input an artist first name." validateat="onserver" /><br/>

Last Name:
<cfinput type="text" name="LastName" maxlength="20" required="yes" message="Please input an artist last name." validateat="onsubmit" /><br/>

<cfinput type="submit" name="Insert" value="Insert Artist" />

</cfform>
<br /><br />

<cfif isDefined("Form.Insert")>
	<cfquery name="qInsert" datasource="ftcf800_artGalleryLab">
		INSERT INTO Artists (FirstName, LastName)
		VALUES ('#Form.FirstName#', '#Form.LastName#')
	</cfquery>
	The artist has been added to the database.
</cfif>

</body>
</html>
