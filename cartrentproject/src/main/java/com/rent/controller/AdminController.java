package com.rent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/carInsertForm")
	public String carInsertForm()throws Exception{
		return "/admin/carInsertForm";
	}
}
