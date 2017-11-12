package com.davinci.aerolineas.controller;

import com.davinci.aerolineas.dto.AvionDto;
import com.davinci.aerolineas.dto.RutaDto;
import com.davinci.aerolineas.model.*;
import com.davinci.aerolineas.service.AvionesService;
import com.davinci.aerolineas.service.DestinoService;
import com.davinci.aerolineas.service.RutaService;
import com.davinci.aerolineas.service.VueloService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class VendedorController {

    @Autowired
    private DestinoService destinoService;
    @Autowired
    private AvionesService avionesService;
    @Autowired
    private RutaService rutaService;
    @Autowired
    private VueloService vueloService;

    @RequestMapping(value = {"/ventas" }, method = RequestMethod.GET)
    public String ventas(ModelMap model) {


        return "altacliente";
    }




}
