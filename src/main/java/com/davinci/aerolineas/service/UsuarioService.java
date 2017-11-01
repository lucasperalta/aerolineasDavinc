package com.davinci.aerolineas.service;

import com.davinci.aerolineas.model.Usuario;

public interface UsuarioService {


    public Usuario findUser(String user, String password);
}
