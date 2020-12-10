/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.User;
import com.pw.dbconnection.utils.DbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author magoc
 */
public class UserDAO {

    public static int signInUser(User user) throws SQLException {
        Connection con = DbConnection.getConnection();
        try {
            String sql = "CALL `prograweb`.`usuario`(?, NULL, ?, ?, ?, NULL, ?, ?, NULL, NULL);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "I");
            statement.setString(2, user.getUsername());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getCorreo());
            statement.setString(5, user.getFacebook());
            statement.setString(6, user.getTwitter());

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

    public static User logInUser(User user) throws SQLException {
        Connection con = DbConnection.getConnection();
        try {
            String sql = "CALL `prograweb`.`usuario`( ?, NULL, NULL, ?, ?, NULL, NULL, NULL, NULL, NULL);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "SL");
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getCorreo());

            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id = result.getInt("iduser");
                String username = result.getString("username");
                String password = result.getString("password");
                String correo = result.getString("correo");
                String image = result.getString("image");
                String facebook = result.getString("facebook");
                String twitter = result.getString("twitter");
                String tipo = result.getString("tipo");
                String descriocion = result.getString("descripcion");
                
                return new User(id, username, password, correo, image, facebook,twitter, tipo, descriocion);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }finally {
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
    
    public static User GetUser(int idUser) throws SQLException {
        Connection con = DbConnection.getConnection();
        try {
            String sql = "CALL `prograweb`.`usuario`( ?, ?, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "S");
            statement.setInt(2, idUser);

            ResultSet result = statement.executeQuery();
            while (result.next()) {
                int id = result.getInt("iduser");
                String username = result.getString("username");
                String password = result.getString("password");
                String correo = result.getString("correo");
                String image = result.getString("image");
                String facebook = result.getString("facebook");
                String twitter = result.getString("twitter");
                String tipo = result.getString("tipo");
                String descriocion = result.getString("descripcion");
                
                return new User(id, username, password, correo, image, facebook,twitter, tipo, descriocion);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }finally {
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
    
    public static int EditarUsuario(User user) throws SQLException {
        Connection con = DbConnection.getConnection();
        try {
            String sql = "CALL `prograweb`.`usuario`( ?, ?, ?, ?, ?, ?, ?, ?, NULL, ?);";
            CallableStatement statement = con.prepareCall(sql);
            statement.setString(1, "U");
            statement.setInt(2, user.getId());
            statement.setString(3, user.getUsername());
            statement.setString(4, user.getPassword());
            statement.setString(5, user.getCorreo());
            statement.setString(6, user.getFoto());
            statement.setString(7, user.getFacebook());
            statement.setString(8, user.getTwitter());
            statement.setString(9, user.getDescripcion());

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
