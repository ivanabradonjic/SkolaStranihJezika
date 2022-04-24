package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Uloga;

public interface UlogaRepository extends JpaRepository<Uloga, Integer>{

	@Query("select u from Uloga u where u.naziv=:nazivU")
	Uloga findByNaziv(@Param("nazivU")String nazivU);

}
