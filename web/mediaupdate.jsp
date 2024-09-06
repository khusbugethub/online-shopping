<%-- 
    Document   : mediaupdate
    Created on : 4 Jul, 2021, 7:28:00 PM
    Author     : Admin
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
    <body>
        <% 
        Connection con = null;
        Statement st = null;
        String mid = request.getParameter("id").trim();
        String cpername = request.getParameter("cper").trim();
        String phonenum = request.getParameter("phno").trim();
        String address = request.getParameter("addr").trim();
        String mail = request.getParameter("email").trim();
        long faxnum = Long.parseLong(request.getParameter("fax").trim());
        try
                {
               Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

                st = con.createStatement();
                st.executeUpdate("update caameddetails set medcontpername='" + cpername + "', medcontnum=" + phonenum + ", medaddr='" + address + "', medemail='" + mail + "', medfax=" + faxnum + " where medadvid = '" + mid + "'");
                } catch(Exception e){}
                response.sendRedirect("modifymedia.html");
         %>
    </body>
</html>