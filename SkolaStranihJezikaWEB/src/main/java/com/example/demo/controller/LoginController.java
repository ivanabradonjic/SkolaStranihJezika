package com.example.demo.controller;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.repository.OsobaRepository;
import com.example.demo.repository.UlogaRepository;

import model.Osoba;
import model.Uloga;

@Controller
@RequestMapping(value = "/auth")
public class LoginController {
	@Autowired
	UlogaRepository ur;
	@Autowired
	OsobaRepository or;

	@RequestMapping(value = "/loginUser")
	public String login() {
		return "login";
	}

	@RequestMapping(value = "registerUser", method = RequestMethod.GET)
	public String newUser(Model model) {
		Osoba osoba = new Osoba();
		model.addAttribute("user", osoba);
		return "register";
	}

	@RequestMapping(value = "saveUser", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") @Valid Osoba o, Model m,  BindingResult result) {
		if(result.hasErrors()) {
			m.addAttribute("poruka", "Neuspela registracija");
			return "register";
		}
		Osoba pronadjenaOsoba = or.findByEmail(o.getEmail());
		
		 if (pronadjenaOsoba == null && o.getIme()!=null && o.getPrezime()!=null && o.getEmail()!=null && o.getPassword()!=null && o.getJmbg()!=null) {
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			o.setPassword(passwordEncoder.encode(o.getPassword()));

			Uloga uloga = ur.findById(2).get();

			o.setUloga(uloga);
			uloga.addOsoba(o);

			Osoba nova = or.save(o);
			m.addAttribute("savedOsoba", nova);
			return "login";
		 
		}else {
			m.addAttribute("poruka", "Neuspela registracija");
			return "register";
		}

	}

	@ResponseBody
	@RequestMapping(value = "/pocetna", method = RequestMethod.GET)
	public void pocetna(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.err.println("--------------------------------------------------------------------------------");
		Principal principal = request.getUserPrincipal();
		String email = principal.getName();
		Osoba o = or.findByEmail(email);
		request.getSession().setAttribute("logovanKorisnik", o);
	//	if(o.getUloga().getNaziv().equalsIgnoreCase("CLAN")) {
				
		
	//	}else {
	   request.getRequestDispatcher("/index.jsp").forward(request, response);
			
		//}

	}
	
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout() {
		System.err.println("-------------------------------------------------------------------------");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (auth != null) {
			SecurityContextHolder.getContext().setAuthentication(null);
		}

		return "redirect:/auth/loginUser";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
		simpleDateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(simpleDateFormat, true));
	}

}
