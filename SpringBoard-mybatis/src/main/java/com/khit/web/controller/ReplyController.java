package com.khit.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khit.web.dto.BoardDTO;
import com.khit.web.dto.ReplyDTO;
import com.khit.web.service.BoardService;
import com.khit.web.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Slf4j
@RequestMapping("/reply")
@Controller
public class ReplyController {
	
	//���� Ŭ���� ����(������, Autowired)
	@Autowired
	public ReplyService replyService;
	@Autowired
	public BoardService boardService;
	
	/*
	@PostMapping("/insert")
	public String insertReply(@ModelAttribute ReplyDTO replyDTO) {
		replyService.insert(replyDTO);
		boardService.updateHit2(replyDTO.getBoardId());
		return "redirect:/board?id=" + replyDTO.getBoardId();
	}
	*/
	@PostMapping("/insert")
	public @ResponseBody List<ReplyDTO> insertReply(@ModelAttribute ReplyDTO replyDTO) {
		//��� ���� ó��
		replyService.insert(replyDTO);
		//��� �� ��� ��� �����ͼ� detail �������� ������
		List<ReplyDTO> replyList = replyService.getReplyList(replyDTO.getBoardId());
		return replyList;
	}
	
	//��� ���� ��
	@GetMapping("/update")
	public String updateReplyForm(@RequestParam("id") Long id, Model model) {
		//�ش� ��� ��������
		ReplyDTO replyDTO = replyService.findReplyById(id);
		model.addAttribute("reply", replyDTO);
		return "/board/replyupdate";
	}
	//��� ���� ó��
	@PostMapping("/update")
	public String update(@ModelAttribute ReplyDTO replyDTO) {
		replyService.update(replyDTO);
		boardService.updateHit2(replyDTO.getBoardId());
		return "redirect:/board?id=" + replyDTO.getBoardId();
	}
	
	//��� ����
	@GetMapping("/delete")
	public String delete( @RequestParam("boardId") Long boardId,
			@RequestParam("id") Long id) {
		replyService.delete(id);
		boardService.updateHit2(boardId);
		return "redirect:/board?id=" + boardId;
	}
	
}
