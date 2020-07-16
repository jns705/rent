package com.rent.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rent.domain.CounselingVO;
import com.rent.domain.OptionCarVO;
import com.rent.domain.RentVO;
import com.rent.service.CarOptionService;
import com.rent.service.CarService;
import com.rent.service.CounselingService;
import com.rent.service.RentService;

@Controller
@RequestMapping("/counseling")
public class CounselingController {
	
	@Resource(name="com.rent.service.CounselingService")
	CounselingService couService;
	
	@Resource(name="com.rent.service.RentService")
	RentService rentService;
	
	@Resource(name = "com.rent.service.CarService")
	CarService carService;
	
	@Resource(name="com.rent.service.CarOptionService")
	CarOptionService optService;
	
	@RequestMapping("/insert/{rent_id}")
	public String counselingSend(Model model, HttpServletRequest request, @PathVariable String rent_id) throws Exception{
		
		String totalPrice = request.getParameter("totalPrice"); // 총합 비용
		String deposit = request.getParameter("deposit"); //보증금
		String month = request.getParameter("term"); // 계약날짜

		model.addAttribute("month", month);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("deposit", deposit);
		
		RentVO rent = rentService.rentDetail(rent_id);
		//rent에서 car_id뽑아낸다.
		int car_id = rent.getCar_id();
		
		model.addAttribute("car", carService.carDetail(Integer.toString(car_id)));
		model.addAttribute("rent", rent);
		
		return "/counseling/counselingInsert";
	}
	@RequestMapping("/insertProc")
	private String counselingInsert(CounselingVO counseling, HttpServletRequest request) throws Exception{
		
		String rent_id = request.getParameter("rent_id");
		
		List<OptionCarVO> optionList = optService.optionDetail(rent_id);
		//rent_id에 해당하는 option_name들을 합친다.
		String options = "";
		for(int i =0; i< optionList.size(); i++) {
			options += optionList.get(i).getOption_name();
			if(optionList.size() > i+1) options+=", ";	
		}
		//회원이면 아이디값 , 비회원이면 비회원 넣기
		String id = request.getParameter("id");
		if(id == "") {
			counseling.setId("비회원");
		}
		
		counseling.setOption_name(options);
		counseling.setCounseling_situation("상담 대기중");
		couService.counselingInsert(counseling);
		
		
		RentVO rent = rentService.rentDetail(rent_id);
		//상담한 차에 상담대기인원수 증가시키기
		int reservation = rent.getStandby_personnel();
		rent.setStandby_personnel(reservation+1);
		
		
		return "redirect:/rent/rentList";
	}
	
	
	
	
	
}
