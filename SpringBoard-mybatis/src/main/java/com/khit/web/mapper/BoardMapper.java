package com.khit.web.mapper;

import java.util.List;

import com.khit.web.dto.BoardDTO;

public interface BoardMapper {

	void insert(BoardDTO boardDTO);

	List<BoardDTO> findAll();

	BoardDTO findById(Long id);

	void delete(Long id);

	void update(BoardDTO boardDTO);

	void updateHitCount(Long id);


}
