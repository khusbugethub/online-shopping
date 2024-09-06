<%-- 
    Document   : npbooking1
    Created on : 4 Jul, 2021, 7:29:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<jsp:useBean id="npb" class="caacomp.NPList" scope="session" /> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NEWSPAPER Booking</title>
        <style type="text/css">
        *
        {
            font-size: 18px;
        }
    </style>
    </head>
    <body bgcolor="AABBCC">
        <h1 align="center"> BOOKING DETAILS - NEWSPAPER ADS </h1> <br>
        <h4 align="right"><a href="clienthome1.jsp">Back to Client's Home Page</a></h4> <hr>
            <center> 
        <% 
            String id = request.getParameter("mid");
            if(id != null)
            {
                String mename = request.getParameter("mn");
                String page1 = request.getParameter("p1");
                String page3 = request.getParameter("p3");
                String pagem = request.getParameter("pmid");
                String pagel = request.getParameter("plast");
                String pageo = request.getParameter("opage");
                int siz = Integer.parseInt(request.getParameter("size"));
                String lan = request.getParameter("mlang");
                npb.addItem(id, mename,page1,page3,pagem,pagel,pageo,siz,lan);
            }
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        ResultSet rs3 = null;
        Connection con = null;
        Statement st = null;
        String bid=null;
              try
                {
                    Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

                    st = con.createStatement();
                    rs1 = st.executeQuery("select distinct medlang from caameddetails");
                    %>
                   <form name="nplang" action="npbooking1.jsp" method="get">
                     <select name=mlang>
                        <option selected>select channel language </option>
                        <% while(rs1.next())
                            { %>
                            <option> <%= rs1.getString("medlang")%> </option>
                            <% } %>
                    </select>
                    <% } catch(Exception e){} %> 
                    
                    <input type=submit name="newsplang" value= "List Papers">
                        
                    </form>
                    <%! 
                        %>
                    <%
                    try
                    {
                    String lang = request.getParameter("mlang");
                    rs2 = st.executeQuery("select * from caameddetails where medlang='" + lang + "' and medid ='CAAMEDID1002'");
                    %>
                    <b>    Language: <%= lang%>  </b> 
            <table border=2>
                <tr>
                    
                    <th rowspan="2">Media Name</th>
                    <th colspan="5">Page</th> 
                    <th rowspan="2">Size in sqcm</th>
                    <th rowspan="2">Book</th>
                </tr>
                <tr> <th>FIRST</th> <th>THIRD</th> <th>MIDDLE</th><th>LAST</th><th>OTHER</th></tr>
                <% while(rs2.next())
                    {%>
                    <form name ="npbook" action="npbooking1.jsp" method="get"> 
                    <tr>
                      <%   String mname = rs2.getString("medadvname"); %>
                    <td> <%= mname %> </td>
                    <td> <input type =checkbox name="p1" value="page1" align="center"> </td>
                    <td><input type=checkbox name="p3" value="page3" align="center"> </td>
                    <td><input type=checkbox name="pmid" value="midpage" align="center"></td>
                    <td><input type=checkbox name="plast" value="lastpage" align="center"></td>
                    <td><input type=checkbox name="opage" value="otherpage" align="center"></td>
                    <td> <input type=text name="size" value=""> </td>
                    <input type="hidden" name = "mid" value="<%= rs2.getString("medadvid") %>">
                    <input type="hidden" name="mn" value="<%= mname %>"> 
                    <input type="hidden" name="mlang" value="<%= lang %>"> 
                    <td> <input type=submit name=addlist value="Add to List"> </td>
                    </tr>
                    </form>
                    <% } %>
        </table>
        <% } catch(Exception e)
        {
        %><h1>
            <%= e %>
        </h1><%
        } %>
        <h4 align="center"> <a href = "npbookingsummary.jsp">Summary of Booking</a> </h4>
    </center>
    </body>
</html>
