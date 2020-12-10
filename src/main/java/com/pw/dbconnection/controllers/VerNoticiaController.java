/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.CategoryDAO;
import com.pw.dbconnection.dao.ComentarioDAO;
import com.pw.dbconnection.dao.FavoritoDAO;
import com.pw.dbconnection.dao.MediaDAO;
import com.pw.dbconnection.dao.NoticiaDAO;
import com.pw.dbconnection.dao.UserDAO;
import com.pw.dbconnection.models.CategoryModel;
import com.pw.dbconnection.models.ComentarioModel;
import com.pw.dbconnection.models.FavoritoModel;
import com.pw.dbconnection.models.MediaModel;
import com.pw.dbconnection.models.NoticiasModel;
import com.pw.dbconnection.models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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
@WebServlet(name = "VerNoticia", urlPatterns = {"/VerNoticia"})
public class VerNoticiaController extends HttpServlet {
    Boolean esFav;
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
        try {
            HttpSession session = request.getSession();
            Integer identificadorUser = (Integer) session.getAttribute("id_user");
            String idNoticiaString = request.getParameter("idNoticia");
            Integer idNoticia = Integer.parseInt(idNoticiaString);
            if(identificadorUser!=null){
                FavoritoModel isFav = new FavoritoModel(identificadorUser, idNoticia);
                isFav = FavoritoDAO.IsFavNoticia(isFav);
                request.setAttribute("isFav", isFav);
            }
            NoticiasModel noticia = NoticiaDAO.GetNoticia(idNoticia);
            request.setAttribute("noticia", noticia);
            List<MediaModel> media = MediaDAO.GetMediaById(noticia.getIdnoticia());
            request.setAttribute("media", media);
            User autor = UserDAO.GetUser(noticia.getAutor());
            request.setAttribute("autor", autor);
            CategoryModel categoria = CategoryDAO.GetCategori(noticia.getIdnoticia());
            request.setAttribute("categoria", categoria);
            List<ComentarioModel> comentarios = ComentarioDAO.GetComentarios(idNoticia);
            request.setAttribute("comentarios", comentarios);
            List<ComentarioModel> respuestas = ComentarioDAO.GetRespuestas(idNoticia);
            request.setAttribute("respuestas", respuestas);
            request.getRequestDispatcher("noticiaEspecifica.jsp").forward(request,response);
        } catch (SQLException ex) {
            Logger.getLogger(VerNoticiaController.class.getName()).log(Level.SEVERE, null, ex);
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
