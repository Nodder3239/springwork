package org.khit.myapp.sample;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.ToString;

@AllArgsConstructor		//������ ����(new�� �Ͱ� ����)
@ToString
@Component
public class Company {
	private Employee employee;
}
