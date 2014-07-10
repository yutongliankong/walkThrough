<cfinclude template="../templates/header.cfm">



<cfinclude template="../templates/footer.cfm">

<cfquery name="qGetDailyArt" datasource="ftcf800_artGalleryLab" result="resultInfo">
SELECT Art.ArtName, Art.Description, Art.Largeimage, DailyArt.SalePrice
FROM Art, DailyArt
WHERE Art.ArtID = DailyArt.DailyArtID
</cfquery>

<html>
	<body>
		<h2>
			<cfoutput>
				#qGetDailyArt.RecordCount#
			</cfoutput>
			Art of the Day Specials
		</h2>
		<cf_date>
		<table border="2">
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
	</body>
</html>
