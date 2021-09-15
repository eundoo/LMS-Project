package com.project.Subject;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SubjectDTO {

	public String sbjNo;
	public String division;
	public String faculty;
	public String major;
	public String quarter;
	public String subject;
	public String prfsName;
	public String location;
	public int acquisitionCredit;
	public String gotGrade;
	public String sbjCode;
	public String appliedCredit;
	public String reqCount;
	public String quota;
	public String classTime; 
	public Date createdDate;
	public Date updatedDate;
}
