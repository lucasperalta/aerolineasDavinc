package com.davinci.aerolineas.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/")
public class RutasController {

    @Autowired
    private DestinoService destinoService;
 
    @Autowired
    private RutaService rutaService;







    @RequestMapping(value = {"/rutas"}, method = RequestMethod.GET)
    public String rutas(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isAnalista(usuario)) {
           List<Destinos> destinos= destinoService.getAll();
            RutaDto ruta = new RutaDto();



            model.addAttribute("destinos", destinos);
            return "rutas";
        } else {
            return "login";
        }

    }






    @RequestMapping(value = {"/altaRutas"}, method = RequestMethod.POST)
    public String altaDestino(@Valid RutaDto rutas, BindingResult result,
                              HttpServletRequest request, HttpServletResponse response, ModelMap model) {


        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isAnalista(usuario)) {
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

    @RequestMapping(value = {"/listarRutas"}, method = RequestMethod.GET)
    public String listarRutas(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isAnalista(usuario)) {
            List<Ruta> rutas= rutaService.getAll();


            model.addAttribute("rutas", rutas);
            return "allRutas";
        } else {
            return "login";
        }

    }
}
