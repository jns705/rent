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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rent.domain.CarVO;
import com.rent.domain.RentVO;
import com.rent.domain.RentListVO;
import com.rent.service.CarService;
import com.rent.service.RentService;

@Controller
@RequestMapping("/rent")
public class RentController {
	
	@Resource(name = "com.rent.service.CarService")
	CarService carService;
	
	@Resource(name = "com.rent.service.RentService")
	RentService rentService;
	
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
	public Map<String, Object> rentListProc(RentListVO list, Model model)throws Exception{
		//조회한 정보 갯수
		int listCount = rentService.rentListCount(list);
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
		List<RentVO> rentList = rentService.rentListPro(list);
		
		//보낼 값들을 map에 넣는다
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rentList", rentList);
		map.put("count", count);
		map.put("total", listCount);
		map.put("showCount", showCount);
		return map;
	}
}
