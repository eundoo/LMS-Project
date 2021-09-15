package com.project.Subject;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SubjectDao {
	
	List<SubjectVO> getAllSubjects() throws Exception;
	
	SubjectVO getSubjectByNo(int no);
	
	void updateSubject(SubjectVO subject);
	
	List<SubjectDTO> getAllSubjectByMajor(String major);
}
