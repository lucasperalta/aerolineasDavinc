package com.davinci.aerolineas.service;

import com.davinci.aerolineas.dao.AvionesDao;
import com.davinci.aerolineas.dao.RutaDao;
import com.davinci.aerolineas.model.Aviones;
import com.davinci.aerolineas.model.Ruta;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("rutaService")
@Transactional
public class RutaServiceImpl implements RutaService {

	@Autowired
	private RutaDao dao;


	public void saveRuta(Ruta ruta) {
		dao.saveRuta(ruta);
	}

	public List<Ruta> getAll() {
		return dao.getAll();
	}

	public Ruta getById(int rutaid) {
		return dao.getById(rutaid);
	}
}
