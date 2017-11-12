package com.davinci.aerolineas.model;


import javax.persistence.*;

@Entity
@Table(name="rutas")
public class Ruta {



    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idRuta;

    @ManyToOne
    private Destinos destinoPartida;

    @ManyToOne
    private Destinos destinoLlegada;


    public int getIdRuta() {
        return idRuta;
    }

    public void setIdRuta(int idRuta) {
        this.idRuta = idRuta;
    }

    public Destinos getDestinoPartida() {
        return destinoPartida;
    }

    public void setDestinoPartida(Destinos destinoPartida) {
        this.destinoPartida = destinoPartida;
    }

    public Destinos getDestinoLlegada() {
        return destinoLlegada;
    }

    public void setDestinoLlegada(Destinos destinoLlegada) {
        this.destinoLlegada = destinoLlegada;
    }
}
