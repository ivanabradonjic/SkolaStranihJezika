package com.example.demo.controller;

import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.repository.GrupaRepository;
import com.example.demo.repository.JezikRepository;
import com.example.demo.repository.KursRepository;
import com.example.demo.repository.NivoRepository;
import com.example.demo.repository.OsobaRepository;
import com.example.demo.repository.PonudaRepository;
import com.example.demo.repository.ProfesorRepository;
import com.example.demo.repository.UlogaRepository;
import com.example.demo.repository.VrstaKursaRepository;

import model.Grupa;
import model.Jezik;
import model.Kurs;
import model.Nivo;
import model.Osoba;
import model.Ponuda;
import model.Profesor;
import model.Uloga;
import model.VrstaKursa;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Controller
@RequestMapping(value="/adminKontroler")
public class AdminController {
	
	@Autowired
	JezikRepository jr;
	
	@Autowired
	VrstaKursaRepository vr;
	
	@Autowired
	GrupaRepository gr;
	
	@Autowired
	NivoRepository nr;
	
	@Autowired
	KursRepository kr;
	
	@Autowired
	ProfesorRepository pr;
	
	@Autowired
	UlogaRepository ur;
	
	@Autowired
	OsobaRepository or;
	
	@Autowired
	PonudaRepository ponr;
	
	@RequestMapping(value="/sviJezici", method=RequestMethod.GET)
	public String sviJezici(HttpServletRequest requset) {
		List<Jezik> jezici = jr.findAll();
		requset.getSession().setAttribute("sviJezici", jezici);
		return "admin/PrikazKurseva";
	}
	
	@ModelAttribute("kurs")
	public Kurs getKurs() {
		return new Kurs();
	}
	
	@ModelAttribute("osoba")
	public Osoba getOsoba() {
		return new Osoba();
	}
	
	
	@ModelAttribute("vrsteKurseva")
	public List<VrstaKursa> getVrsteKurseva(){
		return vr.findAll();
	}
	
	@ModelAttribute("grupe")
	public List<Grupa> getGrupe(){
		return gr.findAll();
	}
	
	@ModelAttribute("nivoi")
	public List<Nivo> getNivoi(){
		return nr.findAll();
	}
	
	@ModelAttribute("profesori")
	public List<Profesor> getProfesor(){
		return pr.findAll();
	}
	
	@ModelAttribute("uloge")
	public List<Uloga> getUloge(){
		return ur.findAll();
	}
	@ModelAttribute("jezici")
	public List<Jezik> getJezici(){
		return jr.findAll();
	}
	
	@RequestMapping(value="/unosKursa", method=RequestMethod.GET)
	public String unosKursa() {
		return "admin/UnosKursa";
	}
	
	@RequestMapping(value="/unosProfesora", method=RequestMethod.GET)
	public String unosProfesora() {
		return "admin/UnosProfesora";
	}
	
	@RequestMapping(value="/saveJezik", method=RequestMethod.POST)
	public String saveJezik(Jezik j, Model m, HttpServletRequest request) {
		jr.save(j);
		m.addAttribute("jezikSaved", j);
		m.addAttribute("poruka", "Jezik je uspesno sacuvan.");
		return "admin/UnosNovihPodataka";
	}
	
	@RequestMapping(value="/saveVrstaKursa", method=RequestMethod.POST)
	public String saveJezik(VrstaKursa vk, Model m) {	
		vr.save(vk);
		m.addAttribute("vrstaSaved", vk);
		m.addAttribute("poruka1", "Vrsta kursa uspesno sacuvana");
		return "admin/UnosNovihPodataka";
	}
	
	@RequestMapping(value="/saveKurs", method=RequestMethod.POST)
	public String saveKurs(@ModelAttribute("kurs") Kurs kurs, Model m) {
		Kurs k = kr.save(kurs);
		m.addAttribute("poruka", "Kurs je uspesno sacuvan");
		m.addAttribute("kursSaved", k);
		return "redirect:/adminKontroler/sviJezici";
	}
	
	@RequestMapping(value="/saveProfesor", method=RequestMethod.POST)
	public String saveOsoba(String ime, String prezime, String jmbg, Date datumRodjenja, String adresa, 
								String telefon, String email, String plata, String password, Model m) {

		Profesor pronadjen = pr.findByEmail(email);
	if(pronadjen==null && ime!=null && prezime!=null && jmbg!=null && datumRodjenja!=null && adresa!=null && telefon!=null && email!=null && plata!=null && password!=null) {
		
		Profesor p = new Profesor();
		p.setIme(ime);
		p.setPrezime(prezime);
		p.setJmbg(jmbg);
		p.setDatumRodjenja(datumRodjenja);
		p.setAdresa(adresa);
		p.setTelefon(telefon);
		p.setEmail(email);
		Double pl = Double.parseDouble(plata);
		p.setPlata(pl);
		pr.save(p);
		
		Osoba o = new Osoba();
		o.setIme(ime);
		o.setPrezime(prezime);
		o.setEmail(email);
		o.setPassword(password);
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	    o.setPassword(passwordEncoder.encode(o.getPassword()));
	    o.setJmbg(jmbg);
		o.setDatumRodjenja(datumRodjenja);
		o.setBrojTel(telefon);
		Uloga u = ur.findByNaziv("PROFESOR");
		o.setUloga(u);
		or.save(o);
		
		m.addAttribute("profesorSaved", p);
		m.addAttribute("osobaSaved", o);
		
		return "index";
		
	}else {
		m.addAttribute("poruka", "Neuspesno dodavanje zaposlenog. Pokusajte ponovo.");
		return "admin/UnosProfesora";
	}
	}
	
	@RequestMapping(value="/sviProfesori", method=RequestMethod.GET)
	public String sviProfesori(Model m) {
		List<Profesor> svi = pr.findAll();
		m.addAttribute("sviProfesori", svi);
		return "admin/PrikazProfesora";
	}
	
	@RequestMapping(value="/SviProfesori.pdf", method=RequestMethod.GET)
	public void showReport(HttpServletResponse response) throws Exception{
		response.setContentType("text/html");
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(pr.findAll());
		InputStream inputStream = this.getClass().getResourceAsStream("/jasperreports/SviProfesori.jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("imeSkole", "Skola stranih jezika Sfera");
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
		inputStream.close();

		response.setContentType("application/x-download");
		response.addHeader("Content-disposition", "attachment; filename=SviProfesori.pdf");
		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint,out);
	}
	
	
	
	
	@RequestMapping(value="/prikazKursevaZaJezik", method=RequestMethod.GET)
	public String prikazKursevaZaJezik(int idJezik, Model m) {
		List<Kurs> kursevi = kr.findByJezik(idJezik);
		m.addAttribute("kursevi", kursevi);
		return "admin/PrikazKurseva";
	}
	
	@RequestMapping(value="/izmenaKursa", method=RequestMethod.GET)
	public String izmenaKursa(int idKurs, Model m, HttpServletRequest request) {
		Kurs k = kr.findById(idKurs).get();
		request.getSession().setAttribute("izabraniKurs", k);
		m.addAttribute("poruka", "Izabrali ste kurs za izmenu");
		return "admin/IzmenaKursa";
		
	}
	
	@RequestMapping(value="/promeni", method=RequestMethod.POST)
	public String promeni(Integer idProfesor, String novaCena, Model m, HttpServletRequest request) {
	//	Kurs k = (Kurs)m.getAttribute("izabraniKurs");
		Kurs k = (Kurs) request.getSession().getAttribute("izabraniKurs");
		if(idProfesor != null) {
			Profesor noviProfesor = pr.findById(idProfesor).get();
			k.setProfesor(noviProfesor);
		}
		
		if(novaCena != null) {
			double c = Double.parseDouble(novaCena);
			k.setCena(c);
		}
		Kurs novi = kr.save(k);
		m.addAttribute("poruka", "Uspesno ste promenili podatke o kursu.");
		m.addAttribute("izmenjenKurs", novi);
		return "admin/PrikazKurseva";
		
	}
	
	@RequestMapping(value="/aktiviraj", method=RequestMethod.GET)
	public String aktiviraj(int idKurs, Model m, HttpServletRequest request) {
		Kurs k = kr.findById(idKurs).get();
		request.getSession().setAttribute("izabraniKurs", k);
		m.addAttribute("poruka", "Izabrali ste kurs za izmenu");
		return "admin/DodajUPonudu";
		
	}
	
	@RequestMapping(value="/savePonuda", method=RequestMethod.POST)
	public String savePonuda(Date pocetakDatum,Date krajDatum, String maxOsoba,Date rok , Model m, HttpServletRequest request) {
		Kurs k = (Kurs) request.getSession().getAttribute("izabraniKurs");
		Ponuda p = new Ponuda();
		p.setKurs(k);
		p.setPocetakDatum(pocetakDatum);
		p.setKrajDatum(krajDatum);
		int max = Integer.parseInt(maxOsoba);
		p.setMaxOsoba(max);
		p.setRok(rok);
		Ponuda nova = ponr.save(p);
		m.addAttribute("poruka", "Uspesno ste dodali kurs u ponudu.");
		m.addAttribute("savedPonuda",nova );
		return "redirect:/adminKontroler/prikaziPonudu";
		
	}
	
	@RequestMapping(value="/prikaziPonudu", method=RequestMethod.GET)
	public String prikaziPonudu(HttpServletRequest request) {
		List<Ponuda> sve = ponr.findAll();
		request.getSession().setAttribute("ponude", sve);
		return "admin/PonudaKurseva";
	}
	
	@RequestMapping(value="/azuriraj", method=RequestMethod.GET)
	public String azuriraj(HttpServletRequest request) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		try {
			date= sdf.parse(sdf.format(date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ponr.deletePonudaByKrajDatum(date);
		List<Ponuda> nove = ponr.findAll();
		request.getSession().setAttribute("ponude", nove);
		return "admin/PonudaKurseva";
	}
	
	@RequestMapping(value="/dodajUPonudu", method=RequestMethod.GET)
	public String dodaj(HttpServletRequest request) {
		return "redirect:/adminKontroler/sviJezici";
	}
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

	
	
	
	
}
