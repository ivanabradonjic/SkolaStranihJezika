package com.example.demo.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Osoba;

public interface OsobaRepository extends JpaRepository<Osoba, Integer>{

	
	public Osoba findByEmail(String email);
}
