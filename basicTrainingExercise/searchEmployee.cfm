<cfif isDefined("Form.search")>
	<cfset application.employeeName = #Form.employeeName#>
	<cfset application.departmentName = #Form.department#>
</cfif>
<cfquery name="qEmployee" datasource="employee" result="employeeResult">
	
	SELECT firstName, surname, phoneExtension, departmentName
	FROM employee, department
	WHERE employee.departmentId = department.departmentId
	<cfif isDefined("Form.search")>
		<cfif Form.employeeName NEQ "">
			AND (firstname+surname LIKE  <cfqueryparam cfsqltype="cf_sql_varchar" value="%#Form.employeeName#%">)
		</cfif>
		<cfif Form.department NEQ "All">
			AND department.departmentId = <cfqueryparam cfsqltype="cf_sql_integer" value="#Form.department#">
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

	<form name="searchEmpolyeeForm" action="searchEmployee.cfm" method="post">
		<h1>FInd a Gruden Employee</h1>

 		<fieldset>
	    	<legend>Search Form</legend>
	   		<label for="employeeName" class="marginRule">Employee Name:</label>
	   		<cfoutput><input class="marginRule" style="ime-mode:disabled" type="text" name="employeeName" id="employeeName" <cfif isDefined("Form.search")>value="#application.employeeName#"</cfif> /></cfoutput>
	   		<label for="department" class="marginRule">Department:</label>
	   		<select  class="marginRule" name="department" id="department">
	   			<cfoutput><option value="All" <cfif  (application.departmentName EQ "All") AND isDefined("Form.search")>selected</cfif>>All</option></cfoutput>
	   			<cfoutput query="qDepartment">
					<option value="#qDepartment.departmentId#" <cfif  (application.departmentName EQ qDepartment.departmentId) AND isDefined("Form.search")>selected</cfif>>#qDepartment.departmentName#</option>
				</cfoutput>
				
	   		</select>
	   		<input type="submit" name="search" value="Search">
 		</fieldset>
 		
 		<cfif  isDefined("Form.search")>
 			<h2>Search Results</h2>
 			<cfif employeeResult.RecordCount GT 0>
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
						<td class="textAlighRight">#qEmployee.phoneExtension#</td>
						<td>#qEmployee.DepartmentName#</td>
					</tr>
		 			</cfoutput>
 				</table>
 				<cfoutput><h2>Found #employeeResult.RecordCount# result(s).</h2></cfoutput>
 			<cfelse>
 				<h2>No results found.</h2>
			</cfif>
 		</cfif>
	</form>
</body>
</html>
