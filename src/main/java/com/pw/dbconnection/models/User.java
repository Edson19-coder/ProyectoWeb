/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.models;

/**
 *
 * @author magoc
 */
public class User {

    private int id;
    private String username;
    private String password;
    private String correo;
    private String foto;
    private String facebook;
    private String twitter;
    private String tipo;
    private String descripcion;

    public User(int id, String username, String password, String correo, String foto, String facebook, String twitter, String tipo, String descripcion) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.correo = correo;
        this.foto = foto;
        this.facebook = facebook;
        this.twitter = twitter;
        this.tipo = tipo;
        this.descripcion = descripcion;
    }
    
    public User(int id, String username, String password, String correo, String foto, String facebook, String twitter) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.correo = correo;
        this.foto = foto;
        this.facebook = facebook;
        this.twitter = twitter;
    }

    public User(String username, String password, String correo, String foto, String facebook, String twitter) {
        this.username = username;
        this.password = password;
        this.correo = correo;
        this.foto = foto;
        this.facebook = facebook;
        this.twitter = twitter;
    }

    public User(String username, String password, String correo, String facebook, String twitter) {
        this.username = username;
        this.password = password;
        this.correo = correo;
        this.facebook = facebook;
        this.twitter = twitter;
    }

    public User(String correo, String password) {
        this.correo = correo;
        this.password = password;
    }

    public User(int id, String username, String password, String correo, String foto, String facebook, String twitter, String descripcion) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.correo = correo;
        this.foto = foto;
        this.facebook = facebook;
        this.twitter = twitter;
        this.descripcion = descripcion;
    }

    public User(int id) {
        this.id = id;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getTwitter() {
        return twitter;
    }

    public void setTwitter(String twitter) {
        this.twitter = twitter;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
