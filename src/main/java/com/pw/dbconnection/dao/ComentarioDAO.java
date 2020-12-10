/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.ComentarioModel;
import com.pw.dbconnection.utils.DbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class ComentarioDAO {
    
    public static int InsertComentario(ComentarioModel comentario) throws SQLException{
        Connection con = DbConnection.getConnection();
          try{
              String sql = "CALL `prograweb`.`comentarios`(?, NULL, ?, ?, ?, ?, NULL, NULL, ?);";
              CallableStatement statement = con.prepareCall(sql);
              statement.setString(1, "I");
              statement.setString(2, comentario.getContenido());
              statement.setInt(3, comentario.getUsuario().getId());
              statement.setInt(4, comentario.getIdNoticia());
              statement.setInt(5, comentario.getTipo());
              statement.setString(6, comentario.getFecha());
              return statement.executeUpdate();
          }catch(SQLException ex){
              System.out.println(ex.getMessage());
          }finally{
              if(con != null){
                  try{
                      con.close();
                  } catch(SQLException ex){
                      System.out.println(ex);
                  }
              }
          }
          return 0; 
    }
    
    public static int InsertRespuesta(ComentarioModel comentario) throws SQLException{
        Connection con = DbConnection.getConnection();
          try{
              String sql = "CALL `prograweb`.`comentarios`(?, NULL, ?, ?, ?, ?, ?, NULL, ?);";
              CallableStatement statement = con.prepareCall(sql);
              statement.setString(1, "I");
              statement.setString(2, comentario.getContenido());
              statement.setInt(3, comentario.getUsuario().getId());
              statement.setInt(4, comentario.getIdNoticia());
              statement.setInt(5, comentario.getTipo());
              statement.setInt(6, comentario.getIdComentario());
              statement.setString(7, comentario.getFecha());
              return statement.executeUpdate();
          }catch(SQLException ex){
              System.out.println(ex.getMessage());
          }finally{
              if(con != null){
                  try{
                      con.close();
                  } catch(SQLException ex){
                      System.out.println(ex);
                  }
              }
          }
          return 0; 
    }
    
    public static List<ComentarioModel> GetComentarios(int id) throws SQLException{
        List<ComentarioModel> comentarios = new ArrayList<>();
        Connection con = DbConnection.getConnection();
        try {
            String sql = "CALL `prograweb`.`comentarios`(?, NULL, NULL, NULL, ?, NULL, NULL, NULL, NULL);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "SC");
            statement.setInt(2, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Integer idcomentarios = result.getInt("idcomentarios");
                String contenido = result.getString("contenido");
                Integer idUsuario = result.getInt("idUsuario");
                Integer idNoticia = result.getInt("idNoticia");
                Integer tipo = result.getInt("tipo");
                Integer idComentario =  result.getInt("idComentario");
                Integer likes = result.getInt("likes");
                String fecha = result.getString("fecha");
                comentarios.add(new ComentarioModel(idcomentarios, contenido, UserDAO.GetUser(idUsuario), idNoticia, tipo, idComentario, likes, fecha));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }finally{
            if(con != null){
                try{
                    con.close();
                } catch(SQLException ex){
                    System.out.println(ex);
                }
            }
        }
        return comentarios;
    }
    
    public static List<ComentarioModel> GetRespuestas(int id) throws SQLException{
        List<ComentarioModel> comentarios = new ArrayList<>();
        Connection con = DbConnection.getConnection();
        try {
            String sql = "CALL `prograweb`.`comentarios`(?, NULL, NULL, NULL, ?, NULL, NULL, NULL, NULL);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "SR");
            statement.setInt(2, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Integer idcomentarios = result.getInt("idcomentarios");
                String contenido = result.getString("contenido");
                Integer idUsuario = result.getInt("idUsuario");
                Integer idNoticia = result.getInt("idNoticia");
                Integer tipo = result.getInt("tipo");
                Integer idComentario =  result.getInt("idComentario");
                Integer likes = result.getInt("likes");
                String fecha = result.getString("fecha");
                comentarios.add(new ComentarioModel(idcomentarios, contenido, UserDAO.GetUser(idUsuario), idNoticia, tipo, idComentario, likes, fecha));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }finally{
            if(con != null){
                try{
                    con.close();
                } catch(SQLException ex){
                    System.out.println(ex);
                }
            }
        }
        return comentarios;
    }
    
    public static int DeleteComentario(int idcom) throws SQLException{
        Connection con = DbConnection.getConnection();
        try {
            String sql = "CALL `prograweb`.`comentarios`(?, ?, NULL, NULL, NULL, NULL, NULL, NULL, NULL);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "D");
            statement.setInt(2, idcom);
            return statement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    System.out.println(ex);
                }
            }
        }
        return 0;
    }
    
    public static List<ComentarioModel> GetRespuestasComentario(int id) throws SQLException{
        List<ComentarioModel> comentarios = new ArrayList<>();
        Connection con = DbConnection.getConnection();
        try {
            String sql = "CALL `prograweb`.`comentarios`( ?, NULL, NULL, NULL, NULL, NULL, ?, NULL, NULL);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "CR");
            statement.setInt(2, id);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                Integer idcomentarios = result.getInt("idcomentarios");
                String contenido = result.getString("contenido");
                Integer idUsuario = result.getInt("idUsuario");
                Integer idNoticia = result.getInt("idNoticia");
                Integer tipo = result.getInt("tipo");
                Integer idComentario =  result.getInt("idComentario");
                Integer likes = result.getInt("likes");
                String fecha = result.getString("fecha");
                comentarios.add(new ComentarioModel(idcomentarios, contenido, UserDAO.GetUser(idUsuario), idNoticia, tipo, idComentario, likes, fecha));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }finally{
            if(con != null){
                try{
                    con.close();
                } catch(SQLException ex){
                    System.out.println(ex);
                }
            }
        }
        return comentarios;
    }
}
