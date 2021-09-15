package com.project.Subject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.Professor.PrfsService;

@Controller
public class SubjectController {

	@Autowired SubjectService subjectService;
	@Autowired PrfsService prfsService;

}
