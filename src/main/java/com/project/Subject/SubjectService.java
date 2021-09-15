package com.project.Subject;

import java.util.List;

public interface SubjectService {
	
	public List<SubjectVO> getAllSubjects() throws Exception;

	List<SubjectDTO> getAllSubjectByMajor(String major);
}
