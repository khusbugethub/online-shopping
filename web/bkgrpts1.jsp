<%-- 
    Document   : bkgrpts1
    Created on : 4 Jul, 2021, 7:24:53 PM
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
        <%
          ResultSet rs1 = null;
          Connection con = null;
          Statement st = null;
          try
                  {
            Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

              st = con.createStatement();
              st.executeUpdate("update CAABOOKINGS set bkgstatus='PUBLISHED'");
          } catch (Exception e) {%> <p> <%= e%> </p> <% }
          response.sendRedirect("homeinfo.html");
                   %>
             
</body>
</html>
