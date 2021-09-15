package com.project.Subject;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SubjectVO {

	public int sbjNo;
	public int prfsNo; 
	public String division;
	public String facCode; //
	public String majCode; //
	public String sbjCode; //
	public String quarter; //
	public int quota;
	public int reqCount;
	public String appliedCredit; //
	public String location; //
	public String classTime; 
	public Date createdDate;
	public Date updatedDate;
	
}
