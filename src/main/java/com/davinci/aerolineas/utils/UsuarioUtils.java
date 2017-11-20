package com.davinci.aerolineas.utils;

import com.davinci.aerolineas.model.Usuario;

public class UsuarioUtils {

    public static Boolean isAnalista(Usuario usuario) {

        if (usuario != null && usuario.getRolUsuario().equals("analista")) {
            return true;
        }
        return false;
    }


    public static Boolean isVendedor(Usuario usuario) {

        if (usuario != null && usuario.getRolUsuario().equals("vendedor")) {
            return true;
        }
        return false;
    }


}
