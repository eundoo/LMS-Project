package com.project.Admin;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommonCodeVO {

	private String parentCode;
	private String commonCode;
	private String codeName;
	private int improtance;
	private String createdAdmin;
	private String updatedAdmin;
}
