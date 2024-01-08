package com.khit.todoweb.mapper;

import java.util.List;

import com.khit.todoweb.vo.TodoVO;

public interface TodoMapper {
	
	public String getTime();
	
	public void insert(TodoVO todoVO);	//등록하기

	public List<TodoVO> findAll();

	public void delete(Long tno);

}
