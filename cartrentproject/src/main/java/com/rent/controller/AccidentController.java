package com.rent.controller;

import java.sql.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rent.domain.AccidentVO;
import com.rent.service.AccidentService;

@Controller
@RequestMapping("/accident")
public class AccidentController {
	
	@Resource(name="com.rent.service.AccidentService")
	AccidentService service;
	
	@RequestMapping("/list")
	public String accidentList(Model model) throws Exception{
		model.addAttribute("accident", service.accidentList());
		return "/accident/accidentList";
	}
	
	@RequestMapping("/insert")
	public String accidentInsert() throws Exception {
		return "/accident/accidentInsert";
	}
	@RequestMapping("/insertProc")
	private String accidentInsertProc(HttpServletRequest re) throws Exception {
		 AccidentVO accident = new AccidentVO();
		 
		String date = re.getParameter("date1")+"-"+re.getParameter("date2")+"-"+re.getParameter("date3");
		
		accident.setAccident_date(date);
		accident.setAccident_content(re.getParameter("accident_content"));
		accident.setAccident_price(Integer.parseInt(re.getParameter("accident_price")));
		accident.setSpecial_note(re.getParameter("special_note"));
		service.accidentInsert(accident);
		return "redirect:/accident/list";
	}
	
	@RequestMapping("/detail/{accident_id}")
	private String accidentDatail(@PathVariable int accident_id,Model Model) throws Exception {
		Model.addAttribute("detail", service.accidentDetail(accident_id));
		return "/accident/accidentDetail";
	}
	
	@RequestMapping("/update")
	private String accidentUpdate(AccidentVO accident) throws Exception {
		service.accidentUpdate(accident);
		return "redirect:/accident/list";
	}
	
}
