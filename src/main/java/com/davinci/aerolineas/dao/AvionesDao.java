package com.davinci.aerolineas.dao;

import com.davinci.aerolineas.model.Aviones;
import com.davinci.aerolineas.model.Destinos;

import java.util.List;

public interface AvionesDao {
    void saveAviones(Aviones aviones);


    List<Aviones> getAll();

    Aviones getById(int avionId);
     void deleteAvionById(int idAvion);

    }
