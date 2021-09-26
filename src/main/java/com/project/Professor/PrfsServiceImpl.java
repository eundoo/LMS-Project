package com.project.Professor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PrfsServiceImpl implements PrfsService{
	
	@Autowired PrfsDao prfsDao;
	
	@Override
	public void insertResearch(ResearchVO research) throws Exception {
		System.out.println("-----");
		System.out.println(research.getTitle());
		
		prfsDao.insertResearch(research);
	}
	
	@Override
	public List<ProfessorVO> getAllProfessors() throws Exception {
		return prfsDao.getAllProfessors();
	}
	
	@Override
	public ProfessorVO getPrfsByPrfsNo(int prfsNo) {
		return prfsDao.getPrfsByPrfsNo(prfsNo);
	}
}
