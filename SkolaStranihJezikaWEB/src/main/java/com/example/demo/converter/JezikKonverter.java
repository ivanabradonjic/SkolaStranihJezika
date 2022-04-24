package com.example.demo.converter;

import org.springframework.core.convert.ConversionFailedException;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.Converter;

import com.example.demo.repository.JezikRepository;

import model.Jezik;

public class JezikKonverter implements Converter<String, Jezik>{
	JezikRepository jr;
	
	 public JezikKonverter(JezikRepository jr) {
		this.jr = jr;
	}
	
	@Override
	public Jezik convert(String source) {
		int jezid=-1;
		try {
			jezid = Integer.parseInt(source);
		}
		catch (NumberFormatException e) {
			throw new ConversionFailedException(TypeDescriptor.valueOf(String.class), 
					TypeDescriptor.valueOf(Jezik.class), jezid, null);
		}
		Jezik j = jr.findById(jezid).get();
		return j;
	}
}
