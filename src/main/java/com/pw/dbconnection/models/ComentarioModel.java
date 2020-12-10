/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.pw.dbconnection.models;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class ComentarioModel {
    private int idcomentarios;
    private String contenido;
    private User Usuario;;
    private int idNoticia;
    private int tipo;
    private int idComentario;
    private int likes;
    private String fecha;

    public ComentarioModel(int idcomentarios, String contenido, User Usuario, int idNoticia, int tipo, int idComentario, int likes, String fecha) {
        this.idcomentarios = idcomentarios;
        this.contenido = contenido;
        this.Usuario = Usuario;
        this.idNoticia = idNoticia;
        this.tipo = tipo;
        this.idComentario = idComentario;
        this.likes = likes;
        this.fecha = fecha;
    }

    public ComentarioModel(String contenido, User Usuario, int idNoticia, int tipo, int idComentario, String fecha) {
        this.contenido = contenido;
        this.Usuario = Usuario;
        this.idNoticia = idNoticia;
        this.tipo = tipo;
        this.idComentario = idComentario;
        this.fecha = fecha;
    }

    public ComentarioModel() {
    }
    
    public int getIdcomentarios() {
        return idcomentarios;
    }

    public void setIdcomentarios(int idcomentarios) {
        this.idcomentarios = idcomentarios;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public User getUsuario() {
        return Usuario;
    }

    public void setUsuario(User Usuario) {
        this.Usuario = Usuario;
    }

    public int getIdNoticia() {
        return idNoticia;
    }

    public void setIdNoticia(int idNoticia) {
        this.idNoticia = idNoticia;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public int getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(int idComentario) {
        this.idComentario = idComentario;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
}
