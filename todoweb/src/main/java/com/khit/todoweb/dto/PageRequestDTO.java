package com.khit.todoweb.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class PageRequestDTO {	//�Ķ����(page, kw) ������ DTO
	private int page = 1;	//������ ��ȣ
	private int size = 10;	//limit, �� ������ �� �Խñ� ��
	
	private String[] types;	//�˻� ����
	private String keyword;	//�˻���
	
	public int getSkip() {	//#{skip}
		return (page - 1) * 10;
	}
}
