/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.UserDAO;
import com.pw.dbconnection.models.User;
import com.pw.dbconnection.utils.Validaciones;
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
@WebServlet(name = "SignInController", urlPatterns = {"/SignInController"})
public class SignInController extends HttpServlet {

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
        String username = request.getParameter("username");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String password_conf = request.getParameter("confirmp");
        String facebook = request.getParameter("facebook");
        String twitter = request.getParameter("twitter");
        Boolean isPass = Validaciones.password_val(password, password_conf);
        if(isPass != false){
            try {
                User user = new User(username, password, correo, facebook, twitter);
                if (UserDAO.signInUser(user) == 1) {
                    HttpSession session = request.getSession();
                    session.setAttribute("id_user", user.getId());
                    session.setAttribute("name_user", user.getUsername());
                    session.setAttribute("password_user", user.getPassword());
                    session.setAttribute("correo_user", user.getCorreo());
                    session.setAttribute("foto_user", user.getFoto());
                    session.setAttribute("facebook_user", user.getFacebook());
                    session.setAttribute("twitter_user", user.getTwitter());
                    session.setAttribute("descripcion_user", user.getDescripcion());
                    session.setAttribute("tipo_user", user.getTipo());
                    response.sendRedirect(request.getContextPath() + "/Home");
                } else {
                    response.sendRedirect(request.getContextPath() + "/Home");
                    request.getRequestDispatcher("login_register.jsp").forward(request,response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(SignInController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else{
            System.out.println("Contraseñas no iguales");
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
