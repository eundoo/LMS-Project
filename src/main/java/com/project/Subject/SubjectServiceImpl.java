package com.project.Subject;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubjectServiceImpl implements SubjectService{
	
	@Autowired SubjectDao subjectDao;
	
	@Override
	public List<SubjectVO> getAllSubjects() throws Exception {
		return subjectDao.getAllSubjects();
	}

	@Override
	public List<SubjectDTO> getAllSubjectByMajor(String major) {
		return subjectDao.getAllSubjectByMajor(major);
	}
}
