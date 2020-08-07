package com.rent.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rent.domain.BuyVO;
import com.rent.domain.CarColor;
import com.rent.domain.CarVO;
import com.rent.domain.MemberVO;
import com.rent.domain.OptionCarVO;
import com.rent.domain.PreferenceVO;
import com.rent.domain.RentImageVO;
import com.rent.domain.RentVO;
import com.rent.domain.RentListVO;
import com.rent.service.BuyService;
import com.rent.service.CarColorService;
import com.rent.service.CarOptionService;
import com.rent.service.CarService;
import com.rent.service.MemberService;
import com.rent.service.RentImageService;
import com.rent.service.RentService;

@Controller
@RequestMapping("/rent")
public class RentController {
	@Resource(name="com.rent.service.MemberService")
	MemberService mMemberService;	
	
	@Resource(name = "com.rent.service.CarColorService")
	CarColorService colorService;

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
		System.out.println(list);
		System.out.println(listCount);
		//보여질 아이템 갯수
		int showCount = 6;
		int temp  = listCount/showCount+1;
		//총 페이지 수 = 전체 수 / 보여질 갯수
		int count = temp;
		
		//더보기 버튼이 처음 눌려지는게 아닐 시 리미트 값을 가져온다
		if(list.getLimit() != "" ) count = Integer.parseInt(list.getLimit());
		//총 페이지 수에서 리미트값을 뺀 값에 보여질 아이템 수를 곱한다
		int Ccount = (temp - count +1) * showCount;
		list.setLimit(Integer.toString(Ccount));
		//정보를 통해 출력할 리스트 값을 가져온다.
		list.setTemp("list");
		List<RentVO> rentList 	 = rentService.rentListPro(list);
		
		
		//보낼 값들을 map에 넣는다
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rentList", rentList);
		map.put("count", count);
		map.put("total", listCount);
		map.put("showCount", showCount);
		return map;
	}
	
	//신차 리스트 조건부 출력 ajax
	@RequestMapping("/newRentListProc")
	@ResponseBody
	public Map<String, Object> newRentListProc(RentListVO list, Model model, HttpServletRequest request)throws Exception{
		
		//조회한 정보 갯수
		int listCount = rentService.newRentListPro(list).get(0).getRent_id();
		System.out.println(list);
		System.out.println(listCount);
		//보여질 아이템 갯수
		int showCount = 6;
		int temp  = listCount/showCount+1;
		//총 페이지 수 = 전체 수 / 보여질 갯수
		int count = temp;
		
		//더보기 버튼이 처음 눌려지는게 아닐 시 리미트 값을 가져온다
		if(list.getLimit() != "" ) count = Integer.parseInt(list.getLimit());
		//총 페이지 수에서 리미트값을 뺀 값에 보여질 아이템 수를 곱한다
		int Ccount = (temp - count +1) * showCount;
		list.setLimit(Integer.toString(Ccount));
		//정보를 통해 출력할 리스트 값을 가져온다.
		list.setTemp("list");
		List<RentVO> rentList 	 = rentService.newRentListPro(list);
		
		
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
			//성별
			String gender = buyService.memberInformation(id).getGender();
			//나이   mysql에서 소수점 제거해도 소수점 나옴 ;;
			int age = Integer.parseInt(buyService.memberInformation(id).getDate_of_birth().substring(0, 2));

			System.out.println("======================================");
			//id에 해당하는 성별을 추출해서 preferenceVO에 해당 정보에 1씩 더한다 (성별)
			if(gender.equals("남자")) {
				preference.setMan(preference.getMan()+1);
				System.out.println("pre Man : "+preference.getMan());;
			}else {
				preference.setWomen(preference.getWomen()+1);
				System.out.println("pre Women : "+preference.getWomen());
			}
			//id에 해당하는 정보를 추출해서 preferenceVO에 해당 정보에 1씩 더한다 (나이)
			if(age >=60) {
				preference.setSixties(preference.getSixties()+1);
				System.out.println("60대 "+age);
			}else if(age >=50) {
				preference.setFifteen(preference.getFifteen()+1);
				System.out.println("50대 "+age);
			}else if(age >=40) {
				preference.setForties(preference.getForties()+1);
				System.out.println("40대 "+age);
			}else if(age >=30) {
				preference.setThirties(preference.getThirties()+1);
				System.out.println("30대 "+age);
			}else if(age >=20) {
				preference.setTwenties(preference.getTwenties()+1);
				System.out.println("20대 "+age);
			}else{
				System.out.println("나가");
			}
			//정보를 추출했으니 총인원수에 +1한다.
			preference.setTotal(preference.getTotal()+1);
			
			System.out.println("아이디 : "+id);
			System.out.println("나이 : "+ age);
			System.out.println("성별 : "+ gender);
			System.out.println();
			
		}
		System.out.println("남자 : "+preference.getMan());
		System.out.println("여자 : "+preference.getWomen());
		System.out.println("총인원수 : "+preference.getTotal());
		System.out.println("20대수 : "+preference.getTwenties());
		System.out.println("30대수 : "+preference.getThirties());
		System.out.println("40대수 : "+preference.getForties());
		System.out.println("50대수 : "+preference.getFifteen());
		System.out.println("60대수 : "+preference.getSixties());
		System.out.println("buyIdList.size() : "+ buyIdList.size());
		int percent;
		//차를 구매했던 사람이 없으면 0값을 넣어 0을 나누지 못하게한다.
		if(buyIdList.size() == 0) {
			percent = 0;
		}else {
			percent = 100 / preference.getTotal();
		}
		
		preference.setMan(percent * preference.getMan());
		preference.setWomen(percent * preference.getWomen());
		preference.setTwenties(percent * preference.getTwenties());
		preference.setThirties(percent * preference.getThirties());
		preference.setForties(percent * preference.getForties());
		preference.setFifteen(percent * preference.getFifteen());
		preference.setSixties(percent * preference.getSixties());
		
		model.addAttribute("preference", preference);
		
		return "/rent/rentListDetail";
	}
	
	@RequestMapping("/main.do")
	public String main(Model model) throws Exception{
		String [] carKind = {"차량 선택", "소형", "중형", "준중형", "대형", "RV", "친환경차"};
		model.addAttribute("carKind",  carKind);
		model.addAttribute("location", rentService.location());
		
		return "/rent/main.do";
	}
	
	@RequestMapping("/NewRentList")
	public String NewRentList(Model model) throws Exception{
		return "/rent/NewRentList";
	}
	
	@RequestMapping("/NewRentListDetail/{rent_id}")
	public String NewRentListDetail(Model model, @PathVariable String rent_id, HttpSession session)throws Exception{		
	String id = (String)(session.getAttribute("id"));
	if(id != null) {
	MemberVO list = mMemberService.accountDetail(id);
	String [] address = list.getAddress().split("/");
	String [] tel = list.getTel().split("\\|");
	
	model.addAttribute("address", address);
	model.addAttribute("tel", tel);
	model.addAttribute("detail", list);
	}
		RentVO rent 	= rentService.rentDetail(rent_id);
		String car_id 	= Integer.toString(rent.getCar_id());
		
		model.addAttribute("rent"	, rent);
		model.addAttribute("car"	, carService.carDetail(car_id));
		model.addAttribute("color"	, colorService.colorDetail(car_id));
		model.addAttribute("option"	, opService.optionDetail(rent_id));
		
		return "/rent/NewRentListDetail";
	}
	
	@ResponseBody
	@RequestMapping("/rentColorProc")
	public CarColor rentColorProc(Model model, @RequestParam String rent_id, @RequestParam int index)throws Exception{
		RentVO rent 	= rentService.rentDetail(rent_id);
		String car_id 	= Integer.toString(rent.getCar_id());
		CarColor color = colorService.colorDetail(car_id).get(index);
		color.setCar_id(Integer.parseInt(rent_id));
		color.setColor(rentService.getPrice(car_id));
		
		return color;
	}
	
	
	
}
