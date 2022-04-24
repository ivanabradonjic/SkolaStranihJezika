package com.example.demo.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.repository.JezikRepository;
import com.example.demo.repository.KategorijaRepository;
import com.example.demo.repository.KursRepository;
import com.example.demo.repository.NivoRepository;
import com.example.demo.repository.OsobaRepository;
import com.example.demo.repository.PonudaRepository;
import com.example.demo.repository.UpisRepository;

import model.Jezik;
import model.Kategorija;
import model.Kurs;
import model.Nivo;
import model.Osoba;
import model.Ponuda;
import model.Upis;

@Controller
@RequestMapping(value = "/clanKontroler")
public class ClanKontroler {
	@Autowired
	JezikRepository jr;

	@Autowired
	KursRepository kr;

	@Autowired
	KategorijaRepository katr;

	@Autowired
	NivoRepository nr;

	@Autowired
	OsobaRepository or;

	@Autowired
	UpisRepository upr;

	@Autowired
	PonudaRepository ponr;

	@RequestMapping(value = "/sviJezici", method = RequestMethod.GET)
	public String sviJezici(HttpServletRequest request) {
		List<Jezik> jezici = jr.findAll();
		request.getSession().setAttribute("sviJezici", jezici);
		return "clan/Cenovnik";
	}

	@ModelAttribute("upis")
	public Upis getUpis() {
		return new Upis();
	}

	@ModelAttribute("kategorije")
	public List<Kategorija> getKategorije() {
		return katr.findAll();
	}

	@ModelAttribute("nivoi")
	public List<Nivo> getNivoi() {
		return nr.findAll();
	}

	@RequestMapping(value = "/prikazKursevaZaJezik", method = RequestMethod.GET)
	public String prikazKursevaZaJezik(int idJezik, Model m) {
		List<Kurs> kursevi = kr.findByJezik(idJezik);
		m.addAttribute("kursevi", kursevi);
		return "clan/Cenovnik";
	}
	

	
	@RequestMapping(value = "/prikaziAktuelneKurseve", method = RequestMethod.GET)
	public String prikaziPonudu(HttpServletRequest request, HttpServletResponse response) {
		List<Ponuda> svi = ponr.findAll();
		request.getSession().setAttribute("aktuelniKursevi", svi);
		return "clan/PonudaKurseva";
	}

	@RequestMapping(value = "/prijavaNaKurs", method = RequestMethod.GET)
	public String prijavaNaKurs(int idPonuda, Model m, HttpServletRequest request) {

		/*
		 * Principal principal = request.getUserPrincipal(); String email =
		 * principal.getName(); Osoba o = or.findByEmail(email);
		 */
		Ponuda p = ponr.findById(idPonuda).get();
		Kurs k = p.getKurs();

		int brUpisanihOsoba = upr.countByKurs(k);

		Date datumUpisa = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		try {
			datumUpisa = sdf.parse(sdf.format(datumUpisa));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (brUpisanihOsoba < p.getMaxOsoba() && datumUpisa.compareTo(p.getRok()) < 0) {
			request.getSession().setAttribute("izabraniKurs", k);
			request.getSession().setAttribute("datumUpisa", datumUpisa);
			m.addAttribute("poruka1", "Izabrali ste zeljeni kurs. Popunite naredne podatke");
			return "clan/Upis";
		} else if (brUpisanihOsoba >= p.getMaxOsoba()) {
			m.addAttribute("poruka2", "Zao nam je, nema slobodnih mesta za izabrani kurs.");
			return "clan/PonudaKurseva";
		} else {
			m.addAttribute("poruka3", "Zao nam je, prijava je istekla.");
			return "clan/PonudaKurseva";
		}
	}

	@RequestMapping(value = "/prijaviSe", method = RequestMethod.POST)
	public String prijava(@ModelAttribute("upis") Upis upis, Model m, HttpServletRequest request,
			RedirectAttributes redirAttrs) {
		Principal principal = request.getUserPrincipal();
		String email = principal.getName();

		Osoba o = or.findByEmail(email);

		Kurs k = (Kurs) request.getSession().getAttribute("izabraniKurs");
		Date datumUpisa = (Date) request.getSession().getAttribute("datumUpisa");

		List<Upis> upisani = upr.findByOsobaAndKurs(o, k);

		if (upisani.size() == 0) {
			upis.setOsoba(o);
			upis.setKurs(k);
			upis.setDatumUpisa(datumUpisa);
			upr.save(upis);

			m.addAttribute("savedUpis", upis);
			return "index";
		} else {
			m.addAttribute("poruka4", "Vec ste se prijavili na kurs");
			return "clan/PonudaKurseva";
		}

	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		sdf.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

}
