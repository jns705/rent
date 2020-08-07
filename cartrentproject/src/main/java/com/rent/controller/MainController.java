package com.rent.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rent.service.CarService;
import com.rent.service.RentService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Resource(name = "com.rent.service.RentService")
	RentService rentService;

	@Resource(name = "com.rent.service.CarService")
	CarService carService;
	
	//메인 홈페이지
	@RequestMapping("/main")
	public String main(Model model) throws Exception  {
		String [] carKind = {"차량 선택", "소형", "중형", "준중형", "대형", "RV", "친환경차"};
		model.addAttribute("manufacturer", carService.manufacturer());
		model.addAttribute("fuel", carService.fuel());
		model.addAttribute("location", rentService.location());
		model.addAttribute("carKind",  carKind);
		model.addAttribute("location", rentService.location());
		return "/main";
	}
	
	@RequestMapping("/main.do")
	public String mainDo() {
		return "/rent/main.do";
	}
	
	@RequestMapping("/main.doa")
	public String maindoa(Model model)throws Exception {	//제조사 정보 출력을 위한 정보
		model.addAttribute("manufacturer", carService.manufacturer());
		model.addAttribute("fuel", carService.fuel());
		model.addAttribute("location", rentService.location());
		return "/rent/main.doa";
	}
	
	@RequestMapping("/mainma")
	public String mainma(){
		return "/mainma";
	}
	
}
