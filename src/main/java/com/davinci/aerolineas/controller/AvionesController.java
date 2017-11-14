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
public class AvionesController {


    @Autowired
    private AvionesService avionesService;



    @RequestMapping(value = {"/listarAviones"}, method = RequestMethod.GET)
    public String listarAviones(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isAnalista(usuario)) {
            List<Aviones> aviones= avionesService.getAll();
            List<AvionDto>avionesDto= new ArrayList<AvionDto>();
            for (Aviones avion:aviones) {
                AvionDto avionDto = new AvionDto();
                avionDto.setIdAvion(avion.getIdAvion());
                avionDto.setMarca(avion.getMarca());
                avionDto.setMatricula(avion.getMatricula());
                avionDto.setModelo(avion.getModelo());
                avionDto.setButacas(avion.getButacas().size());
                avionesDto.add(avionDto);
            }

            model.addAttribute("aviones", avionesDto);
            return "allAviones";
        } else {
            return "login";
        }

    }





    @RequestMapping(value = {"/aviones"}, method = RequestMethod.GET)
    public String aviones(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isAnalista(usuario)) {
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
        if (UsuarioUtils.isAnalista(usuario)) {
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

    @RequestMapping(value = {"/updateAviones"}, method = RequestMethod.POST)
    public String updateAviones(@Valid AvionDto aviones, BindingResult result,
                              HttpServletRequest request, HttpServletResponse response, ModelMap model) {


        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        if (UsuarioUtils.isAnalista(usuario)) {
            if (result.hasErrors()) {
                return "aviones";
            }
            avionesService.updateAvion(aviones);

            model.addAttribute("success", "Avion " + aviones.getMatricula() + " registrado Ok");
            return "success";
        } else {
            return "login";
        }


    }

    @RequestMapping(value = { "/edit-{idAvion}-avion" }, method = RequestMethod.GET)
    public String editAvion(@PathVariable int idAvion, ModelMap model) {
        Aviones avion = avionesService.getById(idAvion);
        AvionDto avionDto= convertToDto(avion);
       model.addAttribute("aviones", avionDto);
        model.addAttribute("edit", true);
        return "aviones";
    }




    /*
	 * This method will delete an employee by it's SSN value.
	 */
    @RequestMapping(value = { "/delete-{idAvion}-avion" }, method = RequestMethod.GET)
    public String deleteAvion(@PathVariable int idAvion) {
        avionesService.deleteAvionById(idAvion);
        return "redirect:/listarAviones";
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

    private AvionDto convertToDto(Aviones avion) {
        AvionDto avionDto = new AvionDto();
        avionDto.setIdAvion(avion.getIdAvion());
        avionDto.setMarca(avion.getMarca());
        avionDto.setMatricula(avion.getMatricula());
        avionDto.setModelo(avion.getModelo());
        avionDto.setButacas(avion.getButacas().size());
        return avionDto;
    }
}
