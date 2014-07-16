<cfcomponent>
	<cfset this.name="basicTraining">
	<cffunction name="onApplicationStart" returntype="boolean">
		<cfset application.employeeName = "">
		<cfset application.departmentName = "All">
		<cfreturn true>
	</cffunction>
	
</cfcomponent>