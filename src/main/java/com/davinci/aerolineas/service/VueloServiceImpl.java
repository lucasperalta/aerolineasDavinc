package com.davinci.aerolineas.service;

import com.davinci.aerolineas.dao.AvionesDao;
import com.davinci.aerolineas.dao.VueloDao;
import com.davinci.aerolineas.model.Aviones;
import com.davinci.aerolineas.model.Vuelo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("vueloService")
@Transactional
public class VueloServiceImpl implements VueloService {

	@Autowired
	private VueloDao dao;


	public void saveVuelo(Vuelo vuelo) {

		dao.saveVuelo(vuelo);
	}

	public List<Vuelo> getAll() {
		return dao.getAll();
	}
}
