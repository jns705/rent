package com.rent.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mysql.cj.jdbc.SuspendableXAConnection;
import com.rent.domain.BuyVO;
import com.rent.domain.CarVO;
import com.rent.domain.CounselingVO;
import com.rent.domain.MemberVO;
import com.rent.domain.OptionCarVO;
import com.rent.domain.RentVO;
import com.rent.service.CarColorService;
import com.rent.service.CarOptionService;
import com.rent.service.CarService;
import com.rent.service.CounselingService;
import com.rent.service.MemberService;
import com.rent.service.RentService;

@Controller
@RequestMapping("/counseling")
public class CounselingController {
	
	@Resource(name="com.rent.service.MemberService")
	MemberService mMemberService;	
	
	@Resource(name = "com.rent.service.CarColorService")
	CarColorService colorService;
	
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
		
		//rent_id에 해당하는 option_name들을 합친다.
		List<OptionCarVO> optionList = optService.optionDetail(rent_id);
		String options = "";
		for(int i =0; i< optionList.size(); i++) {
			options += optionList.get(i).getOption_name();
			if(optionList.size() > i+1) options+=", ";	
		}
		
		model.addAttribute("car", carService.carDetail(Integer.toString(car_id)));
		model.addAttribute("rent", rent);
		model.addAttribute("option", options);
		
		return "/counseling/counselingInsert";
	}
	@RequestMapping("/insertProc")
	private String counselingInsert(CounselingVO counseling, HttpServletRequest request) throws Exception{
		
		String id = request.getParameter("id");
		if(id == "") {
			counseling.setId("비회원");
		}
		
		counseling.setCounseling_situation("상담 대기중");
		couService.counselingInsert(counseling);
		return "redirect:/rent/rentList";
	}
	
	
	@RequestMapping("/mainProc")
	public String mainProc(HttpServletRequest request, Model model, HttpSession session) throws Exception{
		String id = (String)(session.getAttribute("id"));
		if(id != null) {
		MemberVO list = mMemberService.accountDetail(id);
		String [] address = list.getAddress().split("/");
		String [] tel = list.getTel().split("\\|");
		
		model.addAttribute("address", address);
		model.addAttribute("tel", tel);
		model.addAttribute("detail", list);
		}
		model.addAttribute("sD",request.getParameter("startDate"));
		model.addAttribute("sH",request.getParameter("sHour"));
		model.addAttribute("sM",request.getParameter("sMinute"));
		model.addAttribute("sL",request.getParameter("sLocation"));
		model.addAttribute("eD",request.getParameter("endDate"));
		model.addAttribute("lH",request.getParameter("lHour"));
		model.addAttribute("lM",request.getParameter("lMinute"));
		model.addAttribute("lL",request.getParameter("lLocation"));
		model.addAttribute("carKind",request.getParameter("carKind"));
		model.addAttribute("location", rentService.location());
		return "/counseling/short_rent";
	}
	
	@RequestMapping("/short_rent")
	public String short_rent(Model model, HttpSession session) throws Exception{
		String id = (String)(session.getAttribute("id"));
		if(id != null) {
		MemberVO list = mMemberService.accountDetail(id);
		String [] address = list.getAddress().split("/");
		String [] tel = list.getTel().split("\\|");
		
		model.addAttribute("address", address);
		model.addAttribute("tel", tel);
		model.addAttribute("detail", list);
		}
		model.addAttribute("location", rentService.location());
		return "/counseling/short_rent";
	}
	
	@RequestMapping("/short_rentProc")
	public String short_rentProc(BuyVO buy, Model model, HttpSession session, HttpServletRequest request) throws Exception{
		String id = (String)(session.getAttribute("id"));
		buy.setId(id);
		buy.setColor(rentService.rentDetail(request.getParameter("rent_id")).getColor());
		buy.setCar_id(request.getParameter("rent_id"));
		buy.setOption_name("null");
		buy.setMonth("null");
		buy.setAddress(request.getParameter("zipCode")+"/"+request.getParameter("address")+"/"+request.getParameter("addressDetail"));
		System.out.println(buy);
		
		return "/counseling/short_rent";
	}
	
	@RequestMapping("/short_rentDetail")
	@ResponseBody
	public Map<String, Object> short_rentDetail(Model model, RentVO rent) throws Exception{
		String [] carKind = {"소형", "중형", "준중형", "대형", "RV", "친환경차"};
		Map<String, Object> map = new HashMap<String, Object>();
		for(int i = 0; i < 7; i ++) {
			rent.setCar_id(i);
			map.put("a"+i,rentService.carKindList(rent));
			System.out.println(rentService.carKindList(rent));
		}
		map.put("carKind",  carKind);
		return map;
	}
	
	
	
}
