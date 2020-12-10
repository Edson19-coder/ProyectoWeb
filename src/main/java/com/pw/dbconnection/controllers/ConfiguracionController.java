/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.UserDAO;
import com.pw.dbconnection.models.User;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.pw.dbconnection.utils.FileUtils;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
@WebServlet(name = "Configuracion", urlPatterns = {"/Configuracion"})
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 25)
public class ConfiguracionController extends HttpServlet {

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
        request.getRequestDispatcher("configuracion.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Integer iduser = (Integer) session.getAttribute("id_user");
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userPass = request.getParameter("userPass");
        String userFace = request.getParameter("userFace");
        String userTwitter = request.getParameter("userTwitter");
        String userSobrMy = request.getParameter("content");
        Part file = request.getPart("image");
        InputStream inputStream = file.getInputStream();
        String fullPath = null;

        if (inputStream.available() != 0) {
            String nameImage = file.getName() + System.currentTimeMillis() + FileUtils.GetExtension(file.getContentType());
            String path = request.getServletContext().getRealPath("");
            fullPath = path + FileUtils.RUTE_USER_IMAGE + "/" + nameImage;
            file.write(fullPath);
            fullPath = FileUtils.RUTE_USER_IMAGE + "/" + nameImage;
        }

        if (!iduser.equals("") && !userName.equals("") && !userEmail.equals("") && !userPass.equals("")) {
            User edit = null;
            if (inputStream.available() != 0) {
                try {
                    edit = new User(iduser, userName, userPass, userEmail, fullPath, userFace, userTwitter, userSobrMy);
                    if (UserDAO.EditarUsuario(edit) == 1) {
                        User logIn = UserDAO.logInUser(edit);
                        session.setAttribute("id_user", logIn.getId());
                        session.setAttribute("name_user", logIn.getUsername());
                        session.setAttribute("password_user", logIn.getPassword());
                        session.setAttribute("correo_user", logIn.getCorreo());
                        session.setAttribute("foto_user", logIn.getFoto());
                        session.setAttribute("facebook_user", logIn.getFacebook());
                        session.setAttribute("twitter_user", logIn.getTwitter());
                        session.setAttribute("descripcion_user", logIn.getDescripcion());
                        System.out.println("Editado");
                    } else {
                        System.out.println("No Editado");
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(ConfiguracionController.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {
                    edit = new User(iduser, userName, userPass, userEmail, userFace, userTwitter, (String) session.getAttribute("image_user_session"), userSobrMy);
                    if (UserDAO.EditarUsuario(edit) == 1) {
                        System.out.println("Editado");
                    } else {
                        System.out.println("No Editado");
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(ConfiguracionController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
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
