package com.project.Professor;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.User.ApplicationVO;
import com.project.User.UserDTO;
import com.project.User.UserService;
import com.project.web.annotation.LoginUser;

@Controller
public class PrfsController {

	@Autowired PrfsService prfsService;
	@Autowired UserService userService;
	
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
	
	//Map을 써야할때랑 DTO를 써야할때 차이 resultMap이뭔지 공부
	@GetMapping("/professor/management")
	public String management(@LoginUser ProfessorVO prfs, Model model) {
		
		System.out.println("메이져");
		System.out.println(prfs.getMajCode());
		
		List<UserDTO> user = userService.getUserByMajor(prfs.getMajCode());
		model.addAttribute("user", user);
		
		System.out.println("여기");
		System.out.println(user);
		
		return "/professor/management";
	}
	
	//http://localhost/professor/management/json?no=10026 라고 쳤을때 script에 ajax를 하지 않아도 
	//그 Json형식으로 뜸
	@GetMapping("/professor/management/json")
	@ResponseBody
	public List<ApplicationVO> managementJson(@LoginUser ProfessorVO prfs, 
											  @RequestParam(name="no", required=true) int stdNo) {
		
		List<ApplicationVO> app = userService.getAppByUserNo(stdNo);

		return app;
	}
	
	@GetMapping("/professor/management/update")
	@ResponseBody
	public ApplicationVO managementDetail(@LoginUser ProfessorVO prfs, 
								   @RequestParam("status")String status,
								   @RequestParam("appNo")int appNo) {
		
		ApplicationVO app = userService.getApplicationByAppNo(appNo);
		app.setStatus(status);
		
		userService.updateStatus(app);
		
		return app;
	}
}
