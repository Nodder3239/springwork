package com.khit.members.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khit.members.dto.MemberDTO;
import com.khit.members.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor		//생성자 주입
@Slf4j
@RequestMapping("/member")
@Controller
public class MemberController {
	
	private MemberService memberService;
	
	@GetMapping("/join")
	public String joinForm() {
		return "/member/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute MemberDTO memberDTO) {
		log.info("memberDTO=" + memberDTO);
		//회원 가입 처리(저장)
		memberService.insert(memberDTO);
		return "/member/login";
	}
	
	@GetMapping("/login")
	public String loginForm() {
		return "/member/login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
		MemberDTO loginMember = memberService.login(memberDTO);
		//로그인 성공, 실패
		if(loginMember !=null) {
			log.info("로그인 성공");
			session.setAttribute("sessionEmail", loginMember.getEmail());
			log.info("loginMember: " + loginMember);
			log.info("memberDTO: " + memberDTO);
			log.info(memberDTO.getName());
			return "/main";	//http://localhost:8080/
		}else {
			log.info("로그인 실패");
			return "member/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/update")
	public String updateForm(Model model, HttpSession session) {
		String email = (String) session.getAttribute("sessionEmail");
		MemberDTO memberDTO = memberService.findByEmail(email);
		model.addAttribute("member", memberDTO);
		return "/member/update";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute MemberDTO memberDTO) {
		log.info("memberDTO=" + memberDTO);
		//회원 가입 처리(저장)
		memberService.update(memberDTO);
		return "redirect:/";
	}

}
