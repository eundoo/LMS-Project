package com.project.Admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.Professor.ProfessorVO;
import com.project.Subject.SubjectVO;
import com.project.User.UserVO;

@Mapper
public interface AdminDao {

	 List<CommonCodeVO> getCommCodeByFaculty(String code) throws Exception;

	 List<CommonCodeVO> getCommCodeByParentCode(String code) throws Exception;
	
	 /*register*/
	 void insertUser(UserVO user) throws Exception;
	 
	 void insertProfessor(ProfessorVO professor) throws Exception;
	 
	 ProfessorVO getProfessorById(String prfsId);
	 
	 UserVO getUserById(String studentId);
	 
	 void insertSubjects(SubjectVO subject) throws Exception;
}
