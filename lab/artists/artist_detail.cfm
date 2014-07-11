<cfinclude template="../templates/header.cfm">

<cfquery name="qArtistDetail" datasource="#Application.dsn#" result="artInfo">
SELECT Art.ArtName, Art.Description, ArtType.ArtType, Art.Price, Art.Largeimage, Art.IsSold
FROM Art, ArtType
WHERE Art.ArtType_ID = ArtType.ArtType_ID
<cfif isDefined("URL.ArtistID")>
	AND Art.ArtistID = #URL.ArtistID#
</cfif>
ORDER BY Art.ArtName
</cfquery>
<cfif artInfo.RecordCount GT 0>
	<table border="1">
		<tr>
			<th>Art Name</th>
			<th>Description</th>
			<th>Art Type</th>
			<th>Price</th>
			<th>Large Image</th>
			<th>Is Sold</th>
		</tr>
		
		<cfoutput query="qArtistDetail">
		<tr>
			<td>#qArtistDetail.ArtName#</td>
			<td>#qArtistDetail.Description#</td>
			<td>#qArtistDetail.ArtType#</td>
			<td>#DollarFormat(qArtistDetail.Price)#</td>
			<td><img src="../images/artwork/#qArtistDetail.Largeimage#"></td>
			<td>#YesNoFormat(qArtistDetail.IsSold)#</td>
		</tr>
		</cfoutput>
		
	</table>
<cfelse>
	No Records
</cfif>


<cfinclude template="../templates/footer.cfm">



