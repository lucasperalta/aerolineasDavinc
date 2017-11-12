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
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
@Controller
@RequestMapping("/")
public class AdminController {

    @Autowired
    private DestinoService destinoService;
    @Autowired
    private AvionesService avionesService;
    @Autowired
    private RutaService rutaService;
    @Autowired
    private VueloService vueloService;



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

    @RequestMapping(value = {"/rutas"}, method = RequestMethod.GET)
    public String rutas(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (isAnalista(usuario)) {
           List<Destinos> destinos= destinoService.getAll();
            RutaDto ruta = new RutaDto();



            model.addAttribute("destinos", destinos);
            return "rutas";
        } else {
            return "login";
        }

    }

    @RequestMapping(value = {"/vuelos"}, method = RequestMethod.GET)
    public String vuelos(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (isAnalista(usuario)) {
            List<Ruta> rutas= rutaService.getAll();
            List<Aviones> aviones = avionesService.getAll();

            model.addAttribute("aviones", aviones);
            model.addAttribute("rutas", rutas);
            return "vuelos";
        } else {
            return "login";
        }

    }


    @RequestMapping(value = {"/altaVuelos"}, method = RequestMethod.POST)
    public String altaVuelos(   HttpServletRequest request, HttpServletResponse response, ModelMap model) {


        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (isAnalista(usuario)) {

            int  avionId= Integer.parseInt(request.getParameter("avion"));

            if(avionId==0){
                List<Ruta> rutas= rutaService.getAll();
                List<Aviones> aviones = avionesService.getAll();

                model.addAttribute("aviones", aviones);
                model.addAttribute("rutas", rutas);
                model.addAttribute("error", "Debe selecionar una Ruta");
                return "vuelos";
            }

            int  rutaid= Integer.parseInt(request.getParameter("ruta"));
            if(rutaid==0) {
                List<Ruta> rutas= rutaService.getAll();
                List<Aviones> aviones = avionesService.getAll();

                model.addAttribute("aviones", aviones);
                model.addAttribute("rutas", rutas);

                model.addAttribute("error", "Debe selecionar un avion");
                return "vuelos";
            }

            float  costoVuelo= Float.parseFloat(request.getParameter("costoVuelo"));
            if(costoVuelo==0) {
                List<Ruta> rutas= rutaService.getAll();
                List<Aviones> aviones = avionesService.getAll();

                model.addAttribute("aviones", aviones);
                model.addAttribute("rutas", rutas);

                model.addAttribute("error", "Debe Ingresar un costo");
                return "vuelos";
            }

            Aviones avion= avionesService.getById(avionId);
            Ruta ruta= rutaService.getById(rutaid);

            Vuelo vuelo = new Vuelo();
            vuelo.setAvion(avion);
            vuelo.setRuta(ruta);
            vuelo.setCostoVuelo(costoVuelo);
            vueloService.saveVuelo(vuelo);
            model.addAttribute("success", "Vuelo " + vuelo.getIdVuelo() + " registrado Ok");
            return "success";
        } else {
            return "login";
        }


    }




    @RequestMapping(value = {"/altaRutas"}, method = RequestMethod.POST)
    public String altaDestino(@Valid RutaDto rutas, BindingResult result,
                              HttpServletRequest request, HttpServletResponse response, ModelMap model) {


        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (isAnalista(usuario)) {
            if (result.hasErrors()) {
                return "rutas";
            }

            int  origenId= Integer.parseInt(request.getParameter("origen"));

            if(origenId==0){
                List<Destinos> destinos= destinoService.getAll();
                model.addAttribute("destinos", destinos);
                model.addAttribute("error", "Debe selecionar un origen");
                return "rutas";
            }

            int  destinoId= Integer.parseInt(request.getParameter("destino"));
            if(destinoId==0) {
                List<Destinos> destinos= destinoService.getAll();
                model.addAttribute("destinos", destinos);

                model.addAttribute("error", "Debe selecionar un destino");
                return "rutas";
            }

            Ruta ruta = new Ruta();

           Destinos destinoOrigen= destinoService.getById(origenId);
            Destinos destinoLlegada= destinoService.getById(destinoId);

            ruta.setDestinoPartida(destinoOrigen);
            ruta.setDestinoLlegada(destinoLlegada);
            rutaService.saveRuta(ruta);
            model.addAttribute("success", "Ruta " + ruta.getIdRuta() + " registrado Ok");
            return "success";
        } else {
            return "login";
        }


    }


    @RequestMapping(value = {"/aviones"}, method = RequestMethod.GET)
    public String aviones(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (isAnalista(usuario)) {
            AvionDto aviones = new AvionDto();
            model.addAttribute("aviones", aviones);
            return "aviones";
        } else {
            return "login";
        }

    }

    @RequestMapping(value = {"/altaAviones"}, method = RequestMethod.POST)
    public String altaAviones(@Valid AvionDto aviones, BindingResult result,
                              HttpServletRequest request, HttpServletResponse response, ModelMap model) {


        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (isAnalista(usuario)) {
            if (result.hasErrors()) {
                return "aviones";
            }

            Aviones avion= convertToModel(aviones);

          avionesService.saveAviones(avion);

            model.addAttribute("success", "Avion " + aviones.getMatricula() + " registrado Ok");
            return "success";
        } else {
            return "login";
        }


    }

    private Aviones convertToModel(AvionDto aviones) {
        Aviones avion = new Aviones();
        avion.setMarca(aviones.getMarca());
        avion.setMatricula(aviones.getMatricula());
        avion.setModelo(aviones.getModelo());
        List<Butacas> butacas = new ArrayList<Butacas>();


        for (int i = 1; i <= aviones.getButacas(); i++) {
            Butacas butaca = new Butacas();
            butaca.setDisponibilidad("SI");
            butaca.setNumeroButaca(i);
            butaca.setAvion(avion);
            butacas.add(butaca);


        }

        avion.setButacas(butacas);
        return avion;
    }

    private Boolean isAnalista(Usuario usuario) {

        if (usuario != null && usuario.getRolUsuario().equals("analista")) {
            return true;
        }
        return false;
    }

}
