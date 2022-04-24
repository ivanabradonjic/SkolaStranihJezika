package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Kurs database table.
 * 
 */
@Entity
@NamedQuery(name="Kurs.findAll", query="SELECT k FROM Kurs k")
public class Kurs implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idKurs;

	private double cena;

	private String opis;

	private String trajanje;

	//bi-directional many-to-one association to Grupa
	@ManyToOne
	@JoinColumn(name="idGrupa")
	private Grupa grupa;

	//bi-directional many-to-one association to Jezik
	@ManyToOne
	@JoinColumn(name="idJezik")
	private Jezik jezik;

	//bi-directional many-to-one association to Nivo
	@ManyToOne
	@JoinColumn(name="idNivo")
	private Nivo nivo;

	//bi-directional many-to-one association to Profesor
	@ManyToOne
	@JoinColumn(name="idProfesor")
	private Profesor profesor;

	//bi-directional many-to-one association to VrstaKursa
	@ManyToOne
	@JoinColumn(name="idVrstaKursa")
	private VrstaKursa vrstaKursa;

	//bi-directional many-to-one association to Ponuda
	@OneToMany(mappedBy="kurs")
	private List<Ponuda> ponudas;

	//bi-directional many-to-one association to Upis
	@OneToMany(mappedBy="kurs")
	private List<Upis> upis;

	public Kurs() {
	}

	public int getIdKurs() {
		return this.idKurs;
	}

	public void setIdKurs(int idKurs) {
		this.idKurs = idKurs;
	}

	public double getCena() {
		return this.cena;
	}

	public void setCena(double cena) {
		this.cena = cena;
	}

	public String getOpis() {
		return this.opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public String getTrajanje() {
		return this.trajanje;
	}

	public void setTrajanje(String trajanje) {
		this.trajanje = trajanje;
	}

	public Grupa getGrupa() {
		return this.grupa;
	}

	public void setGrupa(Grupa grupa) {
		this.grupa = grupa;
	}

	public Jezik getJezik() {
		return this.jezik;
	}

	public void setJezik(Jezik jezik) {
		this.jezik = jezik;
	}

	public Nivo getNivo() {
		return this.nivo;
	}

	public void setNivo(Nivo nivo) {
		this.nivo = nivo;
	}

	public Profesor getProfesor() {
		return this.profesor;
	}

	public void setProfesor(Profesor profesor) {
		this.profesor = profesor;
	}

	public VrstaKursa getVrstaKursa() {
		return this.vrstaKursa;
	}

	public void setVrstaKursa(VrstaKursa vrstaKursa) {
		this.vrstaKursa = vrstaKursa;
	}

	public List<Ponuda> getPonudas() {
		return this.ponudas;
	}

	public void setPonudas(List<Ponuda> ponudas) {
		this.ponudas = ponudas;
	}

	public Ponuda addPonuda(Ponuda ponuda) {
		getPonudas().add(ponuda);
		ponuda.setKurs(this);

		return ponuda;
	}

	public Ponuda removePonuda(Ponuda ponuda) {
		getPonudas().remove(ponuda);
		ponuda.setKurs(null);

		return ponuda;
	}

	public List<Upis> getUpis() {
		return this.upis;
	}

	public void setUpis(List<Upis> upis) {
		this.upis = upis;
	}

	public Upis addUpis(Upis upis) {
		getUpis().add(upis);
		upis.setKurs(this);

		return upis;
	}

	public Upis removeUpsi(Upis upis) {
		getUpis().remove(upis);
		upis.setKurs(null);

		return upis;
	}

}