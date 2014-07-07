<!--- Custom Tag to display the date or time,--->

<cfif IsDefined("Attributes.Type")>
	<cfif Attributes.Type IS "Date">
		<cfoutput>#DateFormat(Now())#</cfoutput>
	<cfelseif Attributes.Type IS "Time">
		<cfoutput>#TimeFormat(Now())#</cfoutput>
	<cfelse>
		<cfoutput>#Now()#</cfoutput>
	</cfif>
<cfelse>
	<cfoutput>#Now()#</cfoutput>
</cfif>

