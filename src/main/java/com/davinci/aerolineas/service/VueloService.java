package com.davinci.aerolineas.service;

import com.davinci.aerolineas.model.Aviones;
import com.davinci.aerolineas.model.Vuelo;

import java.util.List;

public interface VueloService {
    void saveVuelo(Vuelo vuelo);


    List<Vuelo> getAll();

    Vuelo getById(int idVuelo);

    void updateVuelo(Vuelo vuelo);

    void deleteVueloById(int idVuelo);

    public List<Vuelo> getVuelosHabilitados();

    List getByAvion(Aviones avion);
}
