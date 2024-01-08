package com.khit.todoweb.service;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

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
		//DTO�� VO�� ��ȯ�ؾ� -> DB�� �����͸� ����
		//1. ���(ModelMapper)�� ��� �� �� ���
		/*
		TodoVO todoVO = TodoVO.builder()
				.title(todoDTO.getTitle())
				.writer(todoDTO.getWriter())
				.build();
		*/
		//2. ��⸦ ���
		TodoVO todoVO = modelMapper.map(todoDTO, TodoVO.class);
		todoMapper.insert(todoVO);
	}

	@Override
	public List<TodoDTO> findAll() {
		//vo�� dto�� ��ȯ(db -> ������ ȭ��)
		//vo ����Ʈ ������ ��������
		List<TodoVO> volist = todoMapper.findAll();
		
		//vo����Ʈ�� dto�� �����ϰ� ��ȯ��
		List<TodoDTO> dtoList = volist.stream()
				.map(vo -> modelMapper.map(vo, TodoDTO.class))
				.collect(Collectors.toList());
		return dtoList;
	}

	@Override
	public void delete(Long tno) {
		todoMapper.delete(tno);
		
	}

}
