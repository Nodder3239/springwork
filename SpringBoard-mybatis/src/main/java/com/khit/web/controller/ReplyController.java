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
	
	//서비스 클래스 주입(생성자, Autowired)
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
		//댓글 저장 처리
		replyService.insert(replyDTO);
		//등록 후 댓글 목록 가져와서 detail 페이지로 보내줌
		List<ReplyDTO> replyList = replyService.getReplyList(replyDTO.getBoardId());
		return replyList;
	}
	
	//댓글 수정 폼
	@GetMapping("/update")
	public String updateReplyForm(@RequestParam("id") Long id, Model model) {
		//해당 댓글 가져오기
		ReplyDTO replyDTO = replyService.findReplyById(id);
		model.addAttribute("reply", replyDTO);
		return "/board/replyupdate";
	}
	//댓글 수정 처리
	@PostMapping("/update")
	public String update(@ModelAttribute ReplyDTO replyDTO) {
		replyService.update(replyDTO);
		boardService.updateHit2(replyDTO.getBoardId());
		return "redirect:/board?id=" + replyDTO.getBoardId();
	}
	
	//댓글 삭제
	@GetMapping("/delete")
	public String delete( @RequestParam("boardId") Long boardId,
			@RequestParam("id") Long id) {
		replyService.delete(id);
		boardService.updateHit2(boardId);
		return "redirect:/board?id=" + boardId;
	}
	
}
