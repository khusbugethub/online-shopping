<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- 
    Document   : clienthome1
    Created on : 4 Jul, 2021, 7:26:22 PM
    Author     : Admin
--%>

<jsp:useBean id="cb" class="caacomp.CustIDBean" scope="session"/> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
        *
        {
            font-size: 18px;
        }
    </style>
  </head>
  <body bgcolor ="AABBCC">
      <h1 align ="center"> CUSTOMER'S MAIN PAGE <%= cb.getID() %> </h1> <hr>
          <CENTER>
      <form name="clhome" action="viewmediadetails.jsp" method="GET" target="_parent">
              <input type="submit" name="viewdetails" value="View Media Details">
          </form>
              <br>
<form name="clhome1" action="tvbooking1.jsp" method="GET" target="_parent">                  
              <input type="submit" name ="tvbooking" value="Television-Booking">
          </form>
              <br>
<form name="clhome2" action="npbooking1.jsp" method="GET" target="_parent">                  
              <input type="submit" name ="npbooking" value="NewsPaper-Booking">
          </form>
            
              <br>
<form name="clhome4" action="http://localhost:8084/candy/homepage.html" method="GET">
              <input type="submit" name="home1" value="Sign Out">
      </form>
              <img src="imgg27.png" width="300" height="300" />
      </CENTER>
  </body>
</html>
