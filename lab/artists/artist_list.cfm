<!---//--------------------------------------------------------------------
	Name:		artists.cfm
	Author:		Sue Hove
	Created:	12/10/04
	Update:		
	Copyright:	(c) 2007, Adobe Systems Inc.	
	Purpose:	Display a list of artists
---------------------------------------------------------------------//--->
<!---//--------------------------------------------------------------------
This page displays a list of artists.
---------------------------------------------------------------------//--->

<cfquery name="qArtists" datasource="ftcf800_artGalleryLab">
SELECT Artists.ArtistID, Artists.FirstName, Artists.LastName, Artists.Phone 
FROM Artists
</cfquery>

<!---include the header --->
<cfinclude template="../templates/header.cfm">

<h1>We currently have <cfoutput>#qArtists.RecordCount#</cfoutput> different artists:</h1>

<table border="2" cellpadding="3">
	<tr>
		<th>Artist ID </th>
		<th>First Name </th>
		<th>Last Name </th>
		<th>Phone</th>
	</tr>
	<cfoutput query="qArtists">
		<tr>
			<td><a href="artist_detail.cfm?ArtistID=#qArtists.ArtistID#">#qArtists.ArtistID#</a></td>
			<td>#qArtists.FirstName#</td>
			<td>#qArtists.LastName#</td>
			<td>#qArtists.Phone#</td>
		</tr>
	</cfoutput>
</table>

<!---include the footer --->
<cfinclude template="../templates/footer.cfm">
