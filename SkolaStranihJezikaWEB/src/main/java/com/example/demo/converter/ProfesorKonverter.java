package com.example.demo.converter;

import org.springframework.core.convert.ConversionFailedException;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.Converter;

import com.example.demo.repository.ProfesorRepository;


import model.Profesor;

public class ProfesorKonverter implements Converter<String, Profesor>{
	ProfesorRepository pr;
	
	 public ProfesorKonverter(ProfesorRepository pr) {
		this.pr = pr;
	}
	
	@Override
	public Profesor convert(String source) {
		int profid=-1;
		try {
			profid = Integer.parseInt(source);
		}
		catch (NumberFormatException e) {
			throw new ConversionFailedException(TypeDescriptor.valueOf(String.class), 
					TypeDescriptor.valueOf(Profesor.class), profid, null);
		}
		Profesor p = pr.findById(profid).get();
		return p;
	}
}
