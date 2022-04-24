package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Nivo database table.
 * 
 */
@Entity
@NamedQuery(name="Nivo.findAll", query="SELECT n FROM Nivo n")
public class Nivo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idNivo;

	private String opis;

	private String oznaka;

	//bi-directional many-to-one association to Kurs
	@OneToMany(mappedBy="nivo")
	private List<Kurs> kurs;

	//bi-directional many-to-one association to Upis
	@OneToMany(mappedBy="nivo")
	private List<Upis> upis;

	public Nivo() {
	}

	public int getIdNivo() {
		return this.idNivo;
	}

	public void setIdNivo(int idNivo) {
		this.idNivo = idNivo;
	}

	public String getOpis() {
		return this.opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public String getOznaka() {
		return this.oznaka;
	}

	public void setOznaka(String oznaka) {
		this.oznaka = oznaka;
	}

	public List<Kurs> getKurs() {
		return this.kurs;
	}

	public void setKurs(List<Kurs> kurs) {
		this.kurs = kurs;
	}

	public Kurs addKur(Kurs kur) {
		getKurs().add(kur);
		kur.setNivo(this);

		return kur;
	}

	public Kurs removeKur(Kurs kur) {
		getKurs().remove(kur);
		kur.setNivo(null);

		return kur;
	}

	public List<Upis> getUpis() {
		return this.upis;
	}

	public void setUpis(List<Upis> upis) {
		this.upis = upis;
	}

	public Upis addUpi(Upis upi) {
		getUpis().add(upi);
		upi.setNivo(this);

		return upi;
	}

	public Upis removeUpi(Upis upi) {
		getUpis().remove(upi);
		upi.setNivo(null);

		return upi;
	}

}