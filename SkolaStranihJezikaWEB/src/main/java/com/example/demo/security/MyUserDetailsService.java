package com.example.demo.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.repository.OsobaRepository;

import model.Osoba;
 
@Service("customUserDetailsService")
public class MyUserDetailsService implements UserDetailsService {
 
	@Autowired
	OsobaRepository or;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		
		Osoba  user=(Osoba) or.findByEmail(email);
		
		MyUserDetails userDetails = new MyUserDetails();
		userDetails.setUsername(user.getEmail());
		userDetails.setPassword(user.getPassword());
		
		userDetails.setU(user.getUloga());
		return userDetails;
	}
 
}
