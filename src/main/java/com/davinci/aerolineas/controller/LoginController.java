package com.davinci.aerolineas.controller;

import com.davinci.aerolineas.model.Usuario;
import com.davinci.aerolineas.service.UsuarioService;
import com.davinci.aerolineas.utils.Encrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
    public ModelAndView loginPost(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
       String usuarioParam= request.getParameter("usuario");
       String passwordParam= request.getParameter("password");
       String criptedPassword= Encrypt.crypt(passwordParam);
	   Usuario usuario =service.findUser(usuarioParam, criptedPassword);
       String redirect="login";
        ModelAndView modelo = new ModelAndView(redirect);
        if(usuario==null){
            return modelo;
        }
        request.getSession().setAttribute("usuario",usuario);
        if(isAnalista(usuario)){
            redirect= "admin";
            modelo = new ModelAndView(redirect);

        }else{

            redirect="redirect:/ventas";
            modelo = new ModelAndView(redirect);
        }
        return modelo;

    }

    private Boolean isAnalista(Usuario usuario){
	    return usuario.getRolUsuario().equals("analista");
	}
}
