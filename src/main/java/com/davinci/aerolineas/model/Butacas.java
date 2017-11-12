package com.davinci.aerolineas.model;

import javax.persistence.*;

@Entity
@Table(name="butacas")
public class Butacas {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idButaca;

    @Column(name = "numeroButaca")
    private int numeroButaca;


    @Column(name = "disponibilidad")
    private String disponibilidad;





    @ManyToOne
    @JoinColumn(name = "idAvion")
    private Aviones avion;


    public Aviones getAvion() {
        return avion;
    }

    public void setAvion(Aviones avion) {
        this.avion = avion;
    }

    public int getIdButaca() {
        return idButaca;
    }

    public void setIdButaca(int idButaca) {
        this.idButaca = idButaca;
    }

    public int getNumeroButaca() {
        return numeroButaca;
    }

    public void setNumeroButaca(int numeroButaca) {
        this.numeroButaca = numeroButaca;
    }

    public String getDisponibilidad() {
        return disponibilidad;
    }

    public void setDisponibilidad(String disponibilidad) {
        this.disponibilidad = disponibilidad;
    }



}
