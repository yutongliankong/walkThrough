<!---Walkthrough unit 5 loan function --->
<cfscript>
function loan(principal,rate,months)
{
	/*
		This function accepts three arguments:
			Principal: The amount of the loan
			Rate: The interest rate as a whole number, ie 6% would be passed as 6
			Months: The duration of the loan in months 
		The function returns the total amount that will be repaid
	*/ 
	var repayment = 0;
	repayment = principal * (rate/100) * (months/12) + principal;
	return DollarFormat(repayment); //This is the value sent back to the calling location
}
</cfscript>

