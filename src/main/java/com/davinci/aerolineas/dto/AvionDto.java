package com.davinci.aerolineas.dto;


public class AvionDto {


    private int idAvion;


    private String marca;



    private String modelo;



    private String matricula;


    private int butacas;

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

    public int getButacas() {
        return butacas;
    }

    public void setButacas(int butacas) {
        this.butacas = butacas;
    }
}
