<%-- 
    Document   : booksummary
    Created on : 4 Jul, 2021, 7:25:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="tvb" scope="session" class="caacomp.TVList" />
<jsp:useBean id="cid" class="caacomp.CustIDBean" scope="session" /> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>TV Booking Contents </title>
<script language="javascript">
    function checkForEmpty()
{
    d = document.tvbkconfirm.dop.value;
    msg = document.tvbkconfirm.msg.value;
    cnum = document.tvbkconfirm.cardnum.value;
   
    if(d.length == 0 || msg.length == 0 || cnum.length == 0)
    {
        alert("Please fill all the fields");
        return false;
    }
    else 
        return true;
}

function validDate()
{
    //if field is empty display - warning and return false
    datefield = document.tvbkconfirm.dop.value;
         if(datefield=="")
         {
            alert("Field should not be empty");
            return false;
         }
    //declare valid variable with all valid characters: digits from 0 to 9 and backslash
         var valid = "0123456789/";
    //declare variable for counting number of slashes
         var slashcount = 0;
    //checking date length. If it not equals 10 - display warning and return false
         if (datefield.length != 10) 
         {
      //      alert("Invalid date! The correct date format is like '01/01/2004'. Please try again.")
        //    return false;
         }
    //check each character in the date field, one at a time
         for (var i=0; i < datefield.length; i++)
         {
         temp = "" + datefield.substring(i, i+1);
         //if character is backslash- count it
         if (temp == "/") 
         slashcount++;
         }
    //if character in temp does not exist in valid character string, display warning
         if (valid.indexOf(temp) == "-1") 
         {
         //alert("Invalid characters in your date. Please try again.")
         //return false;
         }
    //if number of slashes not equals 2 display warning
         if (slashcount != 2) 
         {
           // alert("Invalid Date! The correct date format is like '01/01/2004'. Please try again.")
            //return false;
         }
    //check position of slashes in date string. It should be 2 and 5
    // Because the first character position is 0 not one
         if((datefield.charAt(2)!= '/')||( datefield.charAt(5) != '/'))
         {
   // alert("Invalid date! The correct date format is like '01/01/2004'. Please try again.")
     //    return false
         }
    
    return true
}
    
function checkCardNum()
{
        var retval = true;
        var i;
        var cno = document.tvbkconfirm.cardnum.value;
        cn = '0123456789';
        for(i=0; i< cno.length; i++)
            {
                if(cn.indexOf(cno.charAt(i),0) == -1)
                    {
                        alert("Invalid number");
                        document.tvbkconfirm.cardnum.value="";
                        return false;
                    }
            }
                    if (isNaN(parseInt(cno))) 
        {
        alert("The card number contains illegal characters.");
        document.tvbkconfirm.cardnum.value="";
        retval = false;
        }
        if(cno.length != 16)
            {
                alert("Illegal length");
                document.tvbkconfirm.cardnum.value="";
                retval = false;
            }
            return retval;
}

</script>

</head>
<body bgcolor="aabbcc">

    <h1 align = "center"><b>Summary of Booking - <%= cid.getID() %> </b></h1>
<a href="tvbooking1.jsp">Back to Channel Selection </a>    
    <hr> 
<center>     
<%!
        
        public boolean chkString(String str)
        {
            if(str != null)
               return true;
            else
                return false;
        }
%>
<%
    String itid = request.getParameter("iId");
        if(itid != null)
            {
                tvb.removeItem(itid);
        }

%>
<table width="350" border="2" cellspacing="1">
<tr>
<th>Channel Name</th>
<th>Content Type</th>
<th>Duration</th>
<th>Time</th>
<th>Remove</th>
</tr>
        
        <% 
         Date dt = new Date();
        int dd = dt.getDate();
        int mm = dt.getMonth(); 
        int yy = dt.getYear();
        String d = "";
        switch(mm)
        {
            case 0: d = dd + "-JAN-" + (yy + 1900); break;
            case 1: d = dd + "-FEB-" + (yy + 1900); break;
            case 2: d = dd + "-MAR-" + (yy + 1900); break;
            case 3: d = dd + "-APR-" + (yy + 1900); break;
            case 4: d = dd + "-MAY-" + (yy + 1900); break;
            case 5: d = dd + "-JUN-" + (yy + 1900); break;
            case 6: d = dd + "-JUL-" + (yy + 1900); break;
            case 7: d = dd + "-AUG-" + (yy + 1900); break;
            case 8: d = dd + "-SEP-" + (yy + 1900); break;
            case 9: d = dd + "-OCT-" + (yy + 1900); break;
            case 10: d = dd + "-NOV-" + (yy + 1900); break;
            case 11: d = dd + "-DEC-" + (yy + 1900); break;
        }
        Enumeration e = tvb.getEnumeration();
	String[] tmpItem;
	while(e.hasMoreElements())
	{
		tmpItem = (String[])e.nextElement();
                String s1 = tmpItem[2];
                String s2 = tmpItem[3];
                String s3 = tmpItem[4];
	%>
        <form name="remlist" action="booksummary.jsp" method="get"> 
	<tr>
	<td><%= tmpItem[1] %> </td>
	<td align = "center">
            <% 
            if(chkString(s1)){ 
            %> 
            <%= tmpItem[2] %> <% } else {}%>  
        <% if(chkString(s2)) {%>
            <%= tmpItem[3] %> <% } else {} %> 
        <% if(chkString(s3)){ %>
            <%= tmpItem[4] %> <% } else {} %> </td>
	<td align = "center"><%= tmpItem[5] %></td>
        <td align = "center"><%= tmpItem[6] %></td>
        <input type="hidden" name="iId" value="<%= tmpItem[0] %>"> 
        <td><input type="submit" name="remitem" value="Remove from List"></td>
	</tr>
    </form>
	<%
	}
	%>
</table>
<br>
<form name = "tvbkconfirm" action="tvbookingprocess1.jsp" method="get" onsubmit="return checkForEmpty()"> 
<table border=2>
    <tr><td>Date of Booking</td><td><%= d %></td></tr>    
    <tr><td>Enter Date of Publishing</td><td><input type ="text" name="dop" value="" onchange="return validDate()"></td></tr>
    <tr><td>Enter Message</td><td><textarea name="msg" rows="5" columns="10" value=""></textarea></td></tr>
    <tr><td colspan="2" align = "center"><b>Payment Details:</b></td></tr>
    <tr><td>Card:</td>
        <td><select name="nwop">
            <option selected>Master</option>
            <option>Visa</option>
            <option>American Express</option>
    </select></td>
    </tr>
    <tr><td>Enter Card Number</td><td><input type="text" name="cardnum" value="" onchange="return checkCardNum()"></td></tr>
    <% 
    double amt = tvb.getCost(); %> 
    <tr><td>Total Amount</td><td><input type="text" name="billamt" value="<%= amt %>" disabled></td></tr>
    <input type ="hidden" name = "dobkg" value = "<%= d %>">
    <input type="hidden" name = "bkgamt" value = "<%= amt %>"> 
    <tr><td colspan="2" align="center"><input type="submit" name="transconfirm" value="Confirm Booking"></td></tr>
</table>
</form> 
</center>
</body>
</html>