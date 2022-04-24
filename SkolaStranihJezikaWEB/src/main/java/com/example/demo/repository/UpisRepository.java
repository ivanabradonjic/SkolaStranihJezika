package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Kurs;
import model.Osoba;
import model.Upis;

public interface UpisRepository extends JpaRepository<Upis, Integer>{


	@Query("select u from Upis u where u.osoba=:osoba and u.kurs=:kurs")
	List<Upis> findByOsobaAndKurs(@Param("osoba")Osoba osoba, @Param("kurs")Kurs kurs);

	@Query("select count(*) from Upis u where u.kurs=:kurs")
	int countByKurs(@Param("kurs")Kurs kurs);
	
	List<Upis> findByKurs(Kurs kurs);

}
