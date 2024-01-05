package com.khit.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khit.web.dto.BoardDTO;
import com.khit.web.dto.PageDTO;
import com.khit.web.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public void insert(BoardDTO boardDTO) {
		boardMapper.insert(boardDTO);
	}

	@Override
	public List<BoardDTO> findAll() {
		return boardMapper.findAll();
	}

	@Override
	public BoardDTO findById(Long id) {
		return boardMapper.findById(id);
	}

	@Override
	public void delete(Long id) {
		boardMapper.delete(id);
	}

	@Override
	public void update(BoardDTO boardDTO) {
		boardMapper.update(boardDTO);
	}

	@Override
	public void updateHit(Long id) {
		boardMapper.updateHit(id);	
	}

	@Override
	public void updateReplyCount(Long id) {
		boardMapper.updateReplyCount(id);	
	}

	@Override
	public void updateHit2(Long id) {
		boardMapper.updateHit2(id);
	}
	
	int pageLimit = 10;	//������ �� �� ����
	int blockLimit = 5;
	
	@Override
	public List<BoardDTO> pagingList(int page) {
		//select * from boards order by id desc limit 0, 10
		int pageStart = (page - 1) * pageLimit;
		Map<String, Integer> pagingParam = new HashMap<>();
		pagingParam.put("start", pageStart);
		pagingParam.put("limit", pageLimit);
		List<BoardDTO> pagingList = boardMapper.pagingList(pagingParam);
		return pagingList;
	}

	@Override
	public PageDTO pagingParam(int page) {
		//�ϴܿ� ������ ������ �� ���
		int totalRow = boardMapper.boardCount();
		//��ü ������ ���� - �ø�(Math.ceil) -> (int)
		int maxPage = (int)(Math.ceil((double)totalRow/pageLimit));
		//�ϴܿ� ������ ���� ������ �� ��� - (1, 6, 11, ...)
		int startPage = ((int)(Math.ceil((double)page/blockLimit))-1)*blockLimit+1;
		//int startPage = page - blockLimit + 1;
		//�ϴܿ� ������ ������ ������ �� ���
		int endPage = startPage + blockLimit - 1;
		if(endPage > maxPage)
			endPage = maxPage;
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPage(page);
		pageDTO.setMaxPage(maxPage);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		
		return pageDTO;
	}

}
