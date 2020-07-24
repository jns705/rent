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
import com.rent.domain.BuyVO;
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
		int standby = rent.getStandby_personnel();
		rent.setStandby_personnel(standby+1);
		rent.setSituation("상담중");
		rentService.rentStandby(rent);
		
		return "redirect:/rent/rentList";
	}
	
	//상담 전체 목록
	@RequestMapping("/list")
	public String counselingList(Model model) throws Exception {
		model.addAttribute("counselingList",couService.counselingList());
		return "/counseling/counselingList";
	}
	
	//전체목록(조건검색)
	@RequestMapping("/searchList/{counseling_situation}")
	public String searchList(@PathVariable String counseling_situation, Model model) throws Exception {
		model.addAttribute("counselingList", couService.searchList(counseling_situation));
		return "/counseling/counselingList";
	}
	
	//상담글 상세보기
	@RequestMapping("/detail/{counseling_id}")
	public String counselingDetail(@PathVariable String counseling_id, Model model) throws Exception {
		model.addAttribute("detail", couService.counselingDetail(counseling_id));
		return "/counseling/counselingDetail";
	}
	
	//상담글 상태 현황 변경(상담완료, 예약완료)
	@RequestMapping("/update")
	public String counselingUpdate(CounselingVO counseling, HttpServletRequest request) throws Exception {
		String counseling_id = request.getParameter("counseling_id");
		String rent_id = request.getParameter("rent_id_"+counseling_id);
		RentVO rent = rentService.rentDetail(rent_id);
		couService.counselingUpdate(counseling);
		
		String counseling_situation = request.getParameter("counseling_situation");
		if(counseling_situation.equals("예약완료")) {
			//예약완료면 rent테이블 렌트완료, car테이블 car_number -1 하기
			String id = Integer.toString( rent.getCar_id());
			CarVO car = carService.carDetail(id);
			int car_count= car.getCar_number();
			car_count -=1;
			if(car_count == -1) car_count = 0; //혹시 모르니 만듬
			car.setCar_number(car_count);
			
			carService.carNumberAdding(car);
			System.out.println("예약완료");
		}else if(counseling_situation.equals("상담완료")) {
			
			int standby = rent.getStandby_personnel();
			//standby가 1일경우 상담인원이 0명이 됨 그래서 예약가능으로 바꾸기
			if(standby == 1 ) rent.setSituation("예약가능");
			
			//상담완료면 렌트테이블 상담인원 -1
			rent.setStandby_personnel(standby-1);
			
			rentService.rentStandby(rent);
			System.out.println("상담완료");
		}
		
		return "redirect:/counseling/detail/"+counseling_id;
	}
	
	//상담글 삭제
	@RequestMapping("/delete/{counseling_id}")
	public String counselingDelete(@PathVariable String counseling_id, HttpServletRequest request) throws Exception {
		
		String rent_id = request.getParameter("rent_id_"+counseling_id);
		RentVO rent = rentService.rentDetail(rent_id);
		
		System.out.println(rent_id);
		
		//상담한 차에 상담대기인원수 1빼기
		int standby = rent.getStandby_personnel();
		
		if(standby == 1) {
			System.out.println("standby==1 : "+standby);
			rent.setStandby_personnel(standby-1);
			rent.setSituation("예약가능");
		}else if(standby == 0) { //혹시 모르니 만들어둠
			System.out.println("standby==0 : "+standby);
			rent.setStandby_personnel(0);
			rent.setSituation("예약가능");
		}else {
			System.out.println("ELSE: standby : "+standby);
			rent.setStandby_personnel(standby-1);
		}
		
		rentService.rentStandby(rent);
		couService.counselingDelete(counseling_id);
		
		return "redirect:/counseling/list";
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
	public String short_rent(Model model, HttpSession session, @RequestParam(defaultValue = "서울지점") String sL) throws Exception{
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
		model.addAttribute("sL",sL);
		return "/counseling/short_rent";
	}
	
	@RequestMapping("/short_rentProc")
	public String short_rentProc(BuyVO buy, Model model, HttpSession session, HttpServletRequest request) throws Exception{
		String id = (String)(session.getAttribute("id"));
		buy.setId(id);
		buy.setColor(rentService.rentDetail(request.getParameter("rent_id")).getColor());
		buy.setRent_id(request.getParameter("rent_id"));
		buy.setOption_name("null");
		buy.setMonth("null");
		buy.setAddress(request.getParameter("zipCode")+"/"+request.getParameter("address")+"/"+request.getParameter("addressDetail"));
		System.out.println(buy);
		
		return "/counseling/short_rent";
	}
	
	@RequestMapping("/short_rentDetail")
	@ResponseBody
	public Map<String, Object> short_rentDetail(Model model, RentVO rent, HttpSession session) throws Exception{
		String [] carKind = {"소형", "중형", "준중형", "대형", "RV", "친환경차"};
		Map<String, Object> map = new HashMap<String, Object>();
		for(int i = 0; i < 7; i ++) {
			rent.setCar_id(i);
			map.put("a"+i,rentService.carKindList(rent));
		}
		map.put("carKind",  carKind);
		return map;
	}
	
	@RequestMapping("/newRent")
	public String newRent(CounselingVO list, HttpSession session) throws Exception{
		list.setId((String)session.getAttribute("id"));
		if(session.getAttribute("id")==null || session.getAttribute("id").equals("")) list.setId("비회원");
		list.setOption_name("파퓰러 패키지,빌트인 캠 패키지");
		list.setCounseling_situation("상담 대기중");
		couService.counselingInsert(list);
		return "/counseling/short_rent";
	}
	
	
	
}
