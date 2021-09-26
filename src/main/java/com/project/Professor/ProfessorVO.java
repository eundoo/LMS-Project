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
	private String facCode;
	private String majCode;
	private String isProfessor;
	private Date createdDate;
	private Date updatedDate;
}
