<cfcomponent>
	<cfset this.name="ArtGallery">
	<cffunction name="onRequest" access="public" >
		<cfargument name="targetTemplate" type="string" required="yes">
		<cfinclude template="#Arguments.targetTemplate#">
	</cffunction>
</cfcomponent>