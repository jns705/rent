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
		int Standby = rent.getStandby_personnel();
		rent.setStandby_personnel(Standby+1);
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
		couService.counselingUpdate(counseling);
		
		String counseling_situation = request.getParameter("counseling_situation");
		if(counseling_situation.equals("예약완료")) {
			//예약완료면 rent테이블 렌트완료, car테이블 car_number -1 하기
			System.out.println("예약완료");
		}else if(counseling_situation.equals("상담완료")) {
			//상담완료면 렌트테이블 상담인원 -1
			System.out.println("상담완료");
		}
		
		return "redirect:/counseling/detail/"+counseling_id;
	}
	
	//상담글 삭제
	@RequestMapping("/delete/{counseling_id}")
	public String counselingDelete(@PathVariable String counseling_id, HttpServletRequest request) throws Exception {
		
		String rent_id = request.getParameter("rent_id");
		RentVO rent = rentService.rentDetail(rent_id);
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
	
	
}
