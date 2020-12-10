/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.NoticiasModel;
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
public class NoticiaDAO {
    
    public static int InsertNoticia(NoticiasModel noticia) throws SQLException {
        Connection con = DbConnection.getConnection();
        try {
            String sql = "CALL `prograweb`.`noticia`(?, NULL, ?, ?, ?, ?, ?, ?, NULL, NULL, NULL, ?);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "I");
            statement.setString(2, noticia.getTitulo());
            statement.setString(3, noticia.getDescripcion());
            statement.setString(4, noticia.getContenido());
            statement.setInt(5, noticia.getCategoria());
            statement.setInt(6, noticia.getStatus());
            statement.setString(7, noticia.getFechapublicacion());
            statement.setInt(8, noticia.getAutor());
            
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
    
    public static int GetLastId() throws SQLException{
         Connection con = DbConnection.getConnection();
        try{
            String sql = "CALL `prograweb`.`noticia`( ?, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "UI");
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id = result.getInt("id");
                return id;
            }
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
    
    public static List<NoticiasModel> GetNoticias() throws SQLException{
        List<NoticiasModel>  noticias = new ArrayList<>();
        Connection con = DbConnection.getConnection();
        try {
        String sql = "CALL `prograweb`.`noticia`( ?, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "AS");
            ResultSet result = statement.executeQuery();
            while     (result.next()) {
                Integer id = result.getInt("idnoticia");
                String title = result.getString("titulo");
                String Description = result.getString("descripcion");
                String Content = result.getString("contenido");
                Integer Category = result.getInt("categoria");
                Integer Author = result.getInt("autor");
                Integer Status = result.getInt("status");
                String Date = result.getString("fechapublicacion");
                noticias.add(new NoticiasModel(id, title, Description, Content, Category, Status, Date, Author));
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
        return noticias;
    }
    
    public static NoticiasModel GetNoticia(int idNoticia) throws SQLException{
        Connection con = DbConnection.getConnection();
        try {
        String sql = "CALL `prograweb`.`noticia`( ?, ?, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "S");
            statement.setInt(2, idNoticia);
            ResultSet result = statement.executeQuery();
            while     (result.next()) {
                Integer id = result.getInt("idnoticia");
                String title = result.getString("titulo");
                String Description = result.getString("descripcion");
                String Content = result.getString("contenido");
                Integer Category = result.getInt("categoria");
                Integer Status = result.getInt("status");
                String Date = result.getString("fechapublicacion");
                Integer likes = result.getInt("like");
                Integer dislikes = result.getInt("dislike");
                Integer Author = result.getInt("autor");
                return new NoticiasModel(id, title, Description, Content, Category, Status, Date, likes, dislikes,Author);
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
        return null;
    }
    
    public static List<NoticiasModel> GetNoticiasByUser(int idUser) throws SQLException{
        List<NoticiasModel>  noticias = new ArrayList<>();
        Connection con = DbConnection.getConnection();
        try {
        String sql = "CALL `prograweb`.`noticia`( ?, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ?);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "US");
            statement.setInt(2, idUser);
            ResultSet result = statement.executeQuery();
            while     (result.next()) {
                Integer id = result.getInt("idnoticia");
                String title = result.getString("titulo");
                String Description = result.getString("descripcion");
                String Content = result.getString("contenido");
                Integer Category = result.getInt("categoria");
                Integer Status = result.getInt("status");
                String Date = result.getString("fechapublicacion");
                String motivo = result.getString("motivo");
                Integer like = result.getInt("like");
                Integer dislike = result.getInt("dislike");
                Integer Author = result.getInt("autor");
                noticias.add(new NoticiasModel(id, title, Description, Content, Category, Status, Date, motivo, like, dislike, Author));
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
        return noticias;
    }
    
    public static int UpdateStatus(Integer idNoticia, Integer status, String motivo) throws SQLException {
        Connection con = DbConnection.getConnection();
        try {
            String sql = "CALL `prograweb`.`noticia`(?, ?, NULL, NULL, NULL, NULL, ?, NULL, ?, NULL, NULL, NULL);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "UT");
            statement.setInt(2, idNoticia);
            statement.setInt(3, status);
            statement.setString(4, motivo);
            
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
    
    public static int EditarNoticia(NoticiasModel noticia) throws SQLException {
        Connection con = DbConnection.getConnection();
        try {
            String sql = "CALL `prograweb`.`noticia`( ?, ?, ?, ?, ?, ?, ?, ?, NULL, NULL, NULL, NULL);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "U");
            statement.setInt(2, noticia.getIdnoticia());
            statement.setString(3, noticia.getTitulo());
            statement.setString(4, noticia.getDescripcion());
            statement.setString(5, noticia.getContenido());
            statement.setInt(6, noticia.getCategoria());
            statement.setInt(7, noticia.getStatus());
            statement.setString(8, noticia.getFechapublicacion());
            
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
}
