package com.davinci.aerolineas.dto;


public class RutaDto {




    private int idRuta;


    private int destinoPartida;


    private int destinoLlegada;

    public int getIdRuta() {
        return idRuta;
    }

    public void setIdRuta(int idRuta) {
        this.idRuta = idRuta;
    }

    public int getDestinoPartida() {
        return destinoPartida;
    }

    public void setDestinoPartida(int destinoPartida) {
        this.destinoPartida = destinoPartida;
    }

    public int getDestinoLlegada() {
        return destinoLlegada;
    }

    public void setDestinoLlegada(int destinoLlegada) {
        this.destinoLlegada = destinoLlegada;
    }
}
