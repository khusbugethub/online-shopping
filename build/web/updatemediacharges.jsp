<%-- 
    Document   : updatemediacharges
    Created on : 4 Jul, 2021, 7:36:41 PM
    Author     : Admin
--%>

<%@ page import="java.sql.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODIFY CHARGES</title>
    </head>
    <body bgcolor="aabbcc"> <center> 
        <h2>CHARGES-REVISION</h2> <hr>
         <% 
            
         String mtype = request.getParameter("medname");
         String mlang = request.getParameter("medlang");
         ResultSet rs1 = null;
         Connection con = null;
         Statement st = null;
         try
         {
           Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

            st = con.createStatement();
            if(mtype.equals("TV"))
                {
                    rs1 = st.executeQuery("select * from caatvcharge where langname='" + mlang + "'");
                    %>
                    <form name="tvcu" action="http://localhost:8084/candy/TVChargesUpdateServ" method="get"> 
                    <table border="1"> 
                    <% 
                    while(rs1.next())
                    {
                    %> 
                        <tr><td>MEDIA</td><td><input type="text" name="medname1" value="TV" disabled> </td></tr>
                        <tr><td>LANGUAGE</td><td><input type="text" name="medlang1" value="<%= rs1.getString("langname") %>" disabled></td></tr>
                        <input type="hidden" name="medlang11" value="<%= mlang %>">
                        <tr><td colspan="2" align="center">EDIT CHARGES: Rs.</td></tr>
                        <tr><td>TEXTSCROLL</td><td><input type="text" name="ratescr" value="<%= rs1.getInt("ratescroll") %>"></td></tr>
                        <tr><td>ANIMATION</td><td><input type="text" name="rateani" value="<%= rs1.getInt("rateanim") %>"></td></tr>
                        <tr><td>VIDEO</td><td><input type="text" name="ratevid" value="<%= rs1.getInt("ratevideo")%>"></td></tr>
                        <tr><td colspan="2" align="center"><input type="submit" name="f1sub" value="Update Charges"></td>
                        <% 
                        }%>
                    </table>
                </form>
                <% }
                else
                {
                    rs1 = st.executeQuery("select * from caanpcharge where langname='" + mlang + "'");
                %>
                <form name="npcu" action="http://localhost:8084/candy/NPChargesUpdateServ" method="post">
                    <table border="1">
                        <% 
                        while(rs1.next())
                        {
                            %>
                        <tr><td>MEDIA</td><td><input type="text" name="medname2" value="NEWSPAPER" disabled> </td></tr>
                        <tr><td>LANGUAGE</td><td><input type="text" name="medlang2" value="<%= rs1.getString("langname") %>" disabled></td></tr>
                        <input type="hidden" name="medlang21" value="<%= mlang %>">
                        <tr><td colspan="2" align="center">EDIT CHARGES: Rs.</td></tr>
                        <tr><td>RATE PER SQCM</td><td><input type="text" name="ratesqcm" value="<%= rs1.getInt("ratepsqcm") %>"></td></tr>
                        <tr><td colspan="2" align="center">Extra charges %</td></tr>
                        <tr><td>FRONT PAGE</td><td><input type="text" name="ratep1" value="<%= rs1.getInt("page1per") %>"></td></tr>
                        <tr><td>THIRD PAGE</td><td><input type="text" name="ratep3" value="<%= rs1.getInt("page3")%>"></td></tr>
                        <tr><td>MIDDLE PAGE</td><td><input type="text" name="ratepmid" value="<%= rs1.getInt("pagemid") %>"></td></tr>
                        <tr><td>LAST PAGE</td><td><input type="text" name="rateplast" value="<%= rs1.getInt("pagelast")%>"></td></tr>
                        <tr><td colspan="2" align="center"><input type="submit" name="f2sub" value="Update Charges"></td>
                        <%
                        }
                        %>
                    </table>    
                    </form>
                <% }
         } catch(Exception e){} %>
        </center>        
    </body>
</html>
