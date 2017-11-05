package com.davinci.aerolineas.controller;

import com.davinci.aerolineas.model.Destinos;
import com.davinci.aerolineas.model.Employee;
import com.davinci.aerolineas.model.Usuario;
import com.davinci.aerolineas.service.DestinoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.Locale;
@Controller
@RequestMapping("/")
public class AdminController {

    @Autowired
    private DestinoService destinoService;

    @RequestMapping(value = {"/destinos"}, method = RequestMethod.GET)
    public String destinos(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (isAnalista(usuario)) {
            Destinos destinos = new Destinos();
            model.addAttribute("destinos", destinos);
            return "destinos";
        } else {
            return "login";
        }

    }

    @RequestMapping(value = {"/showAdmin"}, method = RequestMethod.GET)
    public String showAdmin(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (isAnalista(usuario)) {

            return "admin";
        } else {
            return "login";
        }

    }

    @RequestMapping(value = {"/altaDestino"}, method = RequestMethod.POST)
    public String altaDestino(@Valid Destinos destinos, BindingResult result,
                              HttpServletRequest request, HttpServletResponse response, ModelMap model) {


        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (isAnalista(usuario)) {
            if (result.hasErrors()) {
                return "destinos";
            }

            destinoService.saveDestino(destinos);

            model.addAttribute("success", "Destino " + destinos.getProvincia() + " registrado Ok");
            return "success";
        } else {
            return "login";
        }


    }


    private Boolean isAnalista(Usuario usuario) {

        if (usuario != null && usuario.getRolUsuario().equals("analista")) {
            return true;
        }
        return false;
    }

}
