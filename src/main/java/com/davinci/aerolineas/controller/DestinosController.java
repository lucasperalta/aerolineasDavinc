package com.davinci.aerolineas.controller;

import com.davinci.aerolineas.dto.AvionDto;
import com.davinci.aerolineas.dto.RutaDto;
import com.davinci.aerolineas.model.*;
import com.davinci.aerolineas.service.AvionesService;
import com.davinci.aerolineas.service.DestinoService;
import com.davinci.aerolineas.service.RutaService;
import com.davinci.aerolineas.service.VueloService;
import com.davinci.aerolineas.utils.UsuarioUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class DestinosController {

    @Autowired
    private DestinoService destinoService;




    @RequestMapping(value = {"/destinos"}, method = RequestMethod.GET)
    public String destinos(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isAnalista(usuario)) {
            Destinos destinos = new Destinos();
            model.addAttribute("destinos", destinos);
            return "destinos";
        } else {
            return "login";
        }

    }



    @RequestMapping(value = {"/altaDestino"}, method = RequestMethod.POST)
    public String altaDestino(@Valid Destinos destinos, BindingResult result,
                              HttpServletRequest request, HttpServletResponse response, ModelMap model) {


        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isAnalista(usuario)) {
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


    @RequestMapping(value = {"/updateDestino"}, method = RequestMethod.POST)
    public String updateAviones(@Valid Destinos destinos, BindingResult result,
                                HttpServletRequest request, HttpServletResponse response, ModelMap model) {


        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isAnalista(usuario)) {
            if (result.hasErrors()) {
                return "destinos";
            }
            destinoService.updateDestino(destinos);

            model.addAttribute("success", "Destino " + destinos.getProvincia() + " actualizado Ok");
            return "success";
        } else {
            return "login";
        }


    }


    @RequestMapping(value = { "/edit-{idDestino}-destino" }, method = RequestMethod.GET)
    public String editEmployee(@PathVariable int idDestino, ModelMap model) {
        Destinos destinos = destinoService.getById(idDestino);

        model.addAttribute("destinos", destinos);
        model.addAttribute("edit", true);
        return "destinos";
    }




    /*
	 * This method will delete an employee by it's SSN value.
    */
    @RequestMapping(value = { "/delete-{idDestino}-destino" }, method = RequestMethod.GET)
    public String deleteDestino(@PathVariable int idDestino) {
        destinoService.deleteDestinoById(idDestino);
        return "redirect:/listarDestinos";
    }


    @RequestMapping(value = {"/listarDestinos"}, method = RequestMethod.GET)
    public String listarDestinos(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isAnalista(usuario)) {
            List<Destinos> destinos= destinoService.getAll();


            model.addAttribute("destinos", destinos);
            return "allDestinos";
        } else {
            return "login";
        }

    }



}
