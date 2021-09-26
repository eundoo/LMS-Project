package com.project.User;

import java.util.List;
import java.util.Map;

import com.project.Subject.SubjectDTO;

public interface UserService {

	UserVO getUserByUserNo(int userNo);
	
	void requesetEnrolment(int userNo, int subjectNo);

	List<SubjectDTO> getInfoByUserNo(int userNo);
	
	List<ApplicationVO> getAppByUserNo(int userNo);

	ApplicationVO getApplicationByAppNo(int appNo);
	
	void insertApplication(ApplicationVO app);
	
	List<UserDTO> getUserByMajor(String prfsNo);
	
	void updateStatus(ApplicationVO app);
	
	List<UserVO> getAllUsers();
	
	List<EnrolmentVO2> getEnrolmentByUserNo(int userNo);
	
	void insertGrades(GradesVO grades);
	
	List<EnrolmentVO2> getEnrolmentBySbjNo(int sbjNo);
	
	List<SubjectDTO> getScoresByUserNoGroupByCommName(int userNo);
	
	List<SubjectDTO> getScoresByUserNoGroupBySbjDivision(int userNo);
}
