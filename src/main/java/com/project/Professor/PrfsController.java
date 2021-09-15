package com.project.Professor;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.web.annotation.LoginUser;

@Controller
public class PrfsController {

	@Autowired PrfsService prfsService;
	
	@GetMapping("/professor/research")
	public String research(@LoginUser ProfessorVO professor, Model model) {
		model.addAttribute("professor",professor);
		System.out.println(professor.getName());
		return "/professor/research";
	}
	
	@PostMapping("/professor/researchRegister")
	public String researchResgisterForm(ResearchVO research) throws Exception {
		ResearchVO newResearch = new ResearchVO();
		BeanUtils.copyProperties(research, newResearch);
		
		System.out.println(research.getTitle());
		prfsService.insertResearch(research);
		System.out.println(newResearch);
		return "redirect:/professor/main";
	}
	
	@GetMapping("/professor/management")
	public String management() {
		return "/professor/management";
	}
}
