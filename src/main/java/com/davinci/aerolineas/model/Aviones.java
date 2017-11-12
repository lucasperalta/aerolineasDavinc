package com.davinci.aerolineas.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="aviones")
public class Aviones {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idAvion;

    @Column(name = "marca")
    private String marca;


    @Column(name = "modelo")
    private String modelo;

    @Column(name = "matricula")

    private String matricula;



    @OneToMany(mappedBy = "avion", cascade=CascadeType.ALL)
    private List<Butacas> butacas;

    public int getIdAvion() {
        return idAvion;
    }

    public void setIdAvion(int idAvion) {
        this.idAvion = idAvion;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public List<Butacas> getButacas() {
        return butacas;
    }

    public void setButacas(List<Butacas> butacas) {
        this.butacas = butacas;
    }



}
