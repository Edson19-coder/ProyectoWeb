/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.FavoritoModel;
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
public class FavoritoDAO {

    public static int InserFav(FavoritoModel fav) throws SQLException {
        Connection con = DbConnection.getConnection();
        try {
            String sql = "CALL `prograweb`.`favoritos`(?, NULL, ?, ?);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "I");
            statement.setInt(2, fav.getUsuarioId());
            statement.setInt(3, fav.getNoticiafav());
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

    public static int DeleteFav(int idFav) throws SQLException {
        Connection con = DbConnection.getConnection();
        try {
            String sql = "CALL `prograweb`.`favoritos`( ?, ?, NULL, NULL);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "D");
            statement.setInt(2, idFav);
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

    public static List<FavoritoModel> GetFavUser(int idUser) throws SQLException {
        Connection con = DbConnection.getConnection();
        List<FavoritoModel> favNews = new ArrayList<>();
        try {
            String sql = "CALL `prograweb`.`favoritos`( ?, NULL, ?, NULL);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "SU");
            statement.setInt(2, idUser);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int idfavorito = result.getInt("idfavorito");
                int usuarioId = result.getInt("usuarioId");
                int noticiafav = result.getInt("noticiafav");
                NoticiasModel news = NoticiaDAO.GetNoticia(noticiafav);
                favNews.add(new FavoritoModel(idfavorito, usuarioId, news));
            }
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
        return favNews;
    }
    
    public static FavoritoModel IsFavNoticia(FavoritoModel isFav) throws SQLException {
        Connection con = DbConnection.getConnection();
        try {
            String sql = "CALL `prograweb`.`favoritos`( ?, NULL, ?, ?);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "SN");
            statement.setInt(2, isFav.getUsuarioId());
            statement.setInt(3, isFav.getNoticiafav());
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int idfavorito = result.getInt("idfavorito");
                int usuarioId = result.getInt("usuarioId");
                int noticiafav = result.getInt("noticiafav");
                return new FavoritoModel(idfavorito, usuarioId, noticiafav);
            }
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
        return null;
    }
}
