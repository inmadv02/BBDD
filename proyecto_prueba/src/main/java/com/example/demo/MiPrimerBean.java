package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MiPrimerBean {

	@Autowired
	private MiSegundoBean msb;
	
	public String upperCase() {
		return msb.dummyText().toUpperCase();
	}
}
