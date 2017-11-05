package com.davinci.aerolineas.service;

import com.davinci.aerolineas.dao.DestinoDao;
import com.davinci.aerolineas.dao.UsuarioDao;
import com.davinci.aerolineas.model.Destinos;
import com.davinci.aerolineas.model.Employee;
import com.davinci.aerolineas.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("destinoService")
@Transactional
public class DestinoServiceImpl implements DestinoService {

	@Autowired
	private DestinoDao dao;


	public void saveDestino(Destinos destinos) {

			dao.saveDestino(destinos);


	}
}
