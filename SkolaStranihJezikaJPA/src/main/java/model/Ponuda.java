package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the Ponuda database table.
 * 
 */
@Entity
@NamedQuery(name="Ponuda.findAll", query="SELECT p FROM Ponuda p")
public class Ponuda implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idPonuda;

	@Temporal(TemporalType.DATE)
	private Date krajDatum;

	private int maxOsoba;

	@Temporal(TemporalType.DATE)
	private Date pocetakDatum;

	@Temporal(TemporalType.DATE)
	private Date rok;

	//bi-directional many-to-one association to Kurs
	@ManyToOne
	@JoinColumn(name="idKurs")
	private Kurs kurs;

	public Ponuda() {
	}

	public int getIdPonuda() {
		return this.idPonuda;
	}

	public void setIdPonuda(int idPonuda) {
		this.idPonuda = idPonuda;
	}

	public Date getKrajDatum() {
		return this.krajDatum;
	}

	public void setKrajDatum(Date krajDatum) {
		this.krajDatum = krajDatum;
	}

	public int getMaxOsoba() {
		return this.maxOsoba;
	}

	public void setMaxOsoba(int maxOsoba) {
		this.maxOsoba = maxOsoba;
	}

	public Date getPocetakDatum() {
		return this.pocetakDatum;
	}

	public void setPocetakDatum(Date pocetakDatum) {
		this.pocetakDatum = pocetakDatum;
	}

	public Date getRok() {
		return this.rok;
	}

	public void setRok(Date rok) {
		this.rok = rok;
	}

	public Kurs getKurs() {
		return this.kurs;
	}

	public void setKurs(Kurs kurs) {
		this.kurs = kurs;
	}

}