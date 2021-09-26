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
	public Double gotGrade;
	public String sbjCode;
	public int appliedCredit;
	public int reqCount;
	public int quota;
	public String classTime; 
	public Date createdDate;
	public Date updatedDate;
}
