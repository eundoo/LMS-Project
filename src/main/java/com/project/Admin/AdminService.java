package com.project.Admin;

import java.util.List;
import java.util.Map;

import com.project.Professor.ProfessorVO;
import com.project.Subject.SubjectVO;
import com.project.User.UserVO;

public interface AdminService {

	 List<CommonCodeVO> getCommCodeByFaculty(String code) throws Exception;
	 
	 List<CommonCodeVO> getCommCodeByParentCode(String code) throws Exception;

	 void insertUser(UserVO user) throws Exception;
	 
	 void insertProfessor(ProfessorVO professor) throws Exception;
	 
	 int login(String id, String password, String kind) throws Exception;

	 void insertSubjects(SubjectVO subject) throws Exception;
}
