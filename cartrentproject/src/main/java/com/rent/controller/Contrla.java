package com.rent.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Contrla {
	private static final Logger logger = LoggerFactory.getLogger(Contrla.class);
	
	@RequestMapping("/test")
	public String test() {
		return "/test";
	}
	
	@RequestMapping("/images")
	public String images() {
		return "/images";
	}
	
	
}
