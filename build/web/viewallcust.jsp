<%-- 
    Document   : viewallcust
    Created on : 4 Jul, 2021, 7:37:31 PM
    Author     : Admin
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Details</title>
    </head>
    <body background="img24.jpg">  
    <center>
        <h1 align =center> List of Customers </h1> <hr>
        <%
          ResultSet rs1 = null;
          Connection con = null;
          Statement st = null;
          try
                  {
              Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

              st = con.createStatement();
              rs1 = st.executeQuery("select * from CAACUSTOMERS");
              %> 
              
              <table border=2>
                  <tr>
                      <th>CLIENT ID</th> <th>CLIENT NAME</th> <th>CONTACT PERSON</th> <th>PHONE NO.</th><th>ADDRESS</th><th>EMAIL</th><th>FAX</th>
                  </tr>
                  <% 
                  while(rs1.next())
                      { 
                  %>
                  <tr> 
                  <td> <%= rs1.getString(1) %> </td> 
                  <td> <%= rs1.getString(2) %> </td> 
                  <td> <%= rs1.getString(3) %> </td> 
                  <td> <%= rs1.getString(4) %> </td> 
                  <td> <%= rs1.getString(5) %> </td> 
                  <td> <%= rs1.getString(7) %> </td> 
                  <td> <%= rs1.getString(8) %> </td>                   
                  </tr>
                  <% } %> 
             </table>
             <% 
          } catch (Exception e) {%> <p> <%= e %> </p> <% } %>
             
</center>  </body>
</html>
