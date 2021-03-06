package com.davinci.aerolineas.service;

import com.davinci.aerolineas.dao.UsuarioDao;

import com.davinci.aerolineas.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("usuarioService")
@Transactional
public class UsuarioServiceImpl implements UsuarioService {

	@Autowired
	private UsuarioDao dao;
	



	public Usuario findUser(String user, String password){
    return dao.findUser(user,password);
	}


}
