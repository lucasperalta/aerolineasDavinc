package com.davinci.aerolineas.service;

import com.davinci.aerolineas.model.Aviones;

import java.util.List;

public interface AvionesService {
    void saveAviones(Aviones aviones);


    List<Aviones> getAll();

    Aviones getById(int avionId);
}
