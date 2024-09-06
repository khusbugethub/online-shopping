<%-- 
    Document   : viewmediadetails
    Created on : 4 Jul, 2021, 7:39:58 PM
    Author     : Admin
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Media Details</title>
        <style type="text/css">
        *
        {
            font-size: 20px;
        }
    </style>
    </head>
    <body background="D:\6semprj\WebApplication8\web\pictures\falls1.jpg">  
    <center>
        <h1 align =center> MEDIA DETAILS </h1> <hr>
        <%
          ResultSet rs1 = null;
          ResultSet rs2 = null;
          Connection con = null;
          Statement st = null;
          try
                  {
             Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

              st = con.createStatement();
              rs1 = st.executeQuery("select * from caatvcharge");
              %> 
              <h2> TV INFO </h2>
              <p>Charges per minute: (25percent EXTRA DURING PRIME TIME) </p>
              <table border=2>
                  <tr>
                      <th>LANGUAGE</th> <th>SCROLLING TEXT</th> <th>ANIMATION</th> <th>VIDEO CLIPPING</th>
                  </tr>
                  <% 
                  while(rs1.next())
                      {
                  %> <tr> <td> <%= rs1.getString("langname") %> </td> 
                  <td> <%= rs1.getString("ratescroll") %> </td> 
                  <td> <%= rs1.getString("rateanim") %> </td> 
                  <td> <%= rs1.getString("ratevideo") %> </td> </tr>
                 <% } %>
                 
             </table>
             <% } catch (Exception e) {%> <p> <%= e%> </p> <% } %>
             
              <h2> NEWSPAPER INFO </h2>
              <p>Charges per sq cm(Pagewise extra charges in %)</p>
              <% 
              try{ %>
              <table border=2>
                  <tr>
                      <th>LANGUAGE</th> <th>CHARGES PER SQCM.</th> <th>FIRST PAGE</th> <th>THIRD PAGE</th> <th>MIDDLE PAGE </th> <th>LAST PAGE</th>
                  </tr>
                  <% 
                     rs2 = st.executeQuery("select * from caanpcharge");
                  while(rs2.next())
                      {
                  %> <tr> <td> <%= rs2.getString("langname") %> </td>
                  <td> <%= rs2.getString("ratepsqcm") %> </td> 
                  <td> <%= rs2.getString("page1per") %> </td> 
                  <td> <%= rs2.getString("page3") %> </td>
              <td> <%= rs2.getString("pagemid") %> </td> 
          <td> <%= rs2.getString("pagelast") %> </td> </tr>
                 <% } %>
                 
             </table>
        <%  } catch(Exception e){%> <p> <%= e%> </p> <% } %>
<a href="clienthome1.jsp"> Back </a>
</center>  </body>
</html>
