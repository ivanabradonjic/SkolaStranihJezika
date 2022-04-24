package com.example.demo.converter;

import org.springframework.core.convert.ConversionFailedException;
import org.springframework.core.convert.TypeDescriptor;
import org.springframework.core.convert.converter.Converter;

import com.example.demo.repository.NivoRepository;

import model.Nivo;

public class NivoKonverter implements Converter<String, Nivo>{
	NivoRepository nr;
	
	 public NivoKonverter(NivoRepository nr) {
		this.nr = nr;
	}
	
	@Override
	public Nivo convert(String source) {
		int nivoid=-1;
		try {
			nivoid = Integer.parseInt(source);
		}
		catch (NumberFormatException e) {
			throw new ConversionFailedException(TypeDescriptor.valueOf(String.class), 
					TypeDescriptor.valueOf(Nivo.class), nivoid, null);
		}
		Nivo n = nr.findById(nivoid).get();
		return n;
	}
}
