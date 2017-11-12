package com.davinci.aerolineas.service;

import com.davinci.aerolineas.dao.AvionesDao;
import com.davinci.aerolineas.dao.DestinoDao;
import com.davinci.aerolineas.model.Aviones;
import com.davinci.aerolineas.model.Destinos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("avionesService")
@Transactional
public class AvionesServiceImpl implements AvionesService {

	@Autowired
	private AvionesDao dao;


	public void saveAviones(Aviones aviones) {

		dao.saveAviones(aviones);
	}

    public List<Aviones> getAll() {
        return dao.getAll();
    }

    public Aviones getById(int avionId) {
        return dao.getById(avionId);
    }
}
