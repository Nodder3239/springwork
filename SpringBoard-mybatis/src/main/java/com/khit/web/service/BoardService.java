package com.khit.web.service;

import java.util.List;

import com.khit.web.dto.BoardDTO;
import com.khit.web.dto.PageDTO;

public interface BoardService {

	void insert(BoardDTO boardDTO);

	List<BoardDTO> findAll();
	
	BoardDTO findById(Long id);

	void delete(Long id);

	void update(BoardDTO boardDTO);

	void updateHit(Long id);

	void updateReplyCount(Long id);

	void updateHit2(Long boardId);

	List<BoardDTO> pagingList(int page, String[] field, String kw);

	PageDTO pagingParam(int page);

	void updateFile(BoardDTO boardDTO);


}
