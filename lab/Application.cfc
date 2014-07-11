<cfcomponent>
	<cfset this.name="ArtGallery">
	<cfset this.SessionManagement="yes">
	<sfset this.SetClientCookies="yes">
	<cffunction name="onApplicationStart" access="public">
		<cfset Application.dsn="ftcf800_artGalleryLab" >
	</cffunction>
	<cffunction name="onRequest" access="public" >
		<cfargument name="targetTemplate" type="string" required="yes">
		<cfif isDefined("Session.isLoggedIn")>
			<cfinclude template="#Arguments.targetTemplate#">
		<cfelse>
			<cfinclude template="login.cfm">
		</cfif>
		
	</cffunction>
</cfcomponent>