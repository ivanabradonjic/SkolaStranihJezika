package com.example.demo.repository;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import model.Ponuda;

public interface PonudaRepository extends JpaRepository<Ponuda, Integer>{

	@Transactional
	@Modifying
	@Query("delete from Ponuda p where p.krajDatum < ?1")
	void deletePonudaByKrajDatum(Date date);


}
