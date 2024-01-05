package com.khit.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/main")
	public String main() {
		return "main";
	}
	
	@GetMapping("/game")
	public String game() {
		return "/ex/game";
	}
	
	@GetMapping("/game2")
	public String game2() {
		return "/ex/game2";
	}
	
	@GetMapping("favicon.ico")
	@ResponseBody
	public void returnNoFavicon() {
		
	}
	
}
