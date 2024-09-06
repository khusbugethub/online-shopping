<%-- 
    Document   : npbookingprocess1
    Created on : 4 Jul, 2021, 7:30:37 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="npb" class="caacomp.NPList" scope="session" />
<jsp:useBean id="cid" class="caacomp.CustIDBean" scope="session" />

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NEWSPAPER-AD Booking Confirmation</title>
    </head>
    <body>
        <% 
         ResultSet rs1 = null;
         Connection con = null;
         Statement st = null;
         int id =0;
         int size = 0;
         String bkgid="";
         String custid = cid.getID();
         String dob = request.getParameter("dobkg");
         String dop = request.getParameter("dop");
         String adcontent = request.getParameter("msg");
         float amt = Float.parseFloat(request.getParameter("bkgamt"));
                 try
                 {
                   Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

                    st = con.createStatement();
                    rs1 = st.executeQuery("select caabkgidseq.nextval from dual");
                    try
                    {
                        while(rs1.next())
                        {
                            id = rs1.getInt(1);
                            
                        }
                           
                    }catch(Exception e){}
                    bkgid = "CAABKG" + id;
                    st.executeUpdate("insert into caabookings values('" + bkgid + "','" + custid + "','" + dob + "','" + dop + "'," + amt + ",'PENDING','" + adcontent + "')");
                    Enumeration e = npb.getEnumeration();
                    String[] tmpItem;
                    while(e.hasMoreElements())
                    {
                        String pages = "";
                        tmpItem = (String[])e.nextElement();
                        String s1 = tmpItem[2];
                        String s2 = tmpItem[3];
                        String s3 = tmpItem[4];
                        String s4 = tmpItem[5];
                        String s5 = tmpItem[6];
                        size = Integer.parseInt(tmpItem[7]);
                        if(s1 != null)
                            pages = "1,";
                        if(s2 != null)
                            pages += "3,";
                        if(s3 != null)
                            pages += "mid,";
                        if(s4 != null)
                            pages += "last,";
                        if(s5 != null)
                            pages += "other";
                        if(s1 != null)
                            st.executeUpdate("insert into caanewspaper values('" + tmpItem[0] + "','" + bkgid + "'," + size + ",'" + pages + "')");

                    }
                    
                    }
                    catch (Exception e) {%> <p>  <%= e %> </p><%}
                    Enumeration e = npb.getEnumeration();
                    String[] tmpItem;
                    while(e.hasMoreElements())
                        {
                            tmpItem = (String[])e.nextElement();
                            npb.removeItem(tmpItem[0]);
                    }
                 response.sendRedirect("clienthome1.jsp");
         %>
    </body>
</html>