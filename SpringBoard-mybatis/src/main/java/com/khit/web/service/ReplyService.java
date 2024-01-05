package com.khit.web.service;

import java.util.List;

import com.khit.web.dto.ReplyDTO;

public interface ReplyService {

	void insert(ReplyDTO replyDTO);

	List<ReplyDTO> getReplyList(Long boardId);

	ReplyDTO findReplyById(Long id);

	void update(ReplyDTO replyDTO);

	void delete(Long id);

}
