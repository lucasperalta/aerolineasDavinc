package com.davinci.aerolineas.service;

import com.davinci.aerolineas.dao.PasajeDao;
import com.davinci.aerolineas.model.Pasaje;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("pasajesService")
@Transactional
public class PasajesServiceImpl implements PasajesService {

	@Autowired
	private PasajeDao dao;


    public void savePasaje(Pasaje pasaje) {
        dao.savePasaje(pasaje);
    }
}
