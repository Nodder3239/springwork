package com.khit.todoweb.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import com.khit.todoweb.dto.PageRequestDTO;
import com.khit.todoweb.dto.PageResponseDTO;
import com.khit.todoweb.dto.TodoDTO;
import com.khit.todoweb.mapper.TodoMapper;
import com.khit.todoweb.vo.TodoVO;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class TodoServiceImpl implements TodoService{

	private TodoMapper todoMapper;
	private ModelMapper modelMapper;
	
	@Override
	public void insert(TodoDTO todoDTO) {
		//DTO를 VO로 변환해야 -> DB에 데이터를 저장
		//1. 모듈(ModelMapper)을 사용 안 한 경우
		/*
		TodoVO todoVO = TodoVO.builder()
				.title(todoDTO.getTitle())
				.writer(todoDTO.getWriter())
				.build();
		*/
		//2. 모듈를 사용
		TodoVO todoVO = modelMapper.map(todoDTO, TodoVO.class);
		todoMapper.insert(todoVO);
	}

	@Override
	public List<TodoDTO> findAll() {
		 //vo를 dto로 변환(db -> 브라우저화면)
		 //vo 리스트 데이터 가져오기
		 List<TodoVO> voList = todoMapper.findAll();
		 
		 /*
		 List<TodoDTO> dtoList = new ArrayList<>();
		 for(TodoVO todoVO : voList) {
		 	 //vo -> dto
			 TodoDTO todoDTO = TodoDTO.builder()
					 .title(todoVO.getTitle())
					 .writer(todoVO.getWriter())
					 .build();
			 dtoList.add(todoDTO);
		 }
		 */
		 
		 //vo리스트를 dto로 저장하고 반환함(람다식으로 구현)
		 List<TodoDTO> dtoList = voList.stream()
				 .map(vo -> modelMapper.map(vo, TodoDTO.class))
				 .collect(Collectors.toList());
		 
		return dtoList;
	}
	

	@Override
	public void delete(Long tno) {
		todoMapper.delete(tno);
		
	}

	@Override
	public TodoDTO findByTno(Long tno) {
		TodoVO todoVO = todoMapper.findByTno(tno);
		/*
		TodoDTO todoDTO = todoDTO.builder()
				.tno(todoVO.getTno())
				.title(todoVO.getTitle())
				.writer(todoVO.getWriter())
				.build();
		*/
		TodoDTO todoDTO = modelMapper.map(todoVO, TodoDTO.class);
		return todoDTO;
	}

	@Override
	public void update(TodoDTO todoDTO) {
		//DTO를 VO로
		TodoVO todoVO = modelMapper.map(todoDTO, TodoVO.class);
		todoMapper.update(todoVO);
	}

	@Override
	public PageResponseDTO<TodoDTO> pagingList(PageRequestDTO pageRequestDTO) {
		//db에서 voList 가져오기
		List<TodoVO> voList = todoMapper.pagingList(pageRequestDTO);
		
		//voList를 dtoList로 변환
		List<TodoDTO> dtoList = voList.stream()
				 .map(vo -> modelMapper.map(vo, TodoDTO.class))
				 .collect(Collectors.toList());
		
		//전체 데이터 개수 가져옴
		int total = todoMapper.todoCount();
		
		PageResponseDTO<TodoDTO> pageResponseDTO = PageResponseDTO.<TodoDTO>withAll()
				.dtoList(dtoList)
				.total(total)
				.pageRequestDTO(pageRequestDTO)
				.build();
		
		return pageResponseDTO;
	}



}
