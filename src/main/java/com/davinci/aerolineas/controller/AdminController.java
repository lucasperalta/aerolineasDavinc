package com.davinci.aerolineas.controller;


import com.davinci.aerolineas.model.*;

import com.davinci.aerolineas.utils.UsuarioUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/")
public class AdminController {


    @RequestMapping(value = {"/showAdmin"}, method = RequestMethod.GET)
    public String showAdmin(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isAnalista(usuario)) {

            return "admin";
        } else {
            return "login";
        }

    }



}
