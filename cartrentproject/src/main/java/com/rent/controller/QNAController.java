package com.rent.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rent.domain.QNAVO;
import com.rent.service.QNAService;

@Controller
@RequestMapping("/qna")
public class QNAController {
	
	@Resource(name="com.rent.service.QNAService")
	QNAService service;
	
	@RequestMapping("/insert")
	public String qnaInsert() throws Exception {
		return "/qna/qnaInsert";
	}
	@RequestMapping("/insertProc")
	private String qnaInsertProc(QNAVO qna) throws Exception {
		service.qnaInsert(qna);
		return "redirect:/qna/list";
	}
	
	@RequestMapping("/list")
	public String qnaList(Model model) throws Exception {
		model.addAttribute("qnaList", service.qnaList());
		return "/qna/qnaList";
	}
	
	@RequestMapping("/detail/{qna_id}")
	public String qnaDetail(@PathVariable int qna_id,Model model) throws Exception {
		model.addAttribute("detail", service.qnaDetail(qna_id));
		return "/qna/qnaDetail";
	}
	
	@RequestMapping("/update")
	private String qnaUpdate() throws Exception {
		return "redirect:/qna/qnaUpdate";
	}
	
	@RequestMapping("/delete/{qna_id}")
	private String qnaDelete(@PathVariable int qna_id) throws Exception {
		service.qnaDelete(qna_id);
		return "redirect:/qna/list";
	}
}
