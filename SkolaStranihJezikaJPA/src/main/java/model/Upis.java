package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the Upis database table.
 * 
 */
@Entity
@NamedQuery(name="Upis.findAll", query="SELECT u FROM Upis u")
public class Upis implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idUpis;

	@Temporal(TemporalType.DATE)
	private Date datumUpisa;

	//bi-directional many-to-one association to Kategorija
	@ManyToOne
	@JoinColumn(name="idKategorija")
	private Kategorija kategorija;

	//bi-directional many-to-one association to Komentar
	@ManyToOne
	@JoinColumn(name="idKomentar")
	private Komentar komentar;

	//bi-directional many-to-one association to Kurs
	@ManyToOne
	@JoinColumn(name="idKurs")
	private Kurs kurs;

	//bi-directional many-to-one association to Nivo
	@ManyToOne
	@JoinColumn(name="idNivo")
	private Nivo nivo;

	//bi-directional many-to-one association to Osoba
	@ManyToOne
	@JoinColumn(name="idOsoba")
	private Osoba osoba;

	public Upis() {
	}

	public int getIdUpis() {
		return this.idUpis;
	}

	public void setIdUpis(int idUpis) {
		this.idUpis = idUpis;
	}

	public Date getDatumUpisa() {
		return this.datumUpisa;
	}

	public void setDatumUpisa(Date datumUpisa) {
		this.datumUpisa = datumUpisa;
	}

	public Kategorija getKategorija() {
		return this.kategorija;
	}

	public void setKategorija(Kategorija kategorija) {
		this.kategorija = kategorija;
	}

	public Komentar getKomentar() {
		return this.komentar;
	}

	public void setKomentar(Komentar komentar) {
		this.komentar = komentar;
	}

	public Kurs getKurs() {
		return this.kurs;
	}

	public void setKurs(Kurs kurs) {
		this.kurs = kurs;
	}

	public Nivo getNivo() {
		return this.nivo;
	}

	public void setNivo(Nivo nivo) {
		this.nivo = nivo;
	}

	public Osoba getOsoba() {
		return this.osoba;
	}

	public void setOsoba(Osoba osoba) {
		this.osoba = osoba;
	}

}