package com.example.demo.converter;

import org.springframework.core.convert.ConversionFailedException;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.Converter;

import com.example.demo.repository.JezikRepository;
import com.example.demo.repository.KomentarRepository;

import model.Jezik;
import model.Komentar;

public class KomentarKonverter implements Converter<String, Komentar>{
	KomentarRepository kr;
	
	 public KomentarKonverter(KomentarRepository kr) {
		this.kr = kr;
	}
	
	@Override
	public Komentar convert(String source) {
		int kid=-1;
		try {
			kid = Integer.parseInt(source);
		}
		catch (NumberFormatException e) {
			throw new ConversionFailedException(TypeDescriptor.valueOf(String.class), 
					TypeDescriptor.valueOf(Jezik.class), kid, null);
		}
		Komentar komentar = kr.findById(kid).get();
		return komentar;
	}
}
