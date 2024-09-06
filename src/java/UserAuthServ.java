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
import caacomp.CustIDBean;
import caacomp.UserAuthentication;
/**
 *
 * @author Pachayappan
 */
public class UserAuthServ extends HttpServlet {

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
            out.println("<title>Servlet UserAuthServ</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserAuthServ at " + request.getContextPath() + "</h1>");
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
        String name = request.getParameter("usrname");
        String pass = request.getParameter("pwd");
        String name1 = name;
        CustIDBean cb = new CustIDBean();
        cb.setID(name);
        String path1 = "/clienthome1.jsp";
        int chk = 0;
        UserAuthentication ua = new UserAuthentication();
        chk = ua.userAuthentication(name,pass);
        switch(chk)
        {
            case 1: 
                    response.sendRedirect("adminhome.html");
                    break;
                    
            case 2:
                    response.sendRedirect("userhome.html");
                    break;
                    
            case 3:
                    response.sendRedirect("clienthome1.jsp");
                    request.setAttribute("cid",name1);
                    //ServletContext context = getServletContext();
                    //RequestDispatcher dispatcher = request.getRequestDispatcher(path1);
                    //dispatcher.forward(request, response);
                    //forwardToJSP("clienthome1.jsp",request,response);
                    //String str1 = request.getParameter("cid");
                  //  response.sendRedirect("clienthome.html");
                    break;
                    
            default:
                    response.sendRedirect("loginerror.html");
                    break;
        }
      
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
