package com.project.Admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.BeanCopier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.Professor.PrfsService;
import com.project.Professor.ProfessorVO;
import com.project.Subject.SubjectService;
import com.project.Subject.SubjectVO;
import com.project.User.UserVO;
import com.project.web.annotation.LoginUser;

@Controller
public class AdminController {

	@Autowired AdminService adminService;
	@Autowired PrfsService prfsService;
	
	@GetMapping("/layout")
	public String layout() {
		return "/common/layout";
	}
	
	/*대학 메인화면*/
	@RequestMapping(value = "/index")
	public String index() {
		return "index";
	}
	/*등록*/
	/*Admin-학생등록*/
	@GetMapping("/userRegister")
	public String userRegister(Model model) throws Exception {
		List<CommonCodeVO> commonCodes = adminService.getCommCodeByFaculty("FAC0");
		
		System.out.println("--------------------------");
		model.addAttribute("faculty", commonCodes);
		System.out.println(commonCodes);
		return "admin/userRegisterForm";
	}

	@GetMapping("/userRegisterJson")
	@ResponseBody
	public List<CommonCodeVO> userRegisterJson(@RequestParam("facCode")String facCode) throws Exception {
		
		List<CommonCodeVO> codes = adminService.getCommCodeByParentCode(facCode);
		System.out.println("=========================");
		System.out.println(codes);
		return codes;
	}
	
	@PostMapping("/userRegister")
	//@ResponseBody를 하면 새로운 창으로 HTML이 만들어진다!?!?
	public String userRegisterForm(UserVO user) throws Exception {
		UserVO newUser = new UserVO();
		System.out.println(user.getBirth());
		//BeanUtils가 뭐야?
		BeanUtils.copyProperties(user, newUser);
		
		adminService.insertUser(user);
		return "redirect:/admin/main";
	}
	
	@GetMapping("/admin/main")
	public String adminMain() {
		return "admin/main";
	}
	
	/*Admin-교수등록*/
	@GetMapping("/prfsRegister")
	public String prfsRegister(Model model) throws Exception {
		List<CommonCodeVO> commonCodes = adminService.getCommCodeByFaculty("FAC0");
		
		System.out.println("--------------------------");
		model.addAttribute("faculty", commonCodes);
		System.out.println(commonCodes);
		return "admin/prfsRegisterForm";
	}
	
	@GetMapping("/prfsRegisterJson")
	@ResponseBody
	public List<CommonCodeVO> prfsRegisterJson(@RequestParam("facCode")String facCode) throws Exception {
		
		List<CommonCodeVO> codes = adminService.getCommCodeByParentCode(facCode);
		System.out.println("=========================");
		System.out.println(codes);
		return codes;
	}
	
	@PostMapping("/prfsRegister")
	//@ResponseBody를 하면 새로운 창으로 HTML이 만들어진다!?!?
	public String prfsRegisterForm(ProfessorVO professor) throws Exception {
		ProfessorVO newProfessor = new ProfessorVO();
		System.out.println(professor.getBirth());
		BeanUtils.copyProperties(professor, newProfessor);
		
		adminService.insertProfessor(newProfessor);
		return "redirect:/admin/main";
	}
	
	/*로그인*/
	/*User-로그인*/
	@RequestMapping("/user/main")
	public String userMain(@LoginUser UserVO user) throws Exception {
		System.out.println(user);
		return "user/main";
	}

	/*Professor-로그인*/
	@RequestMapping("/professor/main")
	public String prfsMain(@LoginUser ProfessorVO prfs) throws Exception {
		System.out.println(prfs);
		return "professor/main";
	}
	
	@ResponseBody
	@RequestMapping("/login")
	public Map<String, Object> login(@RequestParam("id") String id,
										 @RequestParam("password") String password,
										 @RequestParam("kind") String kind) throws Exception {
		Map<String, Object> login = new HashMap<String, Object>();
		int check = adminService.login(id, password, kind);
		if(check == 1) {
			login.put("check", "FAIL");
		} else if(check == 2) {
			login.put("check", "GRANTED");
		}
		return login;
	}
	
	/*subject-추가*/
	@GetMapping("/subjectRegister")
	public String subjectRegister(Model model) throws Exception {
		List<ProfessorVO> professors = prfsService.getAllProfessors();
		model.addAttribute("professors", professors);
		//학부
		List<CommonCodeVO> faculties = adminService.getCommCodeByFaculty("FAC0");
		model.addAttribute("faculties", faculties);
		
		//위치
		List<CommonCodeVO> locations = adminService.getCommCodeByParentCode("LOC0");
		model.addAttribute("locations", locations);
		
		//학기
		List<CommonCodeVO> quarter = adminService.getCommCodeByParentCode("QUT0");
		model.addAttribute("quarter", quarter);
		
		System.out.println(professors);
		
		return "admin/subjectRegisterForm";
	}
	
	@GetMapping("/subjectRegisterJson")
	@ResponseBody
	public List<CommonCodeVO> subjectRegisterJson(@RequestParam("facCode")String facCode) throws Exception {
		List<CommonCodeVO> codes = adminService.getCommCodeByFaculty(facCode);
		
		return codes;
	}
	
	@PostMapping("/subjectRegister")
	public String subjectRegisterForm(SubjectVO subject) throws Exception{
	SubjectVO newSubject = new SubjectVO();
	BeanUtils.copyProperties(subject, newSubject);
	
	adminService.insertSubjects(subject);
	return "redirect:/admin/main";
	
	}
	
}