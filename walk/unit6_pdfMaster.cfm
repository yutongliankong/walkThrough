<cfquery name="qStatus" datasource="ftcf800_artGalleryLab">
SELECT OrderStatusID, Status 
FROM OrderStatus
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Drill-Down Interface - Master</title>
</head>

<body>

<h2>Search for Orders by Status</h2>

<cfoutput query="qStatus">
  <a href="unit6_pdfDetail.cfm?osid=#qStatus.OrderStatusID#&status=#qStatus.Status#">#qStatus.Status#</a><br />
</cfoutput>

</body>
</html>
