<!---//--------------------------------------------------------------------
	Name:		art_edit.cfm
	Author:		Sue Hove
	Created:	12/8/04
	Update:		
	Copyright:	(c) 2007, Adobe Systems Inc.	
	Purpose:	Form to update an art item
---------------------------------------------------------------------//--->
<!---//--------------------------------------------------------------------
This page is a generic form for updating a row in the ART table. You will prefill the form controls with the row of data and perform the update logic in the ACTION logic.
---------------------------------------------------------------------//--->

<!---Get a valid list of Artists --->
<cfquery name="qArtists" datasource="ftcf800_artGalleryLab">
SELECT ArtistID, FirstName, LastName 
FROM Artists 
ORDER BY LastName ASC
</cfquery>

<cfquery name="qArtTypes" datasource="ftcf800_artGalleryLab">
SELECT ArtType_ID, ArtType
FROM ArtType
ORDER BY ArtType
</cfquery>

<!---include the header --->
<cfinclude template="../templates/header.cfm">

<h1>Edit Art Piece</h1>
<cfform name="updart">
	<table align="left">
	<tr valign="baseline">
		<td nowrap align="right">Artist:</td>
		<td>
			<cfselect name="ArtistID" query="qArtists" value="ArtistID" display="LastName">
			</cfselect>
		</td>
	</tr>
	<tr valign="baseline">
		<td nowrap align="right">Art Name:</td>
		<td>
        	<cfinput type="text" name="ARTNAME" size="32" maxlength="50">
		</td>
    </tr>
	<tr valign="baseline">
		<td nowrap align="right">Art Type:</td>
		<td>
        	<cfselect name="ArtType_ID" query="qArtTypes" value="ArtType_ID" display="ArtType">
			</cfselect>
		</td>
	</tr>
	<tr valign="baseline">
		<td nowrap align="right">Description:</td>
		<td><cftextarea name="Description" wrap="virtual" cols="28" rows="3" id="Description"></cftextarea></td>
	</tr>
	<tr valign="baseline">
		<td nowrap align="right">Price: </td>
		<td><cfinput type="text" name="PRICE" size="32" ></td>
	</tr>
	<tr valign="baseline">
		<td nowrap align="right">Image File Name:</td>
		<td><cfinput type="text" name="LARGEIMAGE" size="32"  maxlength="30" ></td>
	</tr>
	<tr valign="baseline">
		<td nowrap align="right">Sold? </td>
		<td><cfinput type="checkbox" name="ISSOLD" value="1" id="ISSOLD"></td>
	</tr>
	<tr valign="baseline">
		<td nowrap align="right">&nbsp;</td>
		<td><cfinput type="submit" value="Update record" name="updArt"></td>
	</tr>
	</table>
</cfform>

<!---include the footer --->
<cfinclude template="../templates/footer.cfm">

