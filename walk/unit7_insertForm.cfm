<!---//--------------------------------------------------------------------
	Name:		unit7_insertForm.cfm
	Author:		Ronghuan Zhao
	Created:	14/07/10
	Update:		
	Copyright:	(c) 2007, Adobe Systems Inc.	
	Purpose:	Building an Insert Form
---------------------------------------------------------------------//--->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert Artist Form</title>
</head>

<body>
	<h2>Insert an Artist</h2>
	<cfform name="insArtist">
	<div style="margin-bottom:8px;">
		<label>First Name:</label>
		<cfinput type="text" size="20" name="FirstName" maxlength="20"> <br/>
	</div>
	<div style="margin-bottom:8px;">
		<label>Last Name:</label>
		<cfinput type="text" size="20" name="LastName" maxLength="20" > <br/>
	</div>
	<div>
		<cfinput type="submit" name="Insert" value="Insert Artist" />
	</div>
	</cfform>
</body>
</html>