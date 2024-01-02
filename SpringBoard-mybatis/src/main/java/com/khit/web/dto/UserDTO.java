package com.khit.web.dto;

import lombok.Data;

/*
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Setter
@Getter
*/
@Data
public class UserDTO {
	//ÇÊµå
	private Long id;
	private String userId;
	private String userPasswd;
	private String userName;
	private String userAge;
}
