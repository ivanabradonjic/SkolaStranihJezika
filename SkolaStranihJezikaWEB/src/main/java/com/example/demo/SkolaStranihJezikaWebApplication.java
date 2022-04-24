package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
@EntityScan("model")
public class SkolaStranihJezikaWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(SkolaStranihJezikaWebApplication.class, args);
	}

}
