package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the Profesor database table.
 * 
 */
@Entity
@NamedQuery(name="Profesor.findAll", query="SELECT p FROM Profesor p")
public class Profesor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idProfesor;

	private String adresa;

	@Temporal(TemporalType.DATE)
	private Date datumRodjenja;

	private String email;

	private String ime;

	private String jmbg;

	private double plata;

	private String prezime;

	private String telefon;

	//bi-directional many-to-one association to Kurs
	@OneToMany(mappedBy="profesor")
	private List<Kurs> kurs;

	public Profesor() {
	}

	public int getIdProfesor() {
		return this.idProfesor;
	}

	public void setIdProfesor(int idProfesor) {
		this.idProfesor = idProfesor;
	}

	public String getAdresa() {
		return this.adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}

	public Date getDatumRodjenja() {
		return this.datumRodjenja;
	}

	public void setDatumRodjenja(Date datumRodjenja) {
		this.datumRodjenja = datumRodjenja;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIme() {
		return this.ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public String getJmbg() {
		return this.jmbg;
	}

	public void setJmbg(String jmbg) {
		this.jmbg = jmbg;
	}

	public double getPlata() {
		return this.plata;
	}

	public void setPlata(double plata) {
		this.plata = plata;
	}

	public String getPrezime() {
		return this.prezime;
	}

	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}

	public String getTelefon() {
		return this.telefon;
	}

	public void setTelefon(String telefon) {
		this.telefon = telefon;
	}

	public List<Kurs> getKurs() {
		return this.kurs;
	}

	public void setKurs(List<Kurs> kurs) {
		this.kurs = kurs;
	}

	public Kurs addKur(Kurs kur) {
		getKurs().add(kur);
		kur.setProfesor(this);

		return kur;
	}

	public Kurs removeKur(Kurs kur) {
		getKurs().remove(kur);
		kur.setProfesor(null);

		return kur;
	}

}