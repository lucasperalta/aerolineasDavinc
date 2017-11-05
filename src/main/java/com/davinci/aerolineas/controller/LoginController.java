package com.davinci.aerolineas.controller;

import com.davinci.aerolineas.model.Usuario;
import com.davinci.aerolineas.service.UsuarioService;
import com.davinci.aerolineas.utils.Encrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/")

public class LoginController {

	@Autowired
    UsuarioService service;
	



	@RequestMapping(value = {"/","/login" }, method = RequestMethod.GET)
	public String login(ModelMap model) {


		return "login";
	}

    @RequestMapping(value = {"/login" }, method = RequestMethod.POST)
    public String loginPost(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
       String usuarioParam= request.getParameter("usuario");
       String passwordParam= request.getParameter("password");
       String criptedPassword= Encrypt.crypt(passwordParam);
	   Usuario usuario =service.findUser(usuarioParam, criptedPassword);
       String redirect="login";
        if(usuario==null){
            return redirect;
        }
        request.getSession().setAttribute("usuario",usuario);
        if(isAnalista(usuario)){
            redirect= "admin";
        }else{
            redirect="ventas";
        }
        return redirect;

    }

    private Boolean isAnalista(Usuario usuario){
	    return usuario.getRolUsuario().equals("analista");
	}
}
