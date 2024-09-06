/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import caacomp.Registration;
import java.sql.*;
/**
 *
 * @author Admin
 */
public class CustRegServ extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustRegServ</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustRegServ at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
                    response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String cname=request.getParameter("cname");
        String conperson=request.getParameter("conperson");
        String address=request.getParameter("address");
        long phonenumber=Long.parseLong(request.getParameter("phonenumber"));
        int pin=Integer.parseInt(request.getParameter("pin"));
        String email=request.getParameter("email");
        long fax=Long.parseLong(request.getParameter("fax"));
        
      String pwd = "";
      String cid="";
        Registration r = new Registration(cname,conperson,address,email,phonenumber,pin,fax);
         r.genPwd();
        r.writeCustDetails();
        cid=r.getUserID();
        pwd=r.getPwd();
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserAuthServ</title>"); 
            out.println("<style type=text/css>td{font-size: 14pt;} </style>");
            out.println("</head>");
            out.println("<body><center>");
            out.println("<h1>YOUR REGISTRATION IS CONFIRMED</h1>");
            out.println("<table><tr><td>YOUR ID :</td><td><h1>"+cid+"</h1></td></tr>");
            out.println("<tr><td>YOUR PASSWORD :</td><td><h1>"+pwd+"</h1></td></tr></table>");
            out.println("<p>PLEASE USE YOUR ID AND PASSWORD FOR FUTURE ACCESS</p>");
            out.println("</body>");
            out.println("</html>");

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
