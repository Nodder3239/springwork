package org.khit.myapp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDTO {
	private long id;
	private String userId;
	private String userPasswd;
	private String userName;
	private Integer userAge;
}
