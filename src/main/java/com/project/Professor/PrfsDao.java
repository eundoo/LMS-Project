package com.project.Professor;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PrfsDao {

	void insertResearch(ResearchVO research) throws Exception;
	
	List<ProfessorVO> getAllProfessors() throws Exception;
}
