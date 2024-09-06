<%-- 
    Document   : publishedrpts
    Created on : 4 Jul, 2021, 7:32:52 PM
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
        <h1 align =center> PUBLISHED BOOKINGS </h1> <hr>
        <%
          ResultSet rs1 = null;
          Connection con = null;
          Statement st = null;
          try
                  {
             Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

              st = con.createStatement();
              rs1 = st.executeQuery("select * from CAABOOKINGS where bkgstatus='PUBLISHED'");
              %> 
              
              <table border=2>
                  <tr>
                      <th>Booking ID</th> <th>CUSTOMER ID</th> <th>DATE OF BOOKING</th> <th>DATE OF PUBLISHING</th>
                  </tr>
                  <% 
                  while(rs1.next())
                      { 
                         String str =  rs1.getString("bkgid");
                  %>
                  <tr> <td> <%= str %> </td> 
                  <td> <%= rs1.getString("bkgcustid") %> </td> 
                  <td> <%= rs1.getString("bkgdob") %> </td> 
                  <td> <%= rs1.getString("bkgdop") %> </td> 
                  </tr>
                 <% } %>
                 
             </table>
             <% 
          } catch (Exception e) {%> <p> <%= e %> </p> <% } %>
             
</center> 
    
    </body>
</html>

