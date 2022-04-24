package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Kurs;

public interface KursRepository extends JpaRepository<Kurs, Integer>{

	
	@Query("select k from Kurs k where k.jezik.idJezik=:idJezik")
	List<Kurs> findByJezik(@Param("idJezik")Integer idJezik);

	@Query("select k from Kurs k where k.profesor.idProfesor=:idP")
	List<Kurs> findByProfesor(@Param("idP")Integer idP);

}
