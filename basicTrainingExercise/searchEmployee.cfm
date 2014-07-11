<cfparam name="From.employeeName" default="" />
<cfparam name="From.department" default="All" />
<cfquery name="qEmployee" datasource="employee" result="employeeResult">
	SELECT firstName, surname, phoneExtension, departmentName
	FROM employee, department
	WHERE employee.departmentId = department.departmentId
	<cfif isDefined("Form.search")>
		<cfif Form.employeeName NEQ "">
			AND firstName LIKE '%#Form.employeeName#%'
		</cfif>
		<cfif Form.department NEQ "All">
			AND department.departmentId = #Form.department#
		</cfif>
	</cfif>
</cfquery>

<cfquery name="qDepartment" datasource="employee" result="departmentResult">
	SELECT departmentId, departmentName
	FROM department
	ORDER BY departmentId
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="employSearch.css" rel="stylesheet" type="text/css"> 
<title>FInd a Gruden Employee</title>
</head>

<body>

	<cfform name="searchEmpolyeeForm" preservedata="yes">
		<h1>FInd a Gruden Employee</h1>
 		<fieldset>
	    	<legend>Search Form</legend>
	   		<label for="employeeName" class="marginRule">Employee Name:</label>
	   		<input class="marginRule" style="ime-mode:disabled" type="text" name="employeeName" id="employeeName" />
	   		<label for="department" class="marginRule">Department:</label>
	   		<cfselect  class="marginRule" name="department" id="department" query="qDepartment" 
	   			display="departmentName" value="departmentId" queryposition="below" style="font: 1em Arial">
	   			<option value="All">All</option>
	   		</cfselect>
	   		<input type="submit" name="search" value="Search">
 		</fieldset>
 		
 		<cfif employeeResult.RecordCount GT 0>
 			<h2>Search Results</h2>
 			<cfoutput><h2>Found #employeeResult.RecordCount# result(s).</h2></cfoutput>
 		<table cellSpacing="0" cellpadding="0">
 			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Phone Extension</th>
				<th>Department</th>
 			</tr>
 			<cfoutput query="qEmployee">
			<tr>
				<td>#qEmployee.firstName# #qEmployee.surname#</td>
				<td><a href="mailto:#qEmployee.firstName#@gruden.com">#lcase(qEmployee.firstName)#@gruden.com</a></td>
				<td style="text-align:right;">#qEmployee.phoneExtension#</td>
				<td>#qEmployee.DepartmentName#</td>
			</tr>
 			</cfoutput>
 		</table>
 		<cfelse>
 			<h2>No results found.</h2>
 		</cfif>



	</cfform>


</body>
</html>
