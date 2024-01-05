package com.khit.web.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.khit.web.dto.BoardDTO;
import com.khit.web.dto.PageDTO;
import com.khit.web.dto.ReplyDTO;
import com.khit.web.service.BoardService;
import com.khit.web.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor	//������ ����
@Slf4j
@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService replyService;
	
	//�۾��� ������
	@GetMapping("/write")
	public String writeForm() {
		return "/board/write";
	}
	
	//�۾���
	@PostMapping("/write")
	public String write(@ModelAttribute BoardDTO boardDTO){
		boardService.insert(boardDTO);
		return "redirect:/board/paging";
	}
	
	//�� ���
	@GetMapping("/")
	public String getListAll(Model model) {
		List<BoardDTO> boardDTOList = boardService.findAll();
		model.addAttribute("boardList", boardDTOList);
		return "/board/paging";
	}
	
	//�� ���(������ ó��)
	// /board/paging?page=2
	// @RequestParam(required=true/false) false�� �ʼ� �ƴ�
	@GetMapping("/paging")
	public String getPageList(Model model,
			 @RequestParam(value="page", required=false,
			  defaultValue="1") int page) {
		//�������� �� ������ ����
		List<BoardDTO> boardDTOList = boardService.pagingList(page);
		model.addAttribute("boardList", boardDTOList);
		
		//ȭ�� �ϴ� ����
		PageDTO pageDTO = boardService.pagingParam(page);
		model.addAttribute("paging", pageDTO);
		return "/board/pagelist";
	}
	
	
	//�� �󼼺���
	// /board?id=
	@GetMapping
	public String getBoard(@RequestParam("id") Long id, Model model,
			@RequestParam(value="page", required=false,
			  defaultValue="1") int page) {
		//��ȸ�� ����
		boardService.updateHit(id);
		//��� ���� ����
		boardService.updateReplyCount(id);
		//�� �� ����
		BoardDTO boardDTO = boardService.findById(id);
		//��� ��� ����
		List<ReplyDTO> replyDTO = replyService.getReplyList(id);
		model.addAttribute("board", boardDTO);
		model.addAttribute("page", page);		
		model.addAttribute("replyList", replyDTO);
		return "/board/detail";	//detail.jsp
	}
	
	//�Խù� ����
	@GetMapping("/delete")
	public String delete(@RequestParam("id") Long id) {
		boardService.delete(id);
		return "redirect:/board/pagelist";
	}
	
	//�Խù� ����
	@GetMapping("/update")
	public String updateForm(@RequestParam("id") Long id, Model model) {
		//������ �Խñ� ��������
		BoardDTO boardDTO = boardService.findById(id);
		model.addAttribute("board", boardDTO);
		return "/board/boardupdate";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute BoardDTO boardDTO) {
		//�����ؼ� �ٽ� ������(��ü�� ����)
		boardService.update(boardDTO);
		return "redirect:/board/pagelist";
	}
	
}
