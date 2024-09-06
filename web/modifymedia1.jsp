<%-- 
    Document   : modifymedia1
    Created on : 4 Jul, 2021, 7:28:48 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODIFY CHARGES</title>
        <style type="text/css">
       *
        {
            font-size: 24px;
            
        }
    </style>
    </head>
    <body bgcolor="aabbcc">
        <center> 
        <h2>CHARGES-REVISION</h2> <hr> 
        <form name="modmed" action="updatemediacharges.jsp" method="get"> 
        <table>
            <tr> <td>Select Media</td>
            <td><select name="medname">
                    <option value="TV">TV</option>
                    <option value="NEWSPAPER">NEWSPAPER</option>
            </select></td>
        </tr>
        <tr> <td>Select Language</td> 
            <td>
                <select name="medlang">
                    <option value="ENGLISH">ENGLISH</option>
                    <option value="HINDI">HINDI</option>
                    <option value="REGIONAL">REGIONAL</option>
                </select>
            </td>
        </tr>
        
        <tr>
            <td colspan="2" align="center"><input type="submit" name="sub1" value="Get Details"> </td> 
        </tr>
    
        </table>
        </form>
    </center>
    </body>
</html>
