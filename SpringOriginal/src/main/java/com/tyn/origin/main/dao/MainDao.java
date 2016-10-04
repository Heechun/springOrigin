package com.tyn.origin.main.dao;


import org.springframework.stereotype.Repository;

@Repository
public interface MainDao {

	String getPassword(String inputId);

	
}
