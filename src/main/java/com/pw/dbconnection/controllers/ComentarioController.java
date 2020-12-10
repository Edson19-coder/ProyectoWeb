/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.ComentarioDAO;
import com.pw.dbconnection.models.ComentarioModel;
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
@WebServlet(name = "Comentario", urlPatterns = {"/Comentario"})
public class ComentarioController extends HttpServlet {

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
        java.util.Date dt = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = sdf.format(dt);
        switch (acc) {
            case "comentar": {
                try {
                    String contenido = request.getParameter("content");
                    ComentarioModel comentario;
                    comentario = new ComentarioModel(contenido, new User(idUser), idNews, 0, 0, currentTime);
                    ComentarioDAO.InsertComentario(comentario);
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(ComentarioController.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            
            case "responder": {
                try {
                    String contenido = request.getParameter("content");
                    String comentarioString = request.getParameter("comentario");
                    Integer com = Integer.parseInt(comentarioString);
                    ComentarioModel comentario;
                    comentario = new ComentarioModel(contenido, new User(idUser), idNews, 1, com, currentTime);
                    ComentarioDAO.InsertRespuesta(comentario);
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(ComentarioController.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            
            case "deleteCom":{
                try {
                    String idComString = request.getParameter("comid");
                    Integer idCom = Integer.parseInt(idComString);
                    List<ComentarioModel> respuestas = ComentarioDAO.GetRespuestasComentario(idCom);
                    for(ComentarioModel respuesta : respuestas){
                        ComentarioDAO.DeleteComentario(respuesta.getIdcomentarios());
                    }
                    if(ComentarioDAO.DeleteComentario(idCom) == 1){
                        System.out.println("Comentario borrado");
                    }else{
                        System.out.println("No eliminado");
                    }
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(ComentarioController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            
            case "deleteAns":{
                try {
                    String idAnsString = request.getParameter("ansid");
                    Integer idAns = Integer.parseInt(idAnsString);
                    if(ComentarioDAO.DeleteComentario(idAns) == 1){
                        System.out.println("Respuesta Eliminada");
                    }else{
                        System.out.println("No eliminado");
                    }
                    break;
                } catch (SQLException ex) {
                    Logger.getLogger(ComentarioController.class.getName()).log(Level.SEVERE, null, ex);
                }
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
