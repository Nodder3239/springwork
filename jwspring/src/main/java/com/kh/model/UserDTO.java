package com.kh.model;

import lombok.Setter;
import lombok.ToString;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@ToString
@NoArgsConstructor		//�⺻ ������
@AllArgsConstructor		//�Ű������� �ִ� ������
@Getter
@Setter
public class UserDTO {
	//�ʵ�
	private String name;
	private int age;
}
