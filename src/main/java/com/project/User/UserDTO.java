package com.project.User;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDTO {

	private int no;
	private int studentId;
	private String name;
	private String email;
	private String birth;
	private String gender;
	private String isGraduated;
	private String title;
	private String status;
}
