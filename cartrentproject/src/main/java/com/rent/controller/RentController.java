package com.rent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rent")
public class RentController {
	
	//렌트목록
	@RequestMapping("/rentList")
	public String rentList() {
		return "/rent/skList";
	}
}
