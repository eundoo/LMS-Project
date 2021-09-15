package com.project.User;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.Subject.SubjectDTO;

@Mapper
public interface UserDao {

	UserVO getUserByUserNo(int userNo);
	
	void insertEnrolment(EnrolmentVO enrolment);
	
	List<SubjectDTO> getInfoByUserNo(int userNo);
	
	List<ApplicationVO> getAppByUserNo(int userNo);
	
	void insertApplication(ApplicationVO application);
}
