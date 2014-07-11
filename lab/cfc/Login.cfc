<cfcomponent>

	<cffunction name="checkLogin" access="public" returntype="boolean">
		<cfargument name="Email" type="string" required="yes">
		<cfargument name="AdminPassword" type="string" required="yes">
		
		<cfset isLoggedIn="false">
		
		<cfquery name="qCheckLogin" datasource="#Application.dsn#" result="resultInfo">
		SELECT Email, AdminPassword
		FROM GalleryAdmin
		WHERE Email = <cfqueryparam value="#arguments.Email#" cfsqltype="cf_sql_varchar" />
			AND AdminPassword = <cfqueryparam value="#arguments.AdminPassword#" cfsqltype="cf_sql_varchar" />
		</cfquery>
		
		<cfif resultInfo.recordCount>
			<cfset isLoggedIn="true" />
		</cfif>

		<cfreturn isLoggedIn>
	</cffunction>

	<cffunction name="logOut" access="public">
		
	</cffunction>	
		
</cfcomponent>

