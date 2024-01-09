package com.khit.todoweb.service;


import java.util.List;

import com.khit.todoweb.dto.PageRequestDTO;
import com.khit.todoweb.dto.PageResponseDTO;
import com.khit.todoweb.dto.TodoDTO;

public interface TodoService {

	void insert(TodoDTO todoDTO);

	List<TodoDTO> findAll();
	
	PageResponseDTO<TodoDTO> pagingList(PageRequestDTO pageRequestDTO);

	void delete(Long tno);

	TodoDTO findByTno(Long tno);

	void update(TodoDTO todoDTO);

	


}
