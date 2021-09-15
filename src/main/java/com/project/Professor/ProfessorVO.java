package com.project.Professor;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProfessorVO {

	private int prfsNo;
	private String prfsId;
	private String password;
	private String name;
	private String email;
	private String birth;
	private String gender;
	private String faculty;
	private String major;
	private Date createdDate;
	private Date updatedDate;
}
