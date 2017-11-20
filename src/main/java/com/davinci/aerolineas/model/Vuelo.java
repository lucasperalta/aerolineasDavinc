package com.davinci.aerolineas.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="vuelos")
public class Vuelo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idVuelo;

    @ManyToOne
    private Aviones avion;

    @ManyToOne
    private Ruta ruta;

    @Column(name = "costoVuelo")
    private float costoVuelo;

    @Column(name = "vueloHabilitado")
    private boolean vueloHabilitado;

    public boolean getVueloHabilitado() {
        return vueloHabilitado;
    }

    public void setVueloHabilitado(boolean vueloHabilitado) {
        this.vueloHabilitado = vueloHabilitado;
    }

    public int getIdVuelo() {
        return idVuelo;
    }

    public void setIdVuelo(int idVuelo) {
        this.idVuelo = idVuelo;
    }

    public Aviones getAvion() {
        return avion;
    }

    public void setAvion(Aviones avion) {
        this.avion = avion;
    }

    public Ruta getRuta() {
        return ruta;
    }

    public void setRuta(Ruta ruta) {
        this.ruta = ruta;
    }

    public float getCostoVuelo() {
        return costoVuelo;
    }

    public void setCostoVuelo(float costoVuelo) {
        this.costoVuelo = costoVuelo;
    }
}
