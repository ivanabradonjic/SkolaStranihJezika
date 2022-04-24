package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Grupa database table.
 * 
 */
@Entity
@NamedQuery(name="Grupa.findAll", query="SELECT g FROM Grupa g")
public class Grupa implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idGrupa;

	private String tip;

	private String velicina;

	//bi-directional many-to-one association to Kurs
	@OneToMany(mappedBy="grupa")
	private List<Kurs> kurs;

	public Grupa() {
	}

	public int getIdGrupa() {
		return this.idGrupa;
	}

	public void setIdGrupa(int idGrupa) {
		this.idGrupa = idGrupa;
	}

	public String getTip() {
		return this.tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public String getVelicina() {
		return this.velicina;
	}

	public void setVelicina(String velicina) {
		this.velicina = velicina;
	}

	public List<Kurs> getKurs() {
		return this.kurs;
	}

	public void setKurs(List<Kurs> kurs) {
		this.kurs = kurs;
	}

	public Kurs addKur(Kurs kur) {
		getKurs().add(kur);
		kur.setGrupa(this);

		return kur;
	}

	public Kurs removeKur(Kurs kur) {
		getKurs().remove(kur);
		kur.setGrupa(null);

		return kur;
	}

}