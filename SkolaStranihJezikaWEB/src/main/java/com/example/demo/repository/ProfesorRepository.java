package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Profesor;

public interface ProfesorRepository extends JpaRepository<Profesor, Integer> {

	Profesor findByEmail(String email);

}
