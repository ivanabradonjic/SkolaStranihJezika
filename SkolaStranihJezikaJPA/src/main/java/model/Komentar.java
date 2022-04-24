package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Komentar database table.
 * 
 */
@Entity
@NamedQuery(name="Komentar.findAll", query="SELECT k FROM Komentar k")
public class Komentar implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idKomentar;

	private String opis;

	//bi-directional many-to-one association to Upis
	@OneToMany(mappedBy="komentar")
	private List<Upis> upis;

	public Komentar() {
	}

	public int getIdKomentar() {
		return this.idKomentar;
	}

	public void setIdKomentar(int idKomentar) {
		this.idKomentar = idKomentar;
	}

	public String getOpis() {
		return this.opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public List<Upis> getUpis() {
		return this.upis;
	}

	public void setUpis(List<Upis> upis) {
		this.upis = upis;
	}

	public Upis addUpi(Upis upi) {
		getUpis().add(upi);
		upi.setKomentar(this);

		return upi;
	}

	public Upis removeUpi(Upis upi) {
		getUpis().remove(upi);
		upi.setKomentar(null);

		return upi;
	}

}