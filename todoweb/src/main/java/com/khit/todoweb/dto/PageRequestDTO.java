package com.khit.todoweb.dto;

import java.util.Arrays;

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
	
	//skip
	public int getSkip() {	//#{skip}
		return (page - 1) * 10;
	}
	
   // �˻����� üũ�ڽ� üũ
   public boolean checkType(String type) {
      // Ÿ�Կ� üũ�� ������ ��ȯ���� ����
      if(types == null || types.length == 0) {
         return false;
      }
      // type�� ��ġ�Ǵ� ������ ��ȯ�Ѵٴ� �ǹ�
      return Arrays.stream(types).anyMatch(type::equals);
   }
}
