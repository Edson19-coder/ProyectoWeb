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
public class NoticiasModel {
    private int idnoticia;
    private String titulo;
    private String descripcion;
    private String contenido;
    private int categoria;
    private int status;
    private String fechapublicacion;
    private String motivo;
    private int like;
    private int dislike;
    private int autor;

    public NoticiasModel(int idnoticia, String titulo, String descripcion, String contenido, int categoria, int status, String fechapublicacion, String motivo, int like, int dislike, int autor) {
        this.idnoticia = idnoticia;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.contenido = contenido;
        this.categoria = categoria;
        this.status = status;
        this.fechapublicacion = fechapublicacion;
        this.motivo = motivo;
        this.like = like;
        this.dislike = dislike;
        this.autor = autor;
    }

    public NoticiasModel(String titulo, String descripcion, String contenido, int categoria, int status, String fechapublicacion, String motivo, int like, int dislike, int autor) {
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.contenido = contenido;
        this.categoria = categoria;
        this.status = status;
        this.fechapublicacion = fechapublicacion;
        this.motivo = motivo;
        this.like = like;
        this.dislike = dislike;
        this.autor = autor;
    }

    public NoticiasModel(String titulo, String descripcion, String contenido, int categoria, String fechapublicacion, int autor) {
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.contenido = contenido;
        this.categoria = categoria;
        this.fechapublicacion = fechapublicacion;
        this.autor = autor;
    }

    public NoticiasModel(String titulo, String descripcion, String contenido, int categoria, int status, String fechapublicacion, int autor) {
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.contenido = contenido;
        this.categoria = categoria;
        this.status = status;
        this.fechapublicacion = fechapublicacion;
        this.autor = autor;
    }

    public NoticiasModel(int idnoticia, String titulo, String descripcion, String contenido, int categoria, int status, String fechapublicacion, int autor) {
        this.idnoticia = idnoticia;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.contenido = contenido;
        this.categoria = categoria;
        this.status = status;
        this.fechapublicacion = fechapublicacion;
        this.autor = autor;
    }

    public NoticiasModel(int idnoticia, String titulo, String descripcion, String contenido, int categoria, int status, String fechapublicacion, int like, int dislike, int autor) {
        this.idnoticia = idnoticia;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.contenido = contenido;
        this.categoria = categoria;
        this.status = status;
        this.fechapublicacion = fechapublicacion;
        this.like = like;
        this.dislike = dislike;
        this.autor = autor;
    }

    public NoticiasModel(int idnoticia, String titulo, String descripcion, String contenido, int categoria, int status, String fechapublicacion) {
        this.idnoticia = idnoticia;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.contenido = contenido;
        this.categoria = categoria;
        this.status = status;
        this.fechapublicacion = fechapublicacion;
    }
    
    public NoticiasModel() {
    }

    public int getIdnoticia() {
        return idnoticia;
    }

    public void setIdnoticia(int idnoticia) {
        this.idnoticia = idnoticia;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getFechapublicacion() {
        return fechapublicacion;
    }

    public void setFechapublicacion(String fechapublicacion) {
        this.fechapublicacion = fechapublicacion;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public int getDislike() {
        return dislike;
    }

    public void setDislike(int dislike) {
        this.dislike = dislike;
    }

    public int getAutor() {
        return autor;
    }

    public void setAutor(int autor) {
        this.autor = autor;
    }
    
    
}
