package com.khit.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khit.web.dto.UserDTO;
import com.khit.web.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/user")
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	@GetMapping("/join")
	public String joinForm() {
		return "/user/join";
	}
	
	//회원 가입 처리
	@PostMapping("/join")
	public String join(@ModelAttribute UserDTO userDTO) {
		log.info("userDTO:" + userDTO);
		userService.insert(userDTO);
		return "redirect:/user/login";
	}
	
	//회원 목록
	@GetMapping("/")
	public String userlist(Model model) {
		List<UserDTO> userDTOList = userService.findAll();
		model.addAttribute("userList", userDTOList);
		return "/user/userlist";
	}
	
	//회원 상세보기	- getUser(), /user?id
	@GetMapping
	public String getUser(@RequestParam("id") Long id, Model model) {
		UserDTO userDTO = userService.findById(id);
		model.addAttribute("user", userDTO);
		return "/user/userdetail";
	}
	
	//로그인 페이지
	@GetMapping("/login")
	public String loginform() {
		return "/user/login";
	}
	
	//로그인 처리
	@PostMapping("/login")
	public String login(@ModelAttribute UserDTO userDTO, HttpSession session) {
		UserDTO loginResult = userService.login(userDTO);
		//로그인 성공, 실패
		if(loginResult !=null) {
			session.setAttribute("sessionId", userDTO.getUserId());
			return "redirect:/";	//http://localhost:8080/
		}else {
			return "user/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/update")
	public String update(Model model, HttpSession session) {
		//수정할 회원 가져오기(세션 이름으로 가져오기)
		String userId = (String) session.getAttribute("sessionId");
		UserDTO userDTO = userService.findByUserId(userId);
		model.addAttribute("user", userDTO);
		return "/user/userupdate";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute UserDTO userDTO) {
		userService.update(userDTO);
		return "redirect:/";
		//return "redirect:/user/update?id=" + userDTO.getId();
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("id") Long id) {
		userService.delete(id);
		return "redirect:/user/";
	}
	
	//아이디 중복 검사
	@PostMapping("/checkuserid")
	public @ResponseBody String userCheckUserId(
			@RequestParam("userId") String userId) {
		log.info(userId);
		String checkResult = userService.checkUserId(userId);
		return checkResult;
	}
	
	
	
}
