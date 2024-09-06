<%-- 
    Document   : mediamodify
    Created on : 4 Jul, 2021, 7:27:13 PM
    Author     : Pachayappan
--%>

<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="AABBCC">
        <center> 
         <%
         String mid = request.getParameter("medtype") ;
         ResultSet rs = null;
         Connection con = null;
         boolean f = false;
         Statement st = null;
         try
                 {
                  Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

                    st = con.createStatement();
                    rs = st.executeQuery("select * from caameddetails where medadvid='" + mid +"'");
         %> <h1> MODIFY MEDIA DETAILS </h1> 
         <form name="medmodform" action="mediaupdate.jsp" method="get">
         <table border="2"> 
         <% 
                    while(rs.next())
                        { f = true;
                    %> <tr> <td>Media Name </td> <td><input type=text name="mname" value = "<%= rs.getString("medadvname")%>" disabled> </td> </tr>
                    <tr> <td>Contact Person </td> <td><input type=text name="cper" value = "<%= rs.getString("medcontpername")%>"></td> </tr>
                    <tr> <td>Contact Number </td> <td><input type=text name="phno" value = "<%= rs.getString("medcontnum")%>"></td> </tr>
                    <tr> <td>Address </td> <td><input type=text name="addr" value = "<%= rs.getString("medaddr")%>"></td> </tr>
                    <tr> <td>Email </td> <td><input type=text name="email" value = "<%= rs.getString("medemail")%>"> </td> </tr>
                    <tr> <td>Fax </td> <td><input type=text name="fax" value = "<%= rs.getString("medfax")%>"> </td> </tr>
                    <tr> <td colspan="2"><input type = "submit" name="sub1" value="Update"> </td>
                    <td> <input type="hidden" name = "id" value = "<%= rs.getString("medadvid") %>"> </td></tr>
                   
                   <% } %>
             </table>
         </form>
         <% } catch(Exception e){} 
         if(!f)
             {
         %> <h3> Invalid ID </h3> <% } %> 
     </center>
</body>
</html>