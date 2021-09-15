package com.project.User;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.Subject.SubjectDTO;
import com.project.Subject.SubjectService;
import com.project.Subject.SubjectVO;
import com.project.web.annotation.LoginUser;
import com.project.web.utils.SessionUtils;

@Controller
public class UserController {

	@Autowired SubjectService subjectService;
	@Autowired UserService userService;
	
	@GetMapping("/user/class")
	public String grade(@LoginUser UserVO user, Model model) {
		int userNo = user.getUserNo();
		UserVO lodginedUser = userService.getUserByUserNo(userNo);
		model.addAttribute("user", lodginedUser);
		
		List<SubjectDTO> subjects = userService.getInfoByUserNo(userNo);
		model.addAttribute("subjects", subjects);
		
		System.out.println(";;;");
		System.out.println(subjects);
		
		return "/user/class";
	}
	
	@GetMapping("/user/appForm")
	public String form(@LoginUser UserVO user, Model model) {
		int userNo = user.getUserNo();
		UserVO lodginedUser = userService.getUserByUserNo(userNo);
		model.addAttribute("user", lodginedUser);
		List<ApplicationVO> apps = userService.getAppByUserNo(userNo);
		model.addAttribute("apps", apps);
	
		return "/user/appForm";
	}

	@GetMapping("/user/dropOutUpload")
	public String dropOutForm(@LoginUser UserVO user, Model model) {
		
		return "/user/dropOutUpload";
	}
	
	@PostMapping("/user/dropOutUpload")
	public String uploadDropOutForm(@LoginUser UserVO user, ApplicationVO appForm) {
		int userNo = user.getUserNo();
		ApplicationVO app = new ApplicationVO();
		app.setUserNo(userNo);
		app.setKind(appForm.getKind());
		app.setStatus(appForm.getStatus());
		app.setFile(appForm.getFile());
		app.setDescription(appForm.getDescription());
		app.setTitle(appForm.getTitle());
		app.setQuarter(appForm.getQuarter());
		app.setUploadedDate(appForm.getUploadedDate());
		
		userService.insertApplication(app);
		
		return "/user/appForm";
	}
	
	@GetMapping("/user/enrolment")
	public String enrolment(@LoginUser UserVO user, Model model) throws Exception {
		String major = user.getMajCode();
		System.out.println("여긴아닌거잖아");
		List<SubjectDTO> subjects = subjectService.getAllSubjectByMajor(major); 
		model.addAttribute("subjects", subjects);
		System.out.println("---------------");
		System.out.println(subjects);
		System.out.println(user);
		
		return "user/enrolment";
	}
	
	@GetMapping("/user/ermt/request")
	public @ResponseBody ResponseEntity<Void> request(@RequestParam("sbjNo") int sbjNo) {
		try {
			UserVO user = (UserVO) SessionUtils.getAttribute("LOGINED_USER");
			System.out.println("+++");
			System.out.println(user);
			if(user == null) {
				throw new RuntimeException("로그인이 필요합니다.");
			}
			userService.requesetEnrolment(user.getUserNo(), sbjNo);
			System.out.println("성공이냐?");
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (RuntimeException ex) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
