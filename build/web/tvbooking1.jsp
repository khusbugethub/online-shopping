<%-- 
    Document   : tvbooking1
    Created on : 4 Jul, 2021, 7:34:24 PM
    Author     : Admin
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="tvb" class="caacomp.TVList" scope="session" /> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TV Booking</title>
        <style type="text/css">
        *
        {
            font-size: 18px;
        }
    </style>
    </head>
    <body bgcolor="AABBCC">
        <h1 align="center"> BOOKING DETAILS - TV ADS </h1> <br>
        <h4 align="right"><a href="clienthome1.jsp">Back to Client's Home Page</a></h4> <hr>
            <center> 
        <% 
            String id = request.getParameter("mid");
            if(id != null)
            {
                String mename = request.getParameter("mn");
                String scr = request.getParameter("ctypescroll");
                String ani = request.getParameter("ctypeanim");
                String vid = request.getParameter("ctypevideo");
                int dur = Integer.parseInt(request.getParameter("dur"));
                String time = request.getParameter("mtime");
                String lan = request.getParameter("mlang");
                tvb.addItem(id, mename,scr, ani, vid, dur, time,lan);
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
                   <form name="chanlang" action="tvbooking1.jsp" method="get">
                     <select name=mlang>
                        <option selected>select channel language </option>
                        <% while(rs1.next())
                            { %>
                            <option> <%= rs1.getString("medlang")%> </option>
                            <% } %>
                    </select>
                    <% } catch(Exception e){} %> 
                    
                    <input type=submit name="chlang" value= "List channels">
                        
                    </form>
                    <%! 
                        %>
                    <%
                    try
                    {
                    String lang = request.getParameter("mlang");
                    rs2 = st.executeQuery("select * from caameddetails where medlang='" + lang + "' and medid ='CAAMEDID1001'");
                    %>
                    <b>    Language: <%= lang%>  </b> 
            <table border=2>
                <tr>
                    
                    <th rowspan="2">Media Name</th>
                    <th colspan="3">Content Type</th> 
                    <th rowspan="2">Duration in minutes</th>
                    <th rowspan="2">Select Time</th>
                    <th rowspan="2">Book</th>
                </tr>
                <tr> <th> Scrolling </th> <th>Animation</th> <th>Video</th></tr>
                <% while(rs2.next())
                    {%>
                    <form name ="tvbook" action="tvbooking1.jsp" method="get"> 
                    <tr>
                      <%   String mname = rs2.getString("medadvname"); %>
                    <td> <%= mname %> </td>
                    <td> <input type =checkbox name="ctypescroll" value="Scroll" align="center"> </td>
                    <td><input type=checkbox name="ctypeanim" value="Animation" align="center"> </td>
                    <td><input type=checkbox name="ctypevideo" value="Video" align="center"></td>
                    <td> <input type=text name="dur" value=""> </td>
                    <td><select name="mtime">
                        <option selected>Prime</option>
                        <option>Non-Prime</option>
                    </select></td>
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
        %> <h1><%= e %></h1><%
        } %>
        <h4 align="center"> <a href = "booksummary.jsp">Summary of Booking</a> </h4>
    </center>
    </body>
</html>
