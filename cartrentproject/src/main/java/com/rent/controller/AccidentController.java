package com.rent.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	private String accidentInsertProc(AccidentVO accident) throws Exception {
		service.accidentInsert(accident);
		return "redirect:/accident/list";
	}
	
	@RequestMapping("/detail/{accident_id}")
	private String accidentDatail(@PathVariable int accident_id,Model Model) throws Exception {
		Model.addAttribute("data", service.accidentDetail(accident_id));
		return "/accident/accidentDetail";
	}
	
	@RequestMapping("/update")
	private String accidentUpdate(AccidentVO accident, HttpServletRequest request) throws Exception {
			
		int count =Integer.parseInt(request.getParameter("count"))+1;
		
			for(int i = 0; i < count; i++) {
				if(request.getParameter("accident_content"+i) != null) {
				AccidentVO acc = new AccidentVO();
				acc.setAccident_id(Integer.parseInt(request.getParameter("accident_id_"+i)));
				acc.setAccident_content(request.getParameter("accident_content"+i));
				acc.setAccident_price(Integer.parseInt(request.getParameter("accident_price"+i)));
				acc.setAccident_date(request.getParameter("accident_date"+i));
				acc.setSpecial_note(request.getParameter("special_note"+i));
				service.accidentUpdate(acc);
				}
			}
		
			
		
		return "redirect:/accident/list";
	}
	
	@RequestMapping("/delete/{accident_id}")
	private String accidentDelete(@PathVariable List accident_id) throws Exception {
		System.out.println("accident_Delete 실행중");
		System.out.println(accident_id);
		
		for(int i=0; i < accident_id.size(); i++) {
			String id = (String) accident_id.get(i);
			service.accidentDelete(Integer.parseInt(id));
		}
		return "redirect:/accident/list";
	}
}
