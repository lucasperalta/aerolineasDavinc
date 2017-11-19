package com.davinci.aerolineas.dao;


import com.davinci.aerolineas.model.Ruta;

import java.util.List;

public interface RutaDao {


    void saveRuta(Ruta ruta);

    List<Ruta> getAll();

    Ruta getById(int rutaid);

    void deleteRutaById(int idRuta);
}
