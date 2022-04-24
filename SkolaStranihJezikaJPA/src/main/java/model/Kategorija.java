package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Kategorija database table.
 * 
 */
@Entity
@NamedQuery(name="Kategorija.findAll", query="SELECT k FROM Kategorija k")
public class Kategorija implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idKategorija;

	private String naziv;

	//bi-directional many-to-one association to Upis
	@OneToMany(mappedBy="kategorija")
	private List<Upis> upis;

	public Kategorija() {
	}

	public int getIdKategorija() {
		return this.idKategorija;
	}

	public void setIdKategorija(int idKategorija) {
		this.idKategorija = idKategorija;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public List<Upis> getUpis() {
		return this.upis;
	}

	public void setUpis(List<Upis> upis) {
		this.upis = upis;
	}

	public Upis addUpi(Upis upi) {
		getUpis().add(upi);
		upi.setKategorija(this);

		return upi;
	}

	public Upis removeUpi(Upis upi) {
		getUpis().remove(upi);
		upi.setKategorija(null);

		return upi;
	}

}