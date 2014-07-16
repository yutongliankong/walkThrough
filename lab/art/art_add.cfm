<!---//--------------------------------------------------------------------
	Name:		art_add.cfm
	Author:		Sue Hove
	Created:	12/8/04
	Update:		
	Copyright:	(c) 2007, Adobe Systems Inc.	
	Purpose:	Form to accept art items
---------------------------------------------------------------------//--->
<!---//--------------------------------------------------------------------
This page is a generic form for inserting information into the ART table. In lab 7 you will modify this form to ensure it meets with the database storage requirements. You will then create the ACTION logic to insert the row into the database.
---------------------------------------------------------------------//--->

<!---Get a valid list of Artists --->
<cfquery name="qArtists" datasource="#Application.dsn#">
SELECT ArtistID, FirstName, LastName 
FROM Artists 
ORDER BY LastName ASC
</cfquery>

<cfquery name="qArtTypes" datasource="#Application.dsn#">
SELECT ArtType_ID, ArtType
FROM ArtType
ORDER BY ArtTYpe
</cfquery>

<!---include the header--->
<cfinclude template="../templates/header.cfm">

<h1>Insert Art Piece</h1>

<cfform name="insArt">
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
        <td><cfinput type="text" name="ArtName" value="" maxlength="50" 
                required="yes" message="Please input the art name." validateat="onblur, onsubmit"></td>
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
    	<td><cfinput type="text" name="Price" 
                required="yes" message="Please input the price." validate="float" validateat="onblur, onsubmit"></td>
    </tr>
    <tr valign="baseline">
        <td nowrap align="right">Image File Name:</td>
        <td><cfinput type="text" name="Largeimage" maxlength="30"
                required="yes" message="Please input image file name." validateat="onblur, onsubmit"></td>
    </tr>
    <tr valign="baseline">
        <td nowrap align="right">Sold?</td>
        <td><cfinput type="checkbox" name="IsSold" value="1" id="IsSold"></td>
    </tr>
    <tr valign="baseline">
        <td nowrap align="right">&nbsp;</td>
        <td><cfinput type="submit" value="Insert record" name="insArt"></td>
    </tr>
</table>
</cfform>

<cfif isDefined("Form.insArt")>
    <cfparam name="Form.IsSold" default="0" />
    <cfquery name="insertArt" datasource="#Application.dsn#" >
        INSERT INTO Art (ArtistID, ArtName, ArtType_ID, Description, Price, Largeimage, IsSold)
        VALUES (#Form.ArtistID#, '#Form.ArtName#', #Form.ArtType_ID#, '#Form.Description#', '#Form.Price#', '#Form.Largeimage#', #Form.IsSold#)
    </cfquery>
    <cflocation url="art_list.cfm" addtoken="no">
</cfif>

<!---include the footer --->
<cfinclude template="../templates/footer.cfm">

