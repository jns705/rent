package com.rent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rent")
public class RentController {
	
	@RequestMapping("/rentList")
	public String rentList() {
		return "/rent/rentList";
	}
}
