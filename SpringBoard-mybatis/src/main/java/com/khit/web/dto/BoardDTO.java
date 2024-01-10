package com.khit.web.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {
	private Long id;
	private String boardTitle;
	private String userId;
	private String boardContent;
	private int hit;
	private Timestamp createdTime;
	private Timestamp updatedTime;
	private int replyCount;
	private String boardFilename;
}
