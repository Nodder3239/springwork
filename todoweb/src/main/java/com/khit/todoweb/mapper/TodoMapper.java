package com.khit.todoweb.mapper;

import java.util.List;

import com.khit.todoweb.dto.PageRequestDTO;
import com.khit.todoweb.vo.TodoVO;

public interface TodoMapper {
	
	public String getTime();
	
	public void insert(TodoVO todoVO);	//등록하기

	List<TodoVO> findAll();
	
	//목록보기
	public List<TodoVO> pagingList(PageRequestDTO pageRequestDTO);

	public void delete(Long tno);

	public TodoVO findByTno(Long tno);

	public void update(TodoVO todoVO);

	public int todoCount();
}
