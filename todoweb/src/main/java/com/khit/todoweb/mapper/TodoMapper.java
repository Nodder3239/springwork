package com.khit.todoweb.mapper;

import java.util.List;

import com.khit.todoweb.vo.TodoVO;

public interface TodoMapper {
	
	public String getTime();
	
	public void insert(TodoVO todoVO);	//����ϱ�

	public List<TodoVO> findAll();

	public void delete(Long tno);

}
