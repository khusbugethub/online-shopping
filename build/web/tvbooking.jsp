<%-- 
    Document   : tvbooking
    Created on : 4 Jul, 2021, 7:33:39 PM
    Author     : Admin
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TV Booking</title>
    </head>
    <body background="pictures/falls1.jpg">
        <h1 align="center"> BOOKING DETAILS - TV ADS </h1> <hr>
            
        <% 
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        ResultSet rs3 = null;
        
        Connection con = null;
        Statement st = null;
        Date dt = new Date();
        int dd = dt.getDate();
        int mm = dt.getMonth(); 
        int yy = dt.getYear();
        String d = dd + "-" + (mm + 1) + "-" + (yy + 1900);
        String bid=null;
              try
                {
                   Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

                    st = con.createStatement();
                    rs1 = st.executeQuery("select distinct medlang from caameddetails");
                    %>
                   <form name="chanlang" action="tvbooking.jsp" method="get">
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
                        public String genBkgId()
                                {
                                    ResultSet rs3 = null;
                                    Connection con = null;
                                    String bkgid="";
                                    try
                                            {
                                               Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

                                                Statement st = con.createStatement();
                                                rs3 = st.executeQuery("select caabkgidseq.nextval from dual");
                                                while(rs3.next())
                                                    {
                                                        bkgid = "CAABKG" + rs3.getString(1);
                                                }
                                    }catch(Exception e){}
                                    return(bkgid);
                        }
                        %>
                    <%
                    try
                    {
                    String lang = request.getParameter("mlang");
                    bid = genBkgId();
                    
                    rs2 = st.executeQuery("select * from caameddetails where medlang='" + lang + "' and medid ='CAAMED1001'");
                    %>
                   
            <table border=2>
                <tr>
                    
                    <th rowspan="2">Media Name</th>
                    <th colspan="3">Content Type</th> 
                    <th rowspan="2">Duration in minutes</th>
                    <th rowspan="2">Content</th>
                    <th rowspan="2">Select Time</th>
                    <th rowspan="2">Date of Booking</th>
                    <th rowspan="2">Date of Publishing</th>
                    <th></th> <th></th> <th>Book</th>
                </tr>
                <tr> <th> Scrolling </th> <th>Animation</th> <th>Video</th></tr>
                <% while(rs2.next())
                    {%>
                    <form name ="tvbook" action="tvbookingprocess.jsp" method="get"> 
                    <tr>
                    
                    <td> <%= rs2.getString("medadvname") %> </td>
                    
                    <td> <input type =checkbox name="ctypescroll" value="Scroll" align="center"> </td>
                    <td><input type=checkbox name="ctypeanim" value="Animation" align="center"> </td>
                    <td><input type=checkbox name="ctypevideo" value="Video" align="center"></td>
                <td> <input type=text name="dur" value="" size="10"> </td>
                <td><textarea rows="5" cols="20" name="msg"> </textarea></td>
                <td>    <select name="mtime">
            <option selected>Select Time </option>
            <option>Prime</option>
            <option>Non-Prime</option>
        </select></td>
        <td><%= d %> </td>
        <td><input type="text" name="dop" value=""> </td>
        <td><input type="hidden" name = "mid" value="<%= rs2.getString("medadvid") %>"> </td>
                        <td> <input type="hidden" name="bd" value="<%= bid%>"> </td> 
                        <td> <input type="hidden" name = "dat" value= "<%= d%>"></td>
 <td> <input type=submit name=addlist value="Add to List">
            </tr>
        </form>
                    <% } %>
        </table>
        <% } catch(Exception e)
        {
        %> <h1><%= e %></h1><%
        } %>
    </body>
</html>
