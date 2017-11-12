package com.davinci.aerolineas.dao;

import com.davinci.aerolineas.model.Destinos;
import com.davinci.aerolineas.model.Usuario;

import java.util.List;

public interface DestinoDao {


    void saveDestino(Destinos destinos);

    List<Destinos> getAll();

    Destinos getById(int origenId);
}
