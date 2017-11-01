package com.davinci.aerolineas.dao;

import com.davinci.aerolineas.model.Employee;
import com.davinci.aerolineas.model.Usuario;

import java.util.List;

public interface UsuarioDao {

	public Usuario findUser(String usuario, String password) ;


	}
