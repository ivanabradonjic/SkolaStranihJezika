package com.example.demo.controller;

import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.repository.KursRepository;
import com.example.demo.repository.OsobaRepository;
import com.example.demo.repository.UpisRepository;

import model.Kurs;
import model.Osoba;
import model.Upis;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Controller
@RequestMapping(value="/profesorKontroler")
public class ProfesorController {
	@Autowired
	OsobaRepository or;
	
	@Autowired
	KursRepository kr;
	
	@Autowired
	UpisRepository ur;
	
	@RequestMapping(value = "/kurseviProfesora", method = RequestMethod.GET)
	public String kurseviProfesora(HttpServletRequest request, Model m) {
		 Principal principal = request.getUserPrincipal();
		 String usernameKorisnika = principal.getName();
		 
		 Osoba o = or.findByEmail(usernameKorisnika);
		 
		 Integer idP = o.getIdOsoba();
		 
		 List<Kurs> kursevi = kr.findByProfesor(idP);
		 m.addAttribute("kursevi", kursevi);
		 	
		return "profesor/ProfKursevi";
	}
	
	@RequestMapping(value = "/clanoviKursa", method = RequestMethod.GET)
	public void showReport(Integer idKurs, HttpServletResponse response) throws Exception{
		response.setContentType("text/html");
		Kurs k = kr.findById(idKurs).get();
		List<Upis> upisani = ur.findByKurs(k);
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(upisani);
		InputStream inputStream = this.getClass().getResourceAsStream("/jasperreports/ClanoviKursa.jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("vrstaKursa", k.getVrstaKursa().getNaziv());
		params.put("jezikKursa", k.getJezik().getNaziv());
		params.put("grupa", k.getGrupa().getTip());
		params.put("fond", k.getOpis());
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
		inputStream.close();

		response.setContentType("application/x-download");
		response.addHeader("Content-disposition", "attachment; filename=ClanoviKursa.pdf");
		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint,out);
	}
}
