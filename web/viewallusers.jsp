<%-- 
    Document   : viewallusers
    Created on : 4 Jul, 2021, 7:38:56 PM
    Author     : Admin
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employees' Details</title>
    </head>
    <body bgcolor="AABBCC">  
    <center>
        <h1 align =center> List of Employees </h1> <hr>
        <%
          ResultSet rs1 = null;
          Connection con = null;
          Statement st = null;
          try
                  {
             Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

              st = con.createStatement();
              rs1 = st.executeQuery("select * from USERVIEW1");
              %> 
              
              <table border=2>
                  <tr>
                      <th>ID</th> <th>NAME</th><th>ADDRESS</th><th>PHONE</th><th>PASSWORD</th>
                  </tr>
                  <% 
                  while(rs1.next())
                      { 
                  %>
                  <tr> 
                  <td> <%= rs1.getString(1) %> </td> 
                  <td> <%= rs1.getString(2) %> </td> 
                  <td> <%= rs1.getString(3) %> </td> 
                  <td> <%= rs1.getLong(4) %> </td> 
                  <td> <%= rs1.getString(5) %> </td> 
               
                 
                  </tr>
                  <% } %> 
             </table>
             <% 
          } catch (Exception e) {%> <p> <%= e %> </p> <% } %>
             
</center>  </body>
</html>
