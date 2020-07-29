package com.rent.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rent.service.CommentService;
import com.rent.service.ServiceCenterService;

@Controller
public class ServiceCenterController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	//@Resource(name = "com.rent.service.ServiceCenterService")
	ServiceCenterService service;
	
	//고객센터 공지사항
	@RequestMapping("/serviceCenter")
	public String serviceCenter() {
		logger.info("serviceConter");
		return "/serviceCenter";
	}
	
	//고객상담
	@RequestMapping("/serviceCenter/customerConsultation")
	public String customerConsultation() {
		logger.info("customerConsultation");
		return "/service/customerConsultation";
	}
	
	//자주찾는질문
	@RequestMapping("/serviceCenter/faq")
	public String frequentlyAskedQuestions() {
		logger.info("frequentlyAskedQuestions");
		return "/service/faq";
	}
	
	//공지사항 등록폼
	@RequestMapping("/serviceCenter/noticeInsertForm")
	public String noticeInsertForm() {
		logger.info("noticeInsertForm");
		return "/service/noticeInsert";
	}
	//공지사항 등록
	@RequestMapping("/serviceCenter/noticeInsert")
	public String noticeInsert() {
		return "/serviceCenter";
	}
	
	//공지사항 상세글
	@RequestMapping("/serviceCenter/noticeDetail")
	public String noticeDetail() {
		return "/service/noticeDetail";
	}
	
	//공지사항 업데이트폼
	@RequestMapping("/serviceCenter/noticeUpdateForm")
	public String noticeUpdateForm() {
		return "/service/noticeUpdate";
	}
	//공지사항 업데이트
	@RequestMapping("/serviceCenter/noticeUpdate")
	public String noticeUpdate() {
		return "/service/noticeDetaile";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
