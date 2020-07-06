package com.rent.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rent.service.AccidentService;

@Controller
@RequestMapping("/accident")
public class AccidentController {
	
	@Resource(name="com.rent.service.AccidentService")
	AccidentService service;
	/*
	@RequestMapping("/list")
	public String accidentList(Model model) throws Exception{
		model.addAttribute("accident", service.accidentList());
		return "/accident/accidentList";
	}
	*/
	@RequestMapping("/insert")
	public String accidentInsert() throws Exception {
		return "/accident/accidentInsert";
	}
	@RequestMapping("/insertProc")
	private String accidentInsertProc(HttpServletRequest request) throws Exception {
		
		return "redirect:/accident/accidentList";
	}
	
}
