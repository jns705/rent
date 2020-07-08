package com.rent.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rent.domain.CarVO;
import com.rent.service.CarService;

@Controller
@RequestMapping("/rent")
public class RentController {
	
	@Resource(name = "com.rent.service.CarService")
	CarService carService;
	
	//렌트목록
	@RequestMapping("/rentList")
	public String rentList(Model model) throws Exception {
		List<String> list = carService.manufacturer();
		model.addAttribute("manufacturer", list);
		
		return "/rent/skList";
	}
	
	//car Kind
	@RequestMapping("/carKind")
	@ResponseBody
	public Map<String, Object> carKind(@RequestParam String manufacturer)throws Exception{
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("map", carService.carKind(manufacturer));
		return map;
	}
	
	@RequestMapping("/selectCar")
	@ResponseBody
	public Map<String, Object> selectCar(CarVO car)throws Exception{
		Map<String, Object> map = new HashMap<String,Object>();
		System.out.println(carService.selectCar(car));
		map.put("map", carService.selectCar(car));
		return map;
	}
}
