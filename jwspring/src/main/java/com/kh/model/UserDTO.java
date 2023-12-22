package com.kh.model;

import lombok.Setter;
import lombok.ToString;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@ToString
@NoArgsConstructor		//기본 생성자
@AllArgsConstructor		//매개변수가 있는 생성자
@Getter
@Setter
public class UserDTO {
	//필드
	private String name;
	private int age;
}
