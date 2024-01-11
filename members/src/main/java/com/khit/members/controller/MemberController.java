package com.khit.members.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khit.members.dto.MemberDTO;
import com.khit.members.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor		//������ ����
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
		//ȸ�� ���� ó��(����)
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
		//�α��� ����, ����
		if(loginMember !=null) {
			log.info("�α��� ����");
			session.setAttribute("sessionEmail", loginMember.getEmail());
			log.info("loginMember: " + loginMember);
			log.info("memberDTO: " + memberDTO);
			log.info(memberDTO.getName());
			return "/main";	//http://localhost:8080/
		}else {
			log.info("�α��� ����");
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
	
	@GetMapping("/update2")
	public String update2Form(Model model, Long id) {
		MemberDTO memberDTO = memberService.findById(id);
		model.addAttribute("member", memberDTO);
		return "/member/update";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute MemberDTO memberDTO) {
		log.info("memberDTO=" + memberDTO);
		//ȸ�� ���� ó��(����)
		memberService.update(memberDTO);
		return "redirect:/member?id=" + memberDTO.getId();
	}
	
	//ȸ�� ���
	@GetMapping("/")
	public String getMemberList(Model model) {
		List<MemberDTO> memberList = memberService.findAll();
		model.addAttribute("memberList", memberList);
		return "/member/list";
	}
	
	//ȸ�� ����
	@GetMapping("/delete")
	public String delete(@RequestParam("id") Long id) {
		memberService.delete(id);
		return "redirect:/member/";
	}
	
	//ȸ�� �󼼺���
	@GetMapping
	public String detail(Long id, Model model) {
		MemberDTO memberDTO = memberService.findById(id);
		model.addAttribute("member", memberDTO);
		return "/member/detail";
	}
	
	@PostMapping("/checkemail")
	public @ResponseBody String checkEmail(@RequestParam("email") String email) {
		/*
		String resultText = memberService.checkEmail(email);
		return resultText;
		*/
		
		
		MemberDTO memberDTO = memberService.findByEmail(email);
		if(memberDTO == null) {
			return "OK";
		}else {
			return "NO";
		}
		
	}	
	
}
