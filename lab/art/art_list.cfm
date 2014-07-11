<!---//--------------------------------------------------------------------
	Name:		art_list.cfm
	Author:		Sue Hove
	Created:	12/8/04
	Update:		
	Copyright:	(c) 2007, Adobe Systems Inc.	
	Purpose:	List of art pieces available
---------------------------------------------------------------------//--->
<!---//--------------------------------------------------------------------
This page is linked to the main toolbar on the Gallery link. It displays a list of all art items. This page will be used to link up the functionality for adding and editing pieces of artwork in labs 8 & 9.
---------------------------------------------------------------------//--->

<cfquery name="qArtList" datasource="#Application.dsn#">
SELECT ArtID, ArtName, Description, Price
FROM Art
</cfquery>

<!---include the header--->
<cfinclude template="../templates/header.cfm">

<h1>Art Inventory </h1>
<p><a href="art_add.cfm">[Add Art] </a></p>
<table border="2" cellpadding="3">
  <tr>
    <td>Piece </td>
    <td>Description</td>
    <td>Price</td>
    <td>&nbsp;</td>
  </tr>
  <cfoutput query="qArtList">
    <tr>
      <td>#qArtList.ARTNAME#</td>
      <td>#qArtList.Description#</td>
      <td>#DollarFormat(qArtList.PRICE)#</td>
      <td><a href="art_edit.cfm?artID=#qArtList.ArtID#">[Edit]</a></td>
    </tr>
  </cfoutput>
</table>

<!---include the footer--->
<cfinclude template="../templates/footer.cfm">