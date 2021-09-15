package com.project.User;

import java.util.List;

import com.project.Subject.SubjectDTO;

public interface UserService {

	UserVO getUserByUserNo(int userNo);
	
	void requesetEnrolment(int userNo, int subjectNo);

	List<SubjectDTO> getInfoByUserNo(int userNo);
	
	List<ApplicationVO> getAppByUserNo(int userNo);
	
	void insertApplication(ApplicationVO application);
}
