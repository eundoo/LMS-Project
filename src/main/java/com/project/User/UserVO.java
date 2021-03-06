package com.project.User;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {

	private int userNo;
	private int studentId;
	private String password;
	private String facCode;
	private String majCode;
	private String email;
	private String birth;
	private String name;
	private String gender;
	private String isGraduated;
	private String isUser;
	private Date createdDate;
	private Date updatedDate;	
}
