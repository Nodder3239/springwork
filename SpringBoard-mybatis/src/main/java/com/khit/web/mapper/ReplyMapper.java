package com.khit.web.mapper;

import java.util.List;

import com.khit.web.dto.ReplyDTO;

public interface ReplyMapper {

	void insert(ReplyDTO replyDTO);

	List<ReplyDTO> getReplyList(Long boardId);

	ReplyDTO findReplyById(Long id);

	void update(ReplyDTO replyDTO);

	void delete(Long id);


}
