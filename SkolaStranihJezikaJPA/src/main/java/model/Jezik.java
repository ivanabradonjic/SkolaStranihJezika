package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Jezik database table.
 * 
 */
@Entity
@NamedQuery(name="Jezik.findAll", query="SELECT j FROM Jezik j")
public class Jezik implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idJezik;

	private String naziv;

	//bi-directional many-to-one association to Kurs
	@OneToMany(mappedBy="jezik")
	private List<Kurs> kurs;

	public Jezik() {
	}

	public int getIdJezik() {
		return this.idJezik;
	}

	public void setIdJezik(int idJezik) {
		this.idJezik = idJezik;
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
		kur.setJezik(this);

		return kur;
	}

	public Kurs removeKur(Kurs kur) {
		getKurs().remove(kur);
		kur.setJezik(null);

		return kur;
	}

}