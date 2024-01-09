package com.khit.todoweb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khit.todoweb.dto.PageRequestDTO;
import com.khit.todoweb.dto.PageResponseDTO;
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
		return "redirect:/todo/paging";
	}
	
	@GetMapping("/list")
	public String todoList(Model model) {
		List<TodoDTO> todoDTOList = todoService.findAll();
		model.addAttribute("todoList", todoDTOList);
		return "/todo/list";
	}
	
	@GetMapping("/paging")
	public String todoPagingList(@ModelAttribute PageRequestDTO pageRequestDTO,
			Model model) {
		PageResponseDTO<TodoDTO> pageResponseDTO = 
				todoService.pagingList(pageRequestDTO);
		model.addAttribute("responseDTO", pageResponseDTO);
		return "/todo/pageList";
	}
	
	//1건 상세보기
	@GetMapping
	public String todoDetail(@RequestParam("tno") Long tno, 
			PageRequestDTO pageRequestDTO,
			Model model) {
		TodoDTO todoDTO = todoService.findByTno(tno);
		model.addAttribute("todo", todoDTO);
		return "/todo/detail";
	}
	
	//삭제
	@GetMapping("/delete")
	public String todoDelete(@RequestParam("tno") Long tno) {
		todoService.delete(tno);
		return "redirect:/todo/paging";
	}
	
	//수정
	@GetMapping("/update")
	public String updateform(@RequestParam("tno") Long tno, Model model) {
		TodoDTO todoDTO = todoService.findByTno(tno);
		model.addAttribute("todo", todoDTO);
		return "/todo/update";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute TodoDTO todoDTO) {
		todoService.update(todoDTO);
		return "redirect:/todo?tno=" + todoDTO.getTno();
	}
	
}
