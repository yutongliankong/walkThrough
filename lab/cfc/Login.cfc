<cfcomponent>

	<cffunction name="checkLogin" access="public" >
		<cfargument name="Email" type="string" required="yes">
		<cfargument name="AdminPassword" type="string" required="yes">
		
		<cfquery name="qCheckLogin" datasource="#Application.dsn#" result="resultInfo">
		SELECT Email, AdminPassword
		FROM GalleryAdmin
		WHERE Email = <cfqueryparam value="#arguments.Email#" cfsqltype="cf_sql_varchar" />
			AND AdminPassword = <cfqueryparam value="#arguments.AdminPassword#" cfsqltype="cf_sql_varchar" />
		</cfquery>
		
		<cfif resultInfo.recordCount>
			<cfset Session.isLoggedIn="true">
		</cfif>

		
	</cffunction>

	<cffunction name="logOut" access="public">

		<cfset structClear(Session)>

	</cffunction>	
		
</cfcomponent>

