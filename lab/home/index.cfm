<cfinclude template="../templates/header.cfm">
<cfquery name="qGetDailyArt" datasource="#Application.dsn#" result="resultInfo">
	SELECT Art.ArtName, Art.Description, Art.Largeimage, DailyArt.SalePrice
	FROM Art, DailyArt
	WHERE Art.ArtID = DailyArt.DailyArtID
</cfquery>


		<h2>
			<cfoutput>
				#qGetDailyArt.RecordCount#
			</cfoutput>
			Art of the Day Specials
		</h2>
		<cf_date>
		<table>
			<tr>
			<th>Row</th>
			<th>Art Name</th>
			<th>Description</th>
			<th>Image</th>
			<th>Sale Price</th>
			</tr>
		
			<cfoutput query="qGetDailyArt">
				<tr>
				<td>#qGetDailyArt.CurrentRow#</td>
				<td>#qGetDailyArt.ArtName#</td>
				<td>#qGetDailyArt.Description#</td>
				<td><img src="../images/artwork/#qGetDailyArt.Largeimage#" ></td>
				<td>#DollarFormat(qGetDailyArt.SalePrice)#</td>
				</tr>
			</cfoutput>
		</table>



<cfinclude template="../templates/footer.cfm">

