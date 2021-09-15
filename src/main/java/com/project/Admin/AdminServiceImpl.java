package com.project.Admin;

import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.Professor.PrfsDao;
import com.project.Professor.ProfessorVO;
import com.project.Subject.SubjectDao;
import com.project.Subject.SubjectVO;
import com.project.User.UserVO;
import com.project.web.utils.SessionUtils;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired AdminDao adminDao;
	@Autowired SubjectDao subjectDao;
	
	@Override
	public List<CommonCodeVO> getCommCodeByFaculty(String code) throws Exception {
		return adminDao.getCommCodeByFaculty(code);
	}
	
	@Override
	public List<CommonCodeVO> getCommCodeByParentCode(String code) throws Exception {
		return adminDao.getCommCodeByParentCode(code);
	}

	@Override
	public void insertUser(UserVO user) throws Exception {
		
		/*패스워드 암호화*/
		String coveredPassword = DigestUtils.sha256Hex(user.getPassword());
		user.setPassword(coveredPassword);
		adminDao.insertUser(user);
	}
	
	@Override
	public void insertProfessor(ProfessorVO professor) throws Exception {
		
		String coveredPassword = DigestUtils.sha256Hex(professor.getPassword());
		professor.setPassword(coveredPassword);
		adminDao.insertProfessor(professor);
	}
	
	/*로그인*/
	@Override
	public int login(String id, String password, String kind) throws Exception {
		int check = 0;
		if(kind.equals("professor")) {
			ProfessorVO prfs = adminDao.getProfessorById(id);
			if(prfs == null) {
				check = 1;
			} else {
				String coveredPassword = DigestUtils.sha256Hex(password);
				if(!prfs.getPassword().equals(coveredPassword)) {
					check = 1;
				} else {
					check = 2;
					SessionUtils.addAttribute("LOGINED_USER", prfs);
				}
			}
		} 
		if(kind.equals("user")) {
			UserVO user = adminDao.getUserById(id);
			if(user == null) {
				check =1;
			} else {
				String coveredPassword = DigestUtils.sha256Hex(password);
				if(!user.getPassword().equals(coveredPassword)) {
					check = 1;
				} else {
					check = 2;
					SessionUtils.addAttribute("LOGINED_USER", user);
				}
			}
		}
		return check;
	}
	
	@Override
	public void insertSubjects(SubjectVO subject) throws Exception {
		adminDao.insertSubjects(subject);
	}
}
