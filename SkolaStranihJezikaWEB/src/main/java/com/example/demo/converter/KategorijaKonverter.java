package com.example.demo.converter;

import org.springframework.core.convert.ConversionFailedException;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.Converter;

import com.example.demo.repository.KategorijaRepository;

import model.Grupa;
import model.Kategorija;

public class KategorijaKonverter implements Converter<String, Kategorija> {
	KategorijaRepository katr;
	
	 public KategorijaKonverter(KategorijaRepository katr) {
		this.katr = katr;
	}
	
	@Override
	public Kategorija convert(String source) {
		int katid=-1;
		try {
			katid = Integer.parseInt(source);
		}
		catch (NumberFormatException e) {
			throw new ConversionFailedException(TypeDescriptor.valueOf(String.class), 
					TypeDescriptor.valueOf(Kategorija.class), katid, null);
		}
		Kategorija k = katr.findById(katid).get();
		return k;
	}
}
