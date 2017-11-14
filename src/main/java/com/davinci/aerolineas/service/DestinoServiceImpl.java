package com.davinci.aerolineas.service;

import com.davinci.aerolineas.dao.DestinoDao;
import com.davinci.aerolineas.dao.UsuarioDao;
import com.davinci.aerolineas.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("destinoService")
@Transactional
public class DestinoServiceImpl implements DestinoService {

	@Autowired
	private DestinoDao dao;


	public void saveDestino(Destinos destinos) {

			dao.saveDestino(destinos);


	}

	public List<Destinos> getAll() {
		return dao.getAll();
	}

	public Destinos getById(int origenId) {
		return dao.getById(origenId);
	}

	public void deleteDestinoById(int idDestino) {
		dao.deleteDestinoById(idDestino);

	}

	public void updateDestino(Destinos destinos) {
		Destinos entity = dao.getById(destinos.getIdDestino());
		if(entity!=null){
			entity.setPais(destinos.getPais());
			entity.setProvincia(destinos.getProvincia());

		}
	}


}
