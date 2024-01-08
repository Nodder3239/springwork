package com.khit.todoweb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khit.todoweb.dto.TodoDTO;
import com.khit.todoweb.service.TodoService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@RequestMapping("/todo")
@Controller
public class TodoController {
	
	@Autowired
	private TodoService todoService;
	
	@GetMapping("/register")
	public String registerform() {
		return "/todo/register";
	}
	
	@PostMapping("/register")
	public String register(@ModelAttribute TodoDTO todoDTO) {
		log.info("todoDTO: " + todoDTO);
		todoService.insert(todoDTO);
		return "/index";
	}
	
	@GetMapping("/list")
	public String todoList(Model model) {
		List<TodoDTO> todoDTOList = todoService.findAll();
		model.addAttribute("todoList", todoDTOList);
		return "/todo/list";
	}
	
	@GetMapping("/delete")
	public String todoDelete(Long tno) {
		todoService.delete(tno);
		return "redirect:/todo/list";
	}
}
