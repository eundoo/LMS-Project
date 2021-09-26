package com.project.User;

import java.util.Date;
import java.util.List;

import com.project.FileItem.FileItem;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApplicationVO {

	private int appNo;
	private int userNo; //
	private String kind; //
	private String status; 
	private String upFile; //
	private String description; //
	private String title; //
	private String quarter; //
	private String uploadedDate; //
	private Date createdDate;
	private Date updatedDate;
	//8-3-1 1:00:00
}
