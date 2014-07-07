<!--- Walkthrough Unit 5 - Simple ColdFusion Component --->
<cfcomponent>

	<cffunction name="compoundInterest" returntype="numeric">
		<cfargument name="principal" type="numeric" required="true">
		<cfargument name="rate" type="numeric" required="true">				
		<cfargument name="years" type="numeric" required="true">
		<cfreturn Evaluate(arguments.principal*(1 + arguments.rate)^arguments.years)>
	</cffunction>
	
	<cffunction name="loanPayment" returntype="numeric">
		<cfargument name="principal" type="numeric" required="true">
		<cfargument name="rate" type="numeric" required="true">
		<cfargument name="years" type="numeric" required="true">
		<cfreturn Evaluate((principal*(rate*years)) + principal)>
	</cffunction>
	
</cfcomponent>