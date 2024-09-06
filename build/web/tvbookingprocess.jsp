<%-- 
    Document   : tvbookingprocess
    Created on : 4 Jul, 2021, 7:35:11 PM
    Author     : Admin
--%>

<%@page import="java.sql.*" %>
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
         ResultSet rs1 = null;
         ResultSet rs2 = null;
         Connection con = null;
         Statement st = null;
         String medid = request.getParameter("mid");
         String bkgid = request.getParameter("bd");
         String cscroll = request.getParameter("ctypescroll");
         String canim = request.getParameter("ctypeanim");
         String cvideo = request.getParameter("ctypevideo");
         String dur1 = request.getParameter("dur");
         String msg = request.getParameter("msg");
         String time = request.getParameter("mtime");
         String dob = request.getParameter("dat");
         String dop = request.getParameter("dop");
         int min = Integer.parseInt(dur1);
         long amt=0;
         if(cscroll==null)
           {  amt+=0; }
         else
          {   amt += 10000 * min; }
         if(canim==null)
          {   amt += 0; }
         else
         {    amt += 20000 * min;  }
         if(cvideo==null)
          {   amt += 0;  }
         else
           {  amt += 30000 * min;  }
        
         try
                 {
                    Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

                    st = con.createStatement();
                    st.executeUpdate("insert into caabookings values('" + bkgid + "','CAACUST10045','22-NOV-2008','" + dop + "',0," + amt + ",'PENDING')");
                    if(cscroll != null)
                        st.executeUpdate("insert into caatv values('" + medid + "','" + bkgid + "'," + min + ",'scroll','business','" + time + "')");
                     if(canim != null)
                        st.executeUpdate("insert into caatv values('" + medid + "','" + bkgid + "'," + min + ",'animation','business','" + time + "')");
                     if(cvideo != null)
                        st.executeUpdate("insert into caatv values('" + medid + "','" + bkgid + "'," + min + ",'video','business','" + time + "')");
                 }
                 catch (Exception e) {%> <p>  <%= e %> </p><%}
         //response.sendRedirect("tvbooking.jsp");
         %>
    </body>
</html>
