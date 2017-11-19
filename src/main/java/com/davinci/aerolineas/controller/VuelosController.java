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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/")
public class VuelosController {


    @Autowired
    private AvionesService avionesService;
    @Autowired
    private RutaService rutaService;
    @Autowired
    private VueloService vueloService;






    @RequestMapping(value = {"/vuelos"}, method = RequestMethod.GET)
    public String vuelos(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isAnalista(usuario)) {
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
        if (UsuarioUtils.isAnalista(usuario)) {

            int  avionId= Integer.parseInt(request.getParameter("avion"));

            if(avionId==0){
                List<Ruta> rutas= rutaService.getAll();
                List<Aviones> aviones = avionesService.getAll();

                model.addAttribute("aviones", aviones);
                model.addAttribute("rutas", rutas);
                model.addAttribute("error", "Debe selecionar un avion");
                return "vuelos";
            }

            int  rutaid= Integer.parseInt(request.getParameter("ruta"));
            if(rutaid==0) {
                List<Ruta> rutas= rutaService.getAll();
                List<Aviones> aviones = avionesService.getAll();

                model.addAttribute("aviones", aviones);
                model.addAttribute("rutas", rutas);

                model.addAttribute("error", "Debe selecionar una ruta");
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


    @RequestMapping(value = {"/listarVuelos"}, method = RequestMethod.GET)
    public String listarVuelos(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isAnalista(usuario)) {
            List<Vuelo> vuelos= vueloService.getAll();


            model.addAttribute("vuelos", vuelos);
            return "allVuelos";
        } else {
            return "login";
        }

    }


    @RequestMapping(value = {"/updateVuelos"}, method = RequestMethod.POST)
    public String updateVuelos( HttpServletRequest request, HttpServletResponse response, ModelMap model) {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isAnalista(usuario)) {

            int  avionId= Integer.parseInt(request.getParameter("avion"));

            if(avionId==0){
                List<Ruta> rutas= rutaService.getAll();
                List<Aviones> aviones = avionesService.getAll();

                model.addAttribute("aviones", aviones);
                model.addAttribute("rutas", rutas);
                model.addAttribute("error", "Debe selecionar un avion");
                return "vuelos";
            }

            int  rutaid= Integer.parseInt(request.getParameter("ruta"));
            if(rutaid==0) {
                List<Ruta> rutas= rutaService.getAll();
                List<Aviones> aviones = avionesService.getAll();

                model.addAttribute("aviones", aviones);
                model.addAttribute("rutas", rutas);

                model.addAttribute("error", "Debe selecionar una ruta");
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
            int idVuelo= Integer.parseInt(request.getParameter("idVuelo"));

            Vuelo vuelo = new Vuelo();
            vuelo.setIdVuelo(idVuelo);
            vuelo.setAvion(avion);
            vuelo.setRuta(ruta);
            vuelo.setCostoVuelo(costoVuelo);
            vueloService.updateVuelo(vuelo);

            model.addAttribute("success", "Vuelo " + vuelo.getIdVuelo() + " registrado Ok");
            return "success";
        } else {
            return "login";
        }


    }

    @RequestMapping(value = { "/edit-{idVuelo}-vuelo" }, method = RequestMethod.GET)
    public String editAvion(@PathVariable int idVuelo, ModelMap model) {
        List<Ruta> rutas= rutaService.getAll();
        List<Aviones> aviones = avionesService.getAll();
        Vuelo vuelo =vueloService.getById(idVuelo);
        model.addAttribute("idVuelo", vuelo.getIdVuelo());
        model.addAttribute("costoVuelo", vuelo.getCostoVuelo());
        model.addAttribute("aviones", aviones);
        model.addAttribute("rutas", rutas);
        model.addAttribute("avionSeleccionado", vuelo.getAvion().getIdAvion());
        model.addAttribute("rutaSeleccionada", vuelo.getRuta().getIdRuta());
        model.addAttribute("edit", true);
        return "vuelos";
    }




    /*
	 * This method will delete an employee by it's SSN value.
	 */
    @RequestMapping(value = { "/delete-{idVuelo}-vuelo" }, method = RequestMethod.GET)
    public String deleteAvion(@PathVariable int idVuelo) {
        vueloService.deleteVueloById(idVuelo);
        return "redirect:/listarVuelos";
    }


}
