package com.davinci.aerolineas.service;

import com.davinci.aerolineas.dao.AvionesDao;
import com.davinci.aerolineas.dao.DestinoDao;
import com.davinci.aerolineas.model.Destinos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("destinoService")
@Transactional
public class AvionesServiceImpl implements AvionesService {

	@Autowired
	private AvionesDao dao;

/*
	public void saveAviones(Destinos destinos) {

	}
	*/
}
