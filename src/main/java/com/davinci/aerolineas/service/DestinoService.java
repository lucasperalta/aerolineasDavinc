package com.davinci.aerolineas.service;

import com.davinci.aerolineas.model.Destinos;
import com.davinci.aerolineas.model.Usuario;

import java.util.List;

public interface DestinoService {


    void saveDestino(Destinos destinos);

    List<Destinos> getAll();

    Destinos getById(int origenId);
}
