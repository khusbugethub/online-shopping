<%-- 
    Document   : bkgrpts
    Created on : 4 Jul, 2021, 7:23:19 PM
    Author     : Admin
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Details</title>
    </head>
    <body bgcolor="AABBCC">  
    <center>
        <h1 align =center> BOOKING DETAILS - Ready for Publishing </h1> <hr>
        <%
          ResultSet rs1 = null;
          Connection con = null;
          Statement st = null;
          boolean f = false;
          String str1 = request.getParameter("bkid");
          try
                  {
              Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

              st = con.createStatement();
              if(str1 != "")
                  {
                    st.executeUpdate("update CAABOOKINGS set bkgstatus='PUBLISHED' where bkgid = '" + str1 + "'");
                    st.executeUpdate("commit");
                   }
              
              rs1 = st.executeQuery("select * from CAABOOKINGS where bkgstatus='PENDING'");
              %> 
              
              <table border=2>
                  <tr>
                      <th>Booking ID</th> <th>CUSTOMER ID</th> <th>DATE OF BOOKING</th> <th>DATE OF PUBLISHING</th><th>PUBLISH</th>
                  </tr>
                  <% 
                  while(rs1.next())
                      { 
                        f = true;
                        String str =  rs1.getString("bkgid");
                  %>
                  <form name = "readytopub" action="bkgrpts.jsp" method="get"> 
                  <tr> <td> <%= str %> </td> 
                  <td> <%= rs1.getString("bkgcustid") %> </td> 
                  <td> <%= rs1.getString("bkgdob") %> </td> 
                  <td> <%= rs1.getString("bkgdop") %> </td> 
                  <input type="hidden" name = "bkid" value = "<%= str %>"> 
                  <td><input type="submit" name="publid" value="Send to Media"></td>
                  </tr>
              </form> 
                 <% } %>
                 
             </table>
             <% 
                 if(!f)
                 {%> <h3>No new bookings </h3> <% }else { %> 
             <form name = "readytopuball" action = "bkgrpts1.jsp" method="get"> 
             <input type="submit" name="publid1" value="Publish All">
             </form>
             <% }
          } catch (Exception e) {%> <p> <%= e %> </p> <% } %>
             
</center>  </body>
</html>
