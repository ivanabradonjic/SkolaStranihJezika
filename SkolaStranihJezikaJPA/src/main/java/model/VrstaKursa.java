package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the VrstaKursa database table.
 * 
 */
@Entity
@NamedQuery(name="VrstaKursa.findAll", query="SELECT v FROM VrstaKursa v")
public class VrstaKursa implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idVrstaKursa;

	private String naziv;

	//bi-directional many-to-one association to Kurs
	@OneToMany(mappedBy="vrstaKursa")
	private List<Kurs> kurs;

	public VrstaKursa() {
	}

	public int getIdVrstaKursa() {
		return this.idVrstaKursa;
	}

	public void setIdVrstaKursa(int idVrstaKursa) {
		this.idVrstaKursa = idVrstaKursa;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public List<Kurs> getKurs() {
		return this.kurs;
	}

	public void setKurs(List<Kurs> kurs) {
		this.kurs = kurs;
	}

	public Kurs addKur(Kurs kur) {
		getKurs().add(kur);
		kur.setVrstaKursa(this);

		return kur;
	}

	public Kurs removeKur(Kurs kur) {
		getKurs().remove(kur);
		kur.setVrstaKursa(null);

		return kur;
	}

}