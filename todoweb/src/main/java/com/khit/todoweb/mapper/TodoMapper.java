package com.khit.todoweb.mapper;

import java.util.List;

import com.khit.todoweb.dto.PageRequestDTO;
import com.khit.todoweb.vo.TodoVO;

public interface TodoMapper {
	
	public String getTime();
	
	public void insert(TodoVO todoVO);	//����ϱ�

	List<TodoVO> findAll();
	
	//��Ϻ���
	public List<TodoVO> pagingList(PageRequestDTO pageRequestDTO);

	public void delete(Long tno);

	public TodoVO findByTno(Long tno);

	public void update(TodoVO todoVO);

	public int todoCount();
}
