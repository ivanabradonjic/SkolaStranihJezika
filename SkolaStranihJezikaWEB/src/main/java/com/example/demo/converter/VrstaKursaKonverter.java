package com.example.demo.converter;

import org.springframework.core.convert.ConversionFailedException;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.Converter;

import com.example.demo.repository.VrstaKursaRepository;

import model.VrstaKursa;

public class VrstaKursaKonverter implements Converter<String, VrstaKursa> {
	
	VrstaKursaRepository vr;
	
	 public VrstaKursaKonverter(VrstaKursaRepository vr) {
		this.vr = vr;
	}
	
	@Override
	public VrstaKursa convert(String source) {
		int vrstaid=-1;
		try {
			vrstaid = Integer.parseInt(source);
		}
		catch (NumberFormatException e) {
			throw new ConversionFailedException(TypeDescriptor.valueOf(String.class), 
					TypeDescriptor.valueOf(VrstaKursa.class), vrstaid, null);
		}
		VrstaKursa v = vr.findById(vrstaid).get();
		return v;
	}
}
