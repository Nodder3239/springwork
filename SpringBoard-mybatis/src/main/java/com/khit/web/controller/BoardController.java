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

@AllArgsConstructor	//생성자 주입
@Slf4j
@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService replyService;
	
	//글쓰기 페이지
	@GetMapping("/write")
	public String writeForm() {
		return "/board/write";
	}
	
	//글쓰기
	@PostMapping("/write")
	public String write(@ModelAttribute BoardDTO boardDTO, MultipartFile filename) throws IllegalStateException, IOException {
		String originFilename = filename.getOriginalFilename();
		long filesize = filename.getSize();
		String fileType = filename.getContentType();
		log.info(originFilename);
		log.info(filesize + "B");
		log.info(fileType);
		
		//서버에 저장	
		String boardFilename = "";
		if (!filename.isEmpty()) {
			String filepath = "C:\\springworks\\SpringBoard-mybatis\\src\\main\\webapp\\resources\\upload";
			//String originFilename = filename.getOriginalFilename();
			//중복 이름 방지한 고유 ID 객체 생성
			UUID uuid = UUID.randomUUID();
			boardFilename = uuid.toString() + "_" + originFilename;
			
			File file = new File(filepath + "\\" + boardFilename);
			filename.transferTo(file);	//서버 폴더에 저장
		}
		
		boardDTO.setBoardFilename(boardFilename);
		log.info(boardFilename);
		boardService.insert(boardDTO);
		return "redirect:/board/paging";
		
	}
	
	//글 목록
	@GetMapping("/")
	public String getListAll(Model model) {
		List<BoardDTO> boardDTOList = boardService.findAll();
		model.addAttribute("boardList", boardDTOList);
		return "/board/pagelist";
	}
	
	//글 목록(페이지 처리)
	// /board/paging?page=2
	// @RequestParam(required=true/false) false는 필수 아님
	@GetMapping("/paging")
	public String getPageList(Model model,
			 @RequestParam(value="page", required=false,
			  defaultValue="1") int page, String[] field, String kw) {
		//페이지와 글 개수를 구현
		List<BoardDTO> boardDTOList = boardService.pagingList(page, field, kw);
		model.addAttribute("boardList", boardDTOList);
		model.addAttribute("kw", kw);
		
		//화면 하단 구성
		PageDTO pageDTO = boardService.pagingParam(page);
		model.addAttribute("paging", pageDTO);
		return "/board/pagelist";
	}
	
	
	//글 상세보기
	// /board?id=
	@GetMapping
	public String getBoard(@RequestParam("id") Long id, Model model,
			@RequestParam(value="page", required=false,
			  defaultValue="1") int page) {
		//조회수 증가
		boardService.updateHit(id);
		//댓글 숫자 보기
		boardService.updateReplyCount(id);
		//글 상세 보기
		BoardDTO boardDTO = boardService.findById(id);
		//댓글 목록 보기
		List<ReplyDTO> replyDTO = replyService.getReplyList(id);
		model.addAttribute("board", boardDTO);
		model.addAttribute("page", page);		
		model.addAttribute("replyList", replyDTO);
		return "/board/detail";	//detail.jsp
	}

	
	
	//게시물 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam("id") Long id) {
		boardService.delete(id);
		return "redirect:/board/paging";
	}
	
	//게시물 수정
	@GetMapping("/update")
	public String updateForm(@RequestParam("id") Long id, Model model) {
		//수정할 게시글 가져오기
		BoardDTO boardDTO = boardService.findById(id);
		model.addAttribute("board", boardDTO);
		return "/board/boardupdate";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute BoardDTO boardDTO, MultipartFile filename) throws IllegalStateException, IOException {
		if(boardDTO.getBoardFilename() == null) { //파일이 없는 경우
			boardService.update(boardDTO);
			log.info("안녕하세요");
		}else {	//파일이 있는 경우		
		String originFilename = filename.getOriginalFilename();
		long filesize = filename.getSize();
		String fileType = filename.getContentType();
		log.info(originFilename);
		log.info(filesize + "B");
		log.info(fileType);
		
		//서버에 저장	
		String boardFilename = "";
		if (!filename.isEmpty()) {
			String filepath = "C:\\springworks\\SpringBoard-mybatis\\src\\main\\webapp\\resources\\upload";
			//String originFilename = filename.getOriginalFilename();
			//중복 이름 방지한 고유 ID 객체 생성
			UUID uuid = UUID.randomUUID();
			boardFilename = uuid.toString() + "_" + originFilename;
			
			File file = new File(filepath + "\\" + boardFilename);
			filename.transferTo(file);	//서버 폴더에 저장
		}
		
		boardDTO.setBoardFilename(boardFilename);
		log.info(boardFilename);
			boardService.updateFile(boardDTO);
		}
		//수정해서 다시 저장함(객체로 저장)
		//boardService.update(boardDTO);
		return "redirect:/board/paging";
	}
	
}
