package com.rent.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	//메인 홈페이지
	@RequestMapping("/main")
	public String main() {
		return "/main";
	}
	
	
	
}
