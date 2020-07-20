package com.rent.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rent.domain.BuyVO;
import com.rent.domain.CarVO;
import com.rent.domain.CounselingVO;
import com.rent.domain.OptionCarVO;
import com.rent.domain.RentVO;
import com.rent.service.BuyService;
import com.rent.service.CarOptionService;
import com.rent.service.CarService;
import com.rent.service.CounselingService;
import com.rent.service.MemberService;
import com.rent.service.RentImageService;
import com.rent.service.RentService;

@Controller
@RequestMapping("/buy")
public class BuyController {
	//
	@Resource(name="com.rent.service.BuyService")
	BuyService buyService;
	
	@Resource(name="com.rent.service.CarService")
	CarService carService;
	
	@Resource(name="com.rent.service.RentService")
	RentService rentService;
	
	@Resource(name="com.rent.service.CarOptionService")
	CarOptionService optService;
	
	@Resource(name="com.rent.service.CounselingService")
	CounselingService couService;
	
	@Resource(name="com.rent.service.MemberService")
	MemberService memService;
	
	@Resource(name="com.rent.service.RentImageService")
	RentImageService rentImageService;
	
	@RequestMapping("/insert/{rent_id}")
	private String rentBuyInsert(Model model, HttpServletRequest request, @PathVariable String rent_id) throws Exception {
		
		String id = request.getParameter("id");
		
		if(id != "") {
			model.addAttribute("member" ,memService.memberDetail(id));
		}
		
		String totalPrice = request.getParameter("totalPrice"); // 총합 비용
		String deposit = request.getParameter("deposit"); //보증금
		String month = request.getParameter("term"); // 계약날짜
		String km = request.getParameter("km"); // 주행거리

		model.addAttribute("month", month);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("deposit", deposit);
		model.addAttribute("km", km);
		
		RentVO rent = rentService.rentDetail(rent_id);
		//rent에서 car_id뽑아낸다.
		int car_id = rent.getCar_id();
		
		model.addAttribute("car", carService.carDetail(Integer.toString(car_id)));
		model.addAttribute("rent", rent);
		
		String onOff[] = new String [8]; 
		for(int i = 0; i < 8; i++) {
			onOff[i] = "off";
		}
		List<OptionCarVO> list = optService.optionDetail(rent_id);
		for(int i = 0; list.size() > i ; i++) {
			OptionCarVO List = list.get(i);
			
			if(List.getOption_name().equals("가죽시트"))
				onOff[0] = "on";
			if(List.getOption_name().equals("네비게이션"))
				onOff[1] = "on";
			if(List.getOption_name().equals("ECM룸미러 "))
				onOff[2] = "on";
			if(List.getOption_name().equals("스마트키"))
				onOff[3] = "on";
			if(List.getOption_name().equals("썬루프"))
				onOff[4] = "on";
			if(List.getOption_name().equals("통풍시트"))
				onOff[5] = "on";
			if(List.getOption_name().equals("후방카메라"))
				onOff[6] = "on";
		}
		model.addAttribute("rentImage" , rentImageService.imageList(Integer.parseInt(rent_id)));
		model.addAttribute("count"  , onOff);
		
		return "/buy/rentBuyInsert";
	}
	
	@RequestMapping("/insertProc")
	private String rentBuyInsertProc(HttpServletRequest request, BuyVO buy) throws Exception {
		
		String car_id = request.getParameter("car_id");
		String id = request.getParameter("id");
		String rent_id = request.getParameter("rent_id");
		List<OptionCarVO> optionList = optService.optionDetail(rent_id);
		//rent_id에 해당하는 option_name들을 합친다.
		String options = "";
		for(int i =0; i< optionList.size(); i++) {
			options += optionList.get(i).getOption_name();
			if(optionList.size() > i+1) options+=", ";	
		}
		
		CounselingVO counseling = couService.counselingOK(id);
		if(counseling != null) {
			buy.setCounseling_date(counseling.getCounseling_date());
		}else {
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
			Calendar time = Calendar.getInstance();
			buy.setCounseling_date(format1.format(time.getTime()));
		}
		
		buy.setOption_name(options);
		
		//렌트카를 돈주고 예약 했으니 car테이블에 있는 car_number를 증가시킨다.(사용횟수)
		CarVO car = carService.carDetail(car_id);
		int count = car.getCar_number();
		count +=1;
		car.setCar_number(count);
		
		RentVO rent = rentService.rentDetail(rent_id);
		//상담한 차에 상담대기인원수 증가시키기
		
		int Standby = rent.getStandby_personnel();
		rent.setStandby_personnel(Standby+1);
		rent.setSituation("렌트완료");
		rentService.rentStandby(rent);
		
		carService.carNumberAdding(car);
		buyService.rentBuyInsert(buy);
		
		return "redirect:/rent/rentList";
	}
	
	
	@RequestMapping("/short_rentProc")
	public String short_rentProc(BuyVO buy, Model model, HttpSession session, HttpServletRequest request) throws Exception{
		String id = (String)(session.getAttribute("id"));
		buy.setId(id);
		buy.setColor(rentService.rentDetail(request.getParameter("rent_id")).getColor());
		buy.setCar_id(request.getParameter("rent_id"));
		buy.setOption_name("null");
		buy.setMonth("00");
		buy.setAddress(request.getParameter("zipcode")+"/"+request.getParameter("address")+"/"+request.getParameter("addressDetail"));
		buyService.rentBuyInsert(buy);
		return "/counseling/short_rent";
	}
	
}
