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
public class FavoritoModel {
    private int idfavorito;
    private int usuarioId;
    private int noticiafav;
    private NoticiasModel noticia;

    public FavoritoModel(int idfavorito, int usuarioId, int noticiafav) {
        this.idfavorito = idfavorito;
        this.usuarioId = usuarioId;
        this.noticiafav = noticiafav;
    }

    public FavoritoModel(int idfavorito, int usuarioId, NoticiasModel noticia) {
        this.idfavorito = idfavorito;
        this.usuarioId = usuarioId;
        this.noticia = noticia;
    }

    public FavoritoModel(int usuarioId, int noticiafav) {
        this.usuarioId = usuarioId;
        this.noticiafav = noticiafav;
    }

    public FavoritoModel() {
    }

    public int getIdfavorito() {
        return idfavorito;
    }

    public void setIdfavorito(int idfavorito) {
        this.idfavorito = idfavorito;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public int getNoticiafav() {
        return noticiafav;
    }

    public void setNoticiafav(int noticiafav) {
        this.noticiafav = noticiafav;
    }

    public NoticiasModel getNoticia() {
        return noticia;
    }

    public void setNoticia(NoticiasModel noticia) {
        this.noticia = noticia;
    }
    
    
}
