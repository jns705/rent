package com.rent.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rent.domain.BuyVO;
import com.rent.domain.CarVO;
import com.rent.domain.MemberVO;
import com.rent.domain.OptionCarVO;
import com.rent.domain.PreferenceVO;
import com.rent.domain.RentImageVO;
import com.rent.domain.RentVO;
import com.rent.domain.RentListVO;
import com.rent.service.BuyService;
import com.rent.service.CarOptionService;
import com.rent.service.CarService;
import com.rent.service.RentImageService;
import com.rent.service.RentService;

@Controller
@RequestMapping("/rent")
public class RentController {
	
	@Resource(name = "com.rent.service.CarService")
	CarService carService;
	
	@Resource(name = "com.rent.service.RentService")
	RentService rentService;
	
	@Resource(name="com.rent.service.RentImageService")
	RentImageService rentImageService;
	
	@Resource(name="com.rent.service.CarOptionService")
	CarOptionService opService;
	
	@Resource(name="com.rent.service.BuyService")
	BuyService buyService;
	
	//렌트목록
	@RequestMapping("/rentList")
	public String rentList(Model model) throws Exception {
		//제조사 정보 출력을 위한 정보
		model.addAttribute("manufacturer", carService.manufacturer());
		//연료 정보 출력을 위한 정보
		model.addAttribute("fuel", carService.fuel());
		//지역 정보 출력을 위한 정보
		model.addAttribute("location", rentService.location());
		return "/rent/skList";
	}
	
	//제조사 출력 ajax
	@RequestMapping("/carKind")
	@ResponseBody
	public Map<String, Object> carKind(@RequestParam String manufacturer)throws Exception{
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("map", carService.carKind(manufacturer));
		return map;
	}

	//차유형 출력 ajax
	@RequestMapping("/selectCar")
	@ResponseBody
	public Map<String, Object> selectCar(CarVO car)throws Exception{
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("map", carService.selectCar(car));
		return map;
	}
	
	//차 리스트 조건부 출력 ajax
	@RequestMapping("/rentListProc")
	@ResponseBody
	public Map<String, Object> rentListProc(RentListVO list, Model model, HttpServletRequest request)throws Exception{
		List<String> location 	= new ArrayList<String>();
		List<String> fuel 		= new ArrayList<String>();
		for(int i = 0; i < 5; i ++) {
			if(!request.getParameter("l"+i).equals(""))
			location.add(request.getParameter("l"+i));
			list.setLocation(location);
		}
		for(int i = 0; i < 5; i ++) {
			if(!request.getParameter("f"+i).equals(""))
			fuel.add(request.getParameter("f"+i));
			list.setFuel(fuel);
		}
		
		//조회한 정보 갯수
		int listCount = rentService.rentListPro(list).get(0).getRent_id();
		System.out.println(listCount);
		//보여질 아이템 갯수
		int showCount = 6;
		int temp  = listCount/showCount;
		//총 페이지 수 = 전체 수 / 보여질 갯수
		int count = listCount/showCount;
		
		//더보기 버튼이 처음 눌려지는게 아닐 시 리미트 값을 가져온다
		if(list.getLimit() != "" ) count = Integer.parseInt(list.getLimit());
		//총 페이지 수에서 리미트값을 뺀 값에 보여질 아이템 수를 곱한다
		int Ccount = (temp - count +1) * showCount;
		list.setLimit(Integer.toString(Ccount));
		//정보를 통해 출력할 리스트 값을 가져온다.
		list.setTemp("list");
		List<RentVO> rentList = rentService.rentListPro(list);
		
		//보낼 값들을 map에 넣는다
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rentList", rentList);
		map.put("count", count);
		map.put("total", listCount);
		map.put("showCount", showCount);
		return map;
	}
	
	//차량 리스트 상세정보
	@RequestMapping("/rentListDetail/{rent_id}")
	public String rentListDetail(@PathVariable String rent_id, Model model)throws Exception{
		RentVO rent = new RentVO();
		rent = rentService.rentDetail(rent_id);
		
		String onOff[] = new String [8]; 
		for(int i = 0; i < 8; i++) {
			onOff[i] = "off";
		}
		List<OptionCarVO> list = opService.optionDetail(rent_id);
		System.out.println(list);
		for(int i = 0; list.size() > i ; i++) {
			OptionCarVO List = list.get(i);
			
			if(List.getOption_name().equals("가죽시트")) 	onOff[0] = "on";
			if(List.getOption_name().equals("네비게이션")) 	onOff[1] = "on";
			if(List.getOption_name().equals("ECM룸미러")) 	onOff[2] = "on";
			if(List.getOption_name().equals("스마트키")) 	onOff[3] = "on";
			if(List.getOption_name().equals("썬루프")) 		onOff[4] = "on";
			if(List.getOption_name().equals("통풍시트")) 	onOff[5] = "on";
			if(List.getOption_name().equals("후방카메라")) 	onOff[6] = "on";
		}
		model.addAttribute("rent"   	, rent);
		model.addAttribute("car"    	, carService.carDetail(Integer.toString(rent.getCar_id())));
		model.addAttribute("rentImage" 	, rentImageService.imageList(Integer.parseInt(rent_id)));
		model.addAttribute("oList"  	, list);
		model.addAttribute("count"  	, onOff);
		
		PreferenceVO preference = new PreferenceVO();
		List<BuyVO> buyIdList = new ArrayList<BuyVO>();
		buyIdList = buyService.buyListMember(rent_id); //id가져옴
		for(int i=0; i < buyIdList.size(); i++) {
			String id = buyIdList.get(i).getId();
			
			System.out.println("아이디 : "+id);
			System.out.println("나이 : "+ buyService.memberAge(id));
			System.out.println("성별 : "+ buyService.memberGender(id));
			
			
		}
		
		return "/rent/rentListDetail";
	}
	
	@RequestMapping("/main.do")
	public String main(Model model) throws Exception{
		String [] carKind = {"차량 선택", "소형", "중형", "준중형", "대형", "RV", "친환경차"};
		model.addAttribute("carKind",  carKind);
		model.addAttribute("location", rentService.location());
		
		return "/rent/main.do";
	}
	
	

}
