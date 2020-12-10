/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.UserDAO;
import com.pw.dbconnection.models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author magoc
 */
@WebServlet(name = "LogInController", urlPatterns = {"/LogInController"})
public class LogInController extends HttpServlet {
    
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
        request.getRequestDispatcher("login_register.jsp").forward(request,response);
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
        try {
            String useremail = request.getParameter("useremail");
            String password = request.getParameter("password");
            User user = new User(useremail, password);
            User logIn = UserDAO.logInUser(user);
            if(logIn == null) {
                request.getRequestDispatcher("login_register.jsp").forward(request,response);
            } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("id_user", logIn.getId());
                    session.setAttribute("name_user", logIn.getUsername());
                    session.setAttribute("password_user", logIn.getPassword());
                    session.setAttribute("correo_user", logIn.getCorreo());
                    session.setAttribute("foto_user", logIn.getFoto());
                    session.setAttribute("facebook_user", logIn.getFacebook());
                    session.setAttribute("twitter_user", logIn.getTwitter());
                    session.setAttribute("descripcion_user", logIn.getDescripcion());
                    session.setAttribute("tipo_user", logIn.getTipo());
                    response.sendRedirect(request.getContextPath() + "/Home");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LogInController.class.getName()).log(Level.SEVERE, null, ex);
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
    }

}
