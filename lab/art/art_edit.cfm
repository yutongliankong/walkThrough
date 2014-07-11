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

<cfif  NOT isDefined("URL.artID")>
	<cflocation url="art_list.cfm">
</cfif>

<cfquery name="qArt" datasource="#Application.dsn#">
SELECT *
FROM Art
WHERE Art.ArtID = #URL.artID#
</cfquery>
<!---Get a valid list of Artists --->
<cfquery name="qArtists" datasource="#Application.dsn#">
SELECT ArtistID, FirstName, LastName 
FROM Artists 
ORDER BY LastName ASC
</cfquery>

<cfquery name="qArtTypes" datasource="#Application.dsn#">
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
			<cfselect name="ArtistID" query="qArtists" value="ArtistID" display="LastName" selected="#qArt.ArtistID#">
			</cfselect>
		</td>
	</tr>
	<tr valign="baseline">
		<td nowrap align="right">Art Name:</td>
		<td>
        	<cfinput type="text" name="ARTNAME" size="32" maxlength="50" value="#qArt.ArtName#">
		</td>
    </tr>
	<tr valign="baseline">
		<td nowrap align="right">Art Type:</td>
		<td>
        	<cfselect name="ArtType_ID" query="qArtTypes" value="ArtType_ID" display="ArtType" selected="#qArt.ArtType_ID#">
			</cfselect>
		</td>
	</tr>
	<tr valign="baseline">
		<td nowrap align="right">Description:</td>
		<td><cftextarea name="Description" wrap="virtual" cols="28" rows="3" id="Description"><cfoutput>#qArt.Description#</cfoutput></cftextarea></td>
	</tr>
	<tr valign="baseline">
		<td nowrap align="right">Price: </td>
		<td><cfinput type="text" name="PRICE" size="32" value="#qArt.Price#"></td>
	</tr>
	<tr valign="baseline">
		<td nowrap align="right">Image File Name:</td>
		<td><cfinput type="text" name="LARGEIMAGE" size="32"  maxlength="30" value="#qArt.Largeimage#"></td>
	</tr>
	<tr valign="baseline">
		<td nowrap align="right">Sold? </td>
		<td><cfinput type="checkbox" name="ISSOLD" value="1" id="ISSOLD" checked="#qArt.IsSold#"></td>
	</tr>
	<tr valign="baseline">
		<td nowrap align="right">&nbsp;</td>
		<td><cfinput type="submit" value="Update record" name="updArt"></td>
	</tr>
	</table>
	<cfinput type="hidden" value="#qArt.ArtID#" name="ArtID">
</cfform>

<cfif isDefined("Form.updArt")>
	<cfparam name="Form.ISSOLD" default="0" />
	<cfquery name="updArt" datasource="#Application.dsn#">
		UPDATE Art
		SET ArtistID = #Form.ArtistID#, 
			ArtName = '#Form.ARTNAME#',
			ArtType_ID = #Form.ArtType_ID#,
			Description = '#Form.Description#',
			Price = '#Form.Price#',
			Largeimage = '#Form.LARGEIMAGE#',
			IsSold = #Form.ISSOLD#
		WHERE ArtID = #Form.ArtID#
	</cfquery>
	<cflocation url="art_list.cfm">
</cfif>

<!---include the footer --->
<cfinclude template="../templates/footer.cfm">
