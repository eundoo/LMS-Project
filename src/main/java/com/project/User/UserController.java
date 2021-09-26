package com.project.User;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.FileItem.FileItem;
import com.project.Subject.SubjectDTO;
import com.project.Subject.SubjectService;
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
		
		List<SubjectDTO> scores = userService.getScoresByUserNoGroupByCommName(userNo);
		model.addAttribute("scores", scores);
		
		List<SubjectDTO> sndScores = userService.getScoresByUserNoGroupBySbjDivision(userNo);
		model.addAttribute("sndScores", sndScores);
		
		System.out.println(sndScores);

		return "user/class";
	}
	
	@GetMapping("/user/appForm")
	public String form(@LoginUser UserVO user, Model model) {
		int userNo = user.getUserNo();
		System.out.println(userNo);
		UserVO lodginedUser = userService.getUserByUserNo(userNo);
		model.addAttribute("user", lodginedUser);
		List<ApplicationVO> apps = userService.getAppByUserNo(userNo);
		System.out.println("==");
		System.out.println(apps);
		if(apps != null) {
			System.out.println("==");
			System.out.println(apps);
			model.addAttribute("apps", apps);
		}
	
		return "user/appForm";
	}

	@GetMapping("/user/dropOutUpload")
	public String dropOutForm(@LoginUser UserVO user, Model model) {
		
		return "user/dropOutUpload";
	}
	
	@PostMapping("/user/dropOutUpload")
	public String uploadDropOutForm(@LoginUser UserVO user, 
									@RequestParam("upFile") String upFile,
									@RequestParam("kind")String kind,
									@RequestParam("description")String discription,
									@RequestParam("quarter")String quarter,
									@RequestParam("title")String title,
									@RequestParam("uploadedDate")String uploadedDate) throws IOException {
		int userNo = user.getUserNo();		

		ApplicationVO app = new ApplicationVO();
		app.setUserNo(userNo);
		app.setKind(kind);
		app.setDescription(discription);
		app.setQuarter(quarter);
		app.setTitle(title);
		app.setUploadedDate(uploadedDate);
		app.setUpFile(upFile);
		userService.insertApplication(app);
		
		return "redirect:appForm";
	}
	
	@GetMapping("/user/enrolment")
	public String enrolment(@LoginUser UserVO user, Model model) throws Exception {
		String major = user.getMajCode();
		List<SubjectDTO> subjects = subjectService.getAllSubjectByMajor(major); 
		model.addAttribute("subjects", subjects);
		List<EnrolmentVO2> ermt = userService.getEnrolmentByUserNo(user.getUserNo());
		model.addAttribute("ermt",ermt);
//수강신청 버튼... 
		return "user/enrolment";
	}
	
	@GetMapping("/user/ermt/request")
	public @ResponseBody ResponseEntity<Void> request(@LoginUser UserVO user, @RequestParam("sbjNo") int sbjNo) {
		try {
			//UserVO user = (UserVO) SessionUtils.getAttribute("LOGINED_USER");
			//System.out.println("+++");
			//System.out.println(user);
			if(user == null) {
				throw new RuntimeException("로그인이 필요합니다.");
			}
			userService.requesetEnrolment(user.getUserNo(), sbjNo);
			//lms_grade에 넣어야됨 
			GradesVO grades = new GradesVO();
			grades.setUserNo(user.getUserNo());
			grades.setSbjNo(sbjNo);
			userService.insertGrades(grades);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (RuntimeException ex) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
