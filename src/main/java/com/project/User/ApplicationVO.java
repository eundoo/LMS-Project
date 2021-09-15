package com.project.User;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApplicationVO {

	private int appNo;
	private int userNo;
	private String kind; //
	private String status; //
	private MultipartFile file; //
	private String description; //
	private String title; //
	private String quarter; //
	private Date uploadedDate; //
	private Date createdDate;
	private Date updatedDate;
	
}
