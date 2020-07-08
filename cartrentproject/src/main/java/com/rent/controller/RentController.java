package com.rent.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rent.service.CarService;

@Controller
@RequestMapping("/rent")
public class RentController {
	
	@Resource(name = "com.rent.service.CarService")
	CarService carService;
	
	//렌트목록
	@RequestMapping("/rentList")
	public String rentList(Model model) {
		return "/rent/skList";
	}
}
