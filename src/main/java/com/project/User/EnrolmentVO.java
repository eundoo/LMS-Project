package com.project.User;

import com.project.Subject.SubjectVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EnrolmentVO {
	private int no;
	private UserVO user;
	private SubjectVO subject;
}
