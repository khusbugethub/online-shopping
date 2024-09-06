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
import caacomp.Media;

/**
 *
 * @author Pachayappan
 */
public class AddMedServ extends HttpServlet {

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
            out.println("<title>Servlet AddMedServ</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddMedServ at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        //processRequest(request, response);
         PrintWriter out = response.getWriter();
          String mid="";
         String s1=request.getParameter("D1").trim();
         if(s1.equals("TV"))
               mid="CAAMEDID1001";
         else
               mid="CAAMEDID1002";
         String s2=request.getParameter("T1").trim();
         String s3=request.getParameter("T2").trim();
         String s4=request.getParameter("T3").trim();
         long s5=Long.parseLong(request.getParameter("T4").trim());
         String s6=request.getParameter("T5").trim();
         String s7=request.getParameter("T6").trim();
         long s8=Long.parseLong(request.getParameter("T7").trim());
         Media m=new Media();
         int u=m.addMedia(mid, s2, s3,s4,s5,s6,s7,s8);
         if(u==0)
         {
             response.sendRedirect("addmedia.html");
         }
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
