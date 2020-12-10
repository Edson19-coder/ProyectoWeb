/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.FavoritoDAO;
import com.pw.dbconnection.models.FavoritoModel;
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
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
@WebServlet(name = "Favorito", urlPatterns = {"/Favorito"})
public class FavoritoController extends HttpServlet {

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
        HttpSession session = request.getSession();
        Integer idUser = (Integer) session.getAttribute("id_user");
        String acc = request.getParameter("acc");
        Integer idNews = Integer.parseInt(request.getParameter("not"));
        switch(acc){
            case "add":{
            try {
                if(FavoritoDAO.InserFav(new FavoritoModel(idUser, idNews)) == 1){
                    System.out.println("Insertado");
                }else{
                    System.out.println("No insertado");
                }
            } catch (SQLException ex) {
                Logger.getLogger(FavoritoController.class.getName()).log(Level.SEVERE, null, ex);
            }
                break;
            }
            
            case "delete":{
                try {
                    Integer idFav = Integer.parseInt(request.getParameter("idFav"));
                    if(FavoritoDAO.DeleteFav(idFav) == 1){
                        System.out.println("Borrado");
                    }else{
                        System.out.println("No borrado");
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(FavoritoController.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            }

        }
        response.sendRedirect(request.getContextPath() + "/VerNoticia?idNoticia=" + idNews);
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
