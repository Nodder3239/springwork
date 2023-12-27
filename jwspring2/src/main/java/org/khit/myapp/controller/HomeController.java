package org.khit.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller		//@component »ó¼Ó
public class HomeController {
		
	//http://localhost:8080/
	@RequestMapping("/")
	public String home() {
		
		
		return "index";	//home.jsp
	}
	
}
