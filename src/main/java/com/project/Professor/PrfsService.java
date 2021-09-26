package com.project.Professor;

import java.util.List;

public interface PrfsService {

	void insertResearch(ResearchVO research) throws Exception;
	
	List<ProfessorVO> getAllProfessors() throws Exception;
	
	ProfessorVO getPrfsByPrfsNo(int prfsNo);
}
