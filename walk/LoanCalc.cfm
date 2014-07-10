<!---
NAME:
CF_LoanCalc

DESCRIPTION:
Cold Fusion custom tag to display a configurable loan calculator.

ATTRIBUTES:
BGCOLOR     - (optional) table background color (defaults to FFFFFF (white)).
BORDER      - (optional) table border value (defaults to 1).
BORDERCOLOR - (optional) table border color (defaults to "").
DOWNPAYMENT - (optional) default down payment value.
FONTCOLOR   - (optional) text font color (defaults to "").
FONTFACE    - (optional) text font face (defaults to "").
FONTSIZE    - (optional) text font size (defaults to "").
INTEREST    - (optional) default interest value.
PAYMENTS    - (optional) default number of payments value.
PRINCIPAL   - (optional) default principal value.
PROMPTS     - (optional) text to use for field prompts and buttons, must be a
                         comma delimited list with exactly 7 elements each of which
						 is prompt or button text. Each element position corresponds
						 to a particular prompt or label:
						 1: PRINCIPAL field prompt
						 2: DOWN PAYMENT field prompt
						 3: NUM OF PAYMENTS field prompt
						 4: INTEREST RATE field prompt
						 5: MONTHLY PAYMENT field prompt
						 6: CACLULATE button text
						 7: RESTART button text
						 (values default to the capitilized text above).
STYLE       - (optional) style, may be HORIZONTAL or VERTICAL (default is VERTICAL).

NOTES:
This tag creates and displays a loan calculator that uses JavaScript code
to calculate payments monthly payments based on specified principal, interest,
and number of payments. The loan calculator is highly configurable. You may
specify a style (horizontal or vertical), specify font color size and border
informatiln, and even change the default prompts and button labels.

USAGE:
To use just call <CF_LoanCalc> from within your Cold Fusion template. You may
pass any of the optional attributes to well to configure the calculator.

EXAMPLES:
 Simple loan calculator:
  <CF_LoanCalc>
 Horizontal style:
  <CF_LoanCalc STYLE="HORIZONTAL">
 Specifying a default premium value:
  <CF_LoanCalc PRINCIPAL="25000">
 Specifying font, color, and border information:
  <CF_LoanCalc FONTFACE="Verdana,Arial" COLOR="YELLOW" SIZE="2" BGCOLOR="BLUE" BORDER="1">
 
AUTHOR:
Ben Forta (ben@stoneage.com) 9/10/97
--->

<!--- Initialize variables --->
<CFIF IsDefined("ATTRIBUTES.bgcolor")>
 <CFSET bgcolor = ATTRIBUTES.bgcolor>
<CFELSE>
 <CFSET bgcolor = "">
</CFIF>

<CFIF IsDefined("ATTRIBUTES.border")>
 <CFSET border = ATTRIBUTES.border>
<CFELSE>
 <CFSET border = "1">
</CFIF>

<CFIF IsDefined("ATTRIBUTES.bordercolor")>
 <CFSET bordercolor = ATTRIBUTES.bordercolor>
<CFELSE>
 <CFSET bordercolor = "">
</CFIF>

<CFSET downpayment = "">
<CFIF IsDefined("ATTRIBUTES.downpayment")>
 <CFIF IsNumeric(ATTRIBUTES.downpayment)>
  <CFSET downpayment = ATTRIBUTES.downpayment>
 </CFIF>
</CFIF>

<CFIF IsDefined("ATTRIBUTES.fontcolor")>
 <CFSET fontcolor = ATTRIBUTES.fontcolor>
<CFELSE>
 <CFSET fontcolor = "">
</CFIF>

<CFIF IsDefined("ATTRIBUTES.fontface")>
 <CFSET fontface = ATTRIBUTES.fontface>
<CFELSE>
 <CFSET fontface = "">
</CFIF>

<CFIF IsDefined("ATTRIBUTES.fontsize")>
 <CFSET fontsize = ATTRIBUTES.fontsize>
<CFELSE>
 <CFSET fontsize = "">
</CFIF>

<CFSET interest = "">
<CFIF IsDefined("ATTRIBUTES.interest")>
 <CFIF IsNumeric(ATTRIBUTES.interest)>
  <CFSET interest = ATTRIBUTES.interest>
 </CFIF>
</CFIF>

<CFSET payments = "">
<CFIF IsDefined("ATTRIBUTES.payments")>
 <CFIF IsNumeric(ATTRIBUTES.payments)>
  <CFSET payments = ATTRIBUTES.payments>
 </CFIF>
</CFIF>

<CFSET principal = "">
<CFIF IsDefined("ATTRIBUTES.principal")>
 <CFIF IsNumeric(ATTRIBUTES.principal)>
  <CFSET principal = ATTRIBUTES.principal>
 </CFIF>
</CFIF>

<CFSET prompt1 = "Principal">
<CFSET prompt2 = "Down Payment">
<CFSET prompt3 = "Num Of Payments">
<CFSET prompt4 = "Interest Rate">
<CFSET prompt5 = "Monthly Payment">
<CFSET prompt6 = "Calculate">
<CFSET prompt7 = "Restart">
<CFIF IsDefined("ATTRIBUTES.prompts")>
 <CFIF ListLen(ATTRIBUTES.prompts) IS 7>
  <CFSET prompt1 = ListGetAt(ATTRIBUTES.prompts, 1)>
  <CFSET prompt2 = ListGetAt(ATTRIBUTES.prompts, 2)>
  <CFSET prompt3 = ListGetAt(ATTRIBUTES.prompts, 3)>
  <CFSET prompt4 = ListGetAt(ATTRIBUTES.prompts, 4)>
  <CFSET prompt5 = ListGetAt(ATTRIBUTES.prompts, 5)>
  <CFSET prompt6 = ListGetAt(ATTRIBUTES.prompts, 6)>
  <CFSET prompt7 = ListGetAt(ATTRIBUTES.prompts, 7)>
 </CFIF>
</CFIF>

<CFSET style = "VERTICAL">
<CFIF IsDefined("ATTRIBUTES.style")>
 <CFIF (ATTRIBUTES.style IS "HORIZONTAL") OR (ATTRIBUTES.style IS "VERTICAL")>
  <CFSET style = ATTRIBUTES.style>
 </CFIF>
</CFIF>

<!--- Build complete font string --->
<CFSET font = "">
<CFIF fontcolor IS NOT "">
 <CFSET font = font & " COLOR=" & fontcolor>
</CFIF>
<CFIF fontface IS NOT "">
 <CFSET font = font & " FACE=" & fontface>
</CFIF>
<CFIF fontsize IS NOT "">
 <CFSET font = font & " SIZE=" & fontsize>
</CFIF>

<!--- Delimeters to use between fields and rows --->
<CFSET delim1 = #IIf(style IS "VERTICAL", DE("</TD><TD>"), DE("<BR>"))#>
<CFSET delim2 = #IIf(style IS "VERTICAL", DE("</TR><TR VALIGN=TOP>"), DE(""))#>

<SCRIPT LANGUAGE="LiveScript">
<!-- Beginning of JavaScript code

    function checkNumber(input, min, max, msg) {
        msg = msg + " field has invalid data: " + input.value;
        var str = input.value;
        for (var i = 0; i < str.length; i++) {
            var ch = str.substring(i, i + 1)
            if ((ch < "0" || "9" < ch) && ch != '.') {
                alert(msg);
                return false;
            }
        }
        var num = 0 + str
        if (num < min || max < num) {
            alert(msg + " not in range [" + min + ".." + max + "]");
            return false;
        }
        input.value = str;
        return true;
    }

    function computeField(input) {
        if (input.value != null && input.value.length != 0)
            input.value = "" + eval(input.value);
        computeForm(input.form);
    }

    function computeForm(form) {
        if (form.downpayment.value == null || form.downpayment.value.length == 0)
            form.downpayment.value = 0;
        if ((form.payments.value == null || form.payments.value.length == 0) ||
            (form.interest.value == null || form.interest.value.length == 0) ||
            (form.principal.value == null || form.principal.value.length == 0)) {
            return;
        }

        if (!checkNumber(form.payments, 1, 480, "# of payments") ||
            !checkNumber(form.interest, .001, 99, "Interest") ||
            !checkNumber(form.principal, 100, 10000000, "Principal") ||
            !checkNumber(form.downpayment, 0, form.principal.value, "Down payment")) {
            form.payment.value = "Invalid";
            return;
        }

        var i = form.interest.value;
        
        if (i > 1.0) {
            i = i / 100.0;
            form.interest.value = i;
        }
        i /= 12;

        var pow = 1;
        for (var j = 0; j < form.payments.value; j++)
            pow = pow * (1 + i);
        form.payment.value = ((form.principal.value - form.downpayment.value) * pow * i) / (pow - 1)
    }

    function clearForm(form) {
        form.payments.value = "";
        form.interest.value = "";
        form.principal.value = "";
        form.downpayment.value = "";
    }

// -- End of JavaScript code -------------- -->
</SCRIPT>

<CFOUTPUT>

<FORM METHOD="POST" NAME="LoanCalc">

<TABLE BORDER="#border#"
 <CFIF bgcolor IS NOT "">BGCOLOR="#bgcolor#"</CFIF>
 <CFIF bordercolor IS NOT "">BORDERCOLOR="#bordercolor#"</CFIF>
>
 <TR VALIGN=TOP>
  <TD>
   <FONT #font#><B>#prompt1#</B></FONT>
   #delim1#
   <INPUT TYPE=TEXT NAME=principal SIZE=9 VALUE="#principal#" onChange=computeField(this)>
  </TD>
 #delim2#
  <TD>
   <FONT #font#><B>#prompt2#</B></FONT>
   #delim1#
   <INPUT TYPE=TEXT NAME=downpayment SIZE=9 VALUE="#downpayment#" onChange=computeField(this)>
  </TD>
 #delim2#
  <TD>
   <FONT #font#><B>#prompt3#</B></FONT>
   #delim1#
   <INPUT TYPE=TEXT NAME=payments SIZE=5 VALUE="#payments#" onChange=computeField(this)>
  </TD>
 #delim2#
  <TD>
   <FONT #font#><B>#prompt4#</B></FONT>
   #delim1#
   <INPUT TYPE=TEXT NAME=interest SIZE=6 VALUE="#interest#" onChange=computeField(this)>
  </TD>
 #delim2#
  <TD>
   <FONT #font#><B>#prompt5#</B></FONT>
   #delim1#
   <INPUT TYPE=TEXT NAME=payment SIZE=9 onChange=computeField(this)>
  </TD>
 </TR>
 <TR>
  <TH COLSPAN=#IIf(style IS "VERTICAL", 2, 6)#>
   <INPUT TYPE="button" VALUE="#prompt6#" onClick=computeForm(this.form)>
   <INPUT TYPE="reset"  VALUE="#prompt7#" onClick=clearForm(this.form)>
  </TH>
 </TR>
</TABLE>

</FORM>

</CFOUTPUT>

<SCRIPT LANGUAGE="JavaScript">
<!-- 
document.LoanCalc.principal.focus();
// -->
</SCRIPT>

