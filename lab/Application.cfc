<cfcomponent>
	<cfset this.name="ArtGallery">
	<cffunction name="onApplicationStart" access="public">
		<cfset Application.dsn="ftcf800_artGalleryLab" >
	</cffunction>
	<cffunction name="onRequest" access="public" >
		<cfargument name="targetTemplate" type="string" required="yes">
		<cfinclude template="#Arguments.targetTemplate#">
	</cffunction>
</cfcomponent>