package com.davinci.aerolineas.controller;

import com.davinci.aerolineas.model.Employee;
import com.davinci.aerolineas.service.EmployeeService;
import com.davinci.aerolineas.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;
import java.util.Locale;

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
    public String loginPost(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

    System.out.println("holas");
        return "admin";
    }
}
