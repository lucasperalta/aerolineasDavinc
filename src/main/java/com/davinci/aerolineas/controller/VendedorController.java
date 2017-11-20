package com.davinci.aerolineas.controller;

import com.davinci.aerolineas.dto.AvionDto;
import com.davinci.aerolineas.dto.RutaDto;
import com.davinci.aerolineas.model.*;
import com.davinci.aerolineas.service.*;
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
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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

    @Autowired
    private PasajesService pasajesService;

    @RequestMapping(value = {"/ventas" }, method = RequestMethod.GET)
    public String ventas(HttpServletRequest request, HttpServletResponse response,ModelMap model) {

        List<Vuelo> vuelos = vueloService.getVuelosHabilitados();
        model.addAttribute("vuelos", vuelos);
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isVendedor(usuario)) {
            return "ventas";
        }else {
            return "login";
        }

    }

    @RequestMapping(value = {"/reservarVuelo" }, method = RequestMethod.POST)
    public String reservarButacas(  HttpServletRequest request, HttpServletResponse response, ModelMap model) {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isVendedor(usuario)) {

             int idVuelo= Integer.parseInt(request.getParameter("vuelos"));
             String costoVuelo=request.getParameter("costo");

            Vuelo vuelo=  vueloService.getById(idVuelo);
           List<Butacas>butacasDelAvion=  vuelo.getAvion().getButacas();

        List<Butacas> butacasDisponibles =butacasDelAvion.stream()
                .filter(butaca->butaca.getDisponibilidad().equals("SI"))
                .collect(Collectors.toList());

            List<Integer> listaIdsButacasDisponibles = new ArrayList<>();
            for (Butacas butaca:butacasDisponibles) {
                listaIdsButacasDisponibles.add(butaca.getNumeroButaca());
            }
            model.addAttribute("idVuelo", idVuelo);
            model.addAttribute("costoVuelo", costoVuelo);
            model.addAttribute("butacasDisponibles", listaIdsButacasDisponibles);

         return "altacliente";
        }else{
            return "login";
        }


    }

    @RequestMapping(value = {"/savePasajero" }, method = RequestMethod.POST)
    public String savePasajero(  HttpServletRequest request, HttpServletResponse response, ModelMap model) {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isVendedor(usuario)) {

         int idVuelo= Integer.parseInt(request.getParameter("idVuelo"));
         String nombre = request.getParameter("nombre");
         String apellido = request.getParameter("apellido");
         String dni = request.getParameter("dni");
         String butaca = request.getParameter("butaca");
         String precio = request.getParameter("precio");

         Vuelo vuelo=  vueloService.getById(idVuelo);
         Pasaje pasaje = new Pasaje();
         pasaje.setNombreCliente(nombre);
         pasaje.setApellidoCliente(apellido);
         pasaje.setButaca(Integer.parseInt(butaca));
         pasaje.setDniCliente(Integer.parseInt(dni));
         pasaje.setVuelo(vuelo);
         pasajesService.savePasaje(pasaje);

            return "redirect:/ventas";

        }else{
            return "login";
        }

    }

    @RequestMapping(value = {"/cerrarVuelo" }, method = RequestMethod.POST)
    public String cerrarVuelo(  HttpServletRequest request, HttpServletResponse response, ModelMap model) {

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isVendedor(usuario)) {

            int idVuelo= Integer.parseInt(request.getParameter("idVuelo"));

            Vuelo vuelo=  vueloService.getById(idVuelo);
            vuelo.setVueloHabilitado(false);
            vueloService.updateVuelo(vuelo);

            return "redirect:/ventas";

        }else{
            return "login";
        }

    }


}
