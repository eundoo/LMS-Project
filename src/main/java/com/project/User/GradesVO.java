package com.project.User;

import java.util.Date;

import com.project.Subject.SubjectVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GradesVO {
	private int gradeNo;
	private int sbjNo;
	private int acquisitionCredit;
	private String gotGrade;
	private Date createdDate;
	private Date updatedDate;
	private int userNo;
}
