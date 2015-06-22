/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Daniel
 */
@WebServlet(name = "ControllerServlet", loadOnStartup = 1, urlPatterns = 
        {"/Account", "/Videos", "/Login", "/Register", 
            "/addVideo", "/removeVideo", "/viewCart", "/updateUserView",
        "/Music", "/Radio", "/Playlists",
        "/Profile", "/Users", "/Home"})
public class ControllerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        String userPath = request.getServletPath();
        HttpSession session = request.getSession();
        // if videos page is requested
        if (userPath.equals("/Videos")) {

            if (session.getAttribute("username") == null) {
                response.sendRedirect("Login");
            }

            // if cart page is requested
        } else if (userPath.equals("/viewCart")) {
            // TODO: Implement cart page request

            userPath = "/Videos";

        } else if (userPath.equals("/Login")) {
            if (session.getAttribute("username") != null) {
                response.sendRedirect(request.getContextPath());
            }

        } else if (userPath.equals("/Account")) {
            if (session.getAttribute("username") == null) {
                response.sendRedirect("Login");
            }

        } else if (userPath.equals("/Register")) {
            if (session.getAttribute("username") != null) {
                response.sendRedirect(request.getContextPath());
            }

        } else if (userPath.equals("/updateUserView")) {
            // TODO: Implement cart page request

        }

        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
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
        String userPath = request.getServletPath();

        // if addVideo action is called
        if (userPath.equals("/addVideo")) {
            // TODO: Implement add video action

            // if removeVideo action is called
        } else if (userPath.equals("/removeVideo")) {
            // TODO: Implement remove video action

        }

        // use RequestDispatcher to forward request internally
        String url = "/WEB-INF/view" + userPath + ".jsp";

        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
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
