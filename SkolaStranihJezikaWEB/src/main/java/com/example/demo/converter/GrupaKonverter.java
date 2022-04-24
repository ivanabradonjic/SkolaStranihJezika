package com.example.demo.converter;

import org.springframework.core.convert.ConversionFailedException;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.Converter;

import com.example.demo.repository.GrupaRepository;

import model.Grupa;



public class GrupaKonverter implements Converter<String, Grupa>{
	GrupaRepository gr;
	
	 public GrupaKonverter(GrupaRepository gr) {
		this.gr = gr;
	}
	
	@Override
	public Grupa convert(String source) {
		int grupaid=-1;
		try {
			grupaid = Integer.parseInt(source);
		}
		catch (NumberFormatException e) {
			throw new ConversionFailedException(TypeDescriptor.valueOf(String.class), 
					TypeDescriptor.valueOf(Grupa.class), grupaid, null);
		}
		Grupa g = gr.findById(grupaid).get();
		return g;
	}
}
