package com.khit.todoweb.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class PageRequestDTO {	//파라미터(page, kw) 수집용 DTO
	private int page = 1;	//페이지 번호
	private int size = 10;	//limit, 한 페이지 당 게시글 수
	
	private String[] types;	//검색 유형
	private String keyword;	//검색어
	
	public int getSkip() {	//#{skip}
		return (page - 1) * 10;
	}
}
