package com.davinci.aerolineas.dao;


import com.davinci.aerolineas.model.Vuelo;

import java.util.List;

public interface VueloDao {

    public void saveVuelo(Vuelo vuelo);

    List<Vuelo> getAll();
}
