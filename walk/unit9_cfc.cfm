<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Calling CFC</title>
</head>

<body>
	<cfset Rate=10>
	<cfset Principal=10000>
	<cfset Years=18>
	<cfinvoke component="financial" method="compoundInterest" returnvariable="yield">
		<cfinvokeargument name="Rate" value="#Variables.Rate#">
		<cfinvokeargument name="Principal" value="#Variables.Principal#">
		<cfinvokeargument name="Years" value="#Variables.Years#">
	</cfinvoke>

	<cfoutput>
		#DollarFormat(principal)# compounded yearly at #Evaluate(rate*100)#% for #years# years would yield #DollarFormat(yield)#.
	</cfoutput>
</body>
</html>