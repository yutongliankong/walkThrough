<cfif isDefined("Form.logIn")>
	<cfset message="">
	<cfinvoke component="walkThrough.lab.cfc.login" method="checklogin" >
		<cfinvokeargument name="Email" value="#Form.Email#" />
		<cfinvokeargument name="AdminPassword" value="#Form.AdminPassword#" />
	</cfinvoke>
	<cfif isDefined("Session.isLoggedIn")>
		<cflocation url="http://localhost:80/walkThrough/lab/home/index.cfm">
	<cfelse>
		<cfset message=message="Invalid login: please try again.">
	</cfif>
	
</cfif>

<H2>Art Gallery Login</H2>

<cfif isDefined("Variables.message")>
	<cfoutput>
		<span style="color:##FF0000">#Variables.message#</span>
	</cfoutput>
	<br /><br />
</cfif>

<cfform  name="loginForm">
  <table>
	 <tr>
		<td>username:</td>
		<td><cfinput type="text" name="Email" required="yes" message="A username is required"></td>
	 </tr>
	 <tr>
		<td>password:</td>
		<td><cfinput type="password" name="AdminPassword" required="yes" message="A password is required"></td>
	 </tr>		 
	 </table>
  <br>
  <input type="submit" name="logIn" value="Log In">
</cfform>


