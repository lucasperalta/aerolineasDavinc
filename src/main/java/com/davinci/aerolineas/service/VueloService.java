package com.davinci.aerolineas.service;

import com.davinci.aerolineas.model.Aviones;
import com.davinci.aerolineas.model.Vuelo;

import java.util.List;

public interface VueloService {
    void saveVuelo(Vuelo vuelo);


    List<Vuelo> getAll();
}
