package com.project.User;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.FileItem.FileItem;
import com.project.Subject.SubjectDTO;
import com.project.Subject.SubjectDao;
import com.project.Subject.SubjectVO;
import com.project.web.utils.JsonUtils;
import com.project.websocket.handler.AlarmHandler;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	
	@Autowired AlarmHandler alarmHandler;
	@Autowired UserDao userDao;
	@Autowired SubjectDao sbjDao;
	
	@Override
	public void requesetEnrolment(int userNo, int sbjNo) {
		try {
			UserVO user = userDao.getUserByUserNo(userNo);
			
			System.out.println(user);
			SubjectVO subject = sbjDao.getSubjectByNo(sbjNo);
			System.out.println(subject);
			
			EnrolmentVO ermt = new EnrolmentVO();
			ermt.setUser(user);
			ermt.setSubject(subject);
			userDao.insertEnrolment(ermt);
			System.out.println(ermt.getUser().getUserNo());
			
			System.out.println(subject.getReqCount());
			System.out.println(subject.getSbjNo());
			subject.setReqCount(subject.getReqCount() + 1);
			sbjDao.updateSubject(subject);
			System.out.println(subject.getReqCount());
			
			Payload payload  = Payload.builder()
							   .title("수강신청")
							   .message(user.getName() + "님이 수강신청 하였습니다.")
							   .data(subject).build();
			System.out.println(payload);
			alarmHandler.sendMessage(JsonUtils.toJsonText(payload));
		} catch(DataAccessException ex) {
			throw new RuntimeException("수강신청 중 오류가 발생하였습니다.");
		}
	}
	
	@Override
	public UserVO getUserByUserNo(int userNo) {
		return userDao.getUserByUserNo(userNo);
	}
	
	@Override
	public List<SubjectDTO> getInfoByUserNo(int userNo) {
		return userDao.getInfoByUserNo(userNo);
	}
	
	@Override
	public List<ApplicationVO> getAppByUserNo(int userNo) {
		return userDao.getAppByUserNo(userNo);
	}
	/*
	@Override
	public void insertApplication(ApplicationVO app) {
		
		userDao.insertApplication(app);
		FileItem items = app.getUpfiles();

			items.setFileNo(app.getAppNo());
			userDao.insertFileItem(items);
	}
	*/
	@Override
	public void insertApplication(ApplicationVO app) {
		
		userDao.insertApplication(app);

	}
	
	@Override
	public List<UserDTO> getUserByMajor(String prfsMajor) {
		return userDao.getUserByMajor(prfsMajor);
	}
	
	@Override
	public void updateStatus(ApplicationVO app) {
		userDao.updateStatus(app);
		
	}
	
	@Override
	public ApplicationVO getApplicationByAppNo(int appNo) {
		return userDao.getApplicationByAppNo(appNo);
	}
	
	@Override
	public List<UserVO> getAllUsers() {
		return userDao.getAllUsers();
	}

	@Override
	public List<EnrolmentVO2> getEnrolmentByUserNo(int userNo) {
		return userDao.getEnrolmentByUserNo(userNo);
	}
	
	@Override
	public void insertGrades(GradesVO grades) {
		userDao.insertGrades(grades);
	}
	
	@Override
	public List<EnrolmentVO2> getEnrolmentBySbjNo(int sbjNo) {
		return userDao.getEnrolmentBySbjNo(sbjNo);
	}
	
	@Override
	public List<SubjectDTO> getScoresByUserNoGroupByCommName(int userNo) {
		return userDao.getScoresByUserNoGroupByCommName(userNo);
	}
	
	@Override
	public List<SubjectDTO> getScoresByUserNoGroupBySbjDivision(int userNo) {
		return userDao.getScoresByUserNoGroupBySbjDivision(userNo);
	}
}
