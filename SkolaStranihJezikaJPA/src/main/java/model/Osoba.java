package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the Osoba database table.
 * 
 */
@Entity
@NamedQuery(name="Osoba.findAll", query="SELECT o FROM Osoba o")
public class Osoba implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idOsoba;

	private String brojTel;

	@Temporal(TemporalType.DATE)
	private Date datumRodjenja;

	private String email;

	private String ime;

	private String jmbg;

	private String password;

	private String prezime;

	//bi-directional many-to-one association to Uloga
	@ManyToOne
	@JoinColumn(name="idUloga")
	private Uloga uloga;

	//bi-directional many-to-one association to Upis
	@OneToMany(mappedBy="osoba")
	private List<Upis> upis;

	public Osoba() {
	}

	public int getIdOsoba() {
		return this.idOsoba;
	}

	public void setIdOsoba(int idOsoba) {
		this.idOsoba = idOsoba;
	}

	public String getBrojTel() {
		return this.brojTel;
	}

	public void setBrojTel(String brojTel) {
		this.brojTel = brojTel;
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

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPrezime() {
		return this.prezime;
	}

	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}

	public Uloga getUloga() {
		return this.uloga;
	}

	public void setUloga(Uloga uloga) {
		this.uloga = uloga;
	}

	public List<Upis> getUpis() {
		return this.upis;
	}

	public void setUpis(List<Upis> upis) {
		this.upis = upis;
	}

	public Upis addUpi(Upis upi) {
		getUpis().add(upi);
		upi.setOsoba(this);

		return upi;
	}

	public Upis removeUpi(Upis upi) {
		getUpis().remove(upi);
		upi.setOsoba(null);

		return upi;
	}

}