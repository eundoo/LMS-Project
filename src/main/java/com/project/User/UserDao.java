package com.project.User;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.Subject.SubjectDTO;

@Mapper
public interface UserDao {

	UserVO getUserByUserNo(int userNo);
	
	void insertEnrolment(EnrolmentVO enrolment);
	
	List<SubjectDTO> getInfoByUserNo(int userNo);
	
	List<ApplicationVO> getAppByUserNo(int userNo);

	ApplicationVO getApplicationByAppNo(int appNo);
	
	void insertApplication(ApplicationVO application);
	
	//void insertFileItem(FileItem fileItem);

	List<UserDTO> getUserByMajor(String prfsMajoe);
	
	void updateStatus(ApplicationVO app); 
	
	List<UserVO> getAllUsers();
	
	List<EnrolmentVO2> getEnrolmentByUserNo(int userNo);
	
	void insertGrades(GradesVO grades);
	
	List<EnrolmentVO2> getEnrolmentBySbjNo(int sbjNo);
	
	List<SubjectDTO> getScoresByUserNoGroupByCommName(int userNo);
	
	List<SubjectDTO> getScoresByUserNoGroupBySbjDivision(int userNo);
	
}
