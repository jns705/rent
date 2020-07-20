package com.rent.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.CarColor;
import com.rent.domain.CarVO;
import com.rent.mapper.CarColorMapper;

@Service("com.rent.service.CarColorService")
public class CarColorService {
	
	@Resource(name="com.rent.mapper.CarColorMapper")
	CarColorMapper mapper;
	
	public List<CarColor> colorDetail(String car_id) throws Exception{
		return mapper.colorDetail(car_id);
	}
	
	public CarColor carColor(CarColor color) throws Exception{
		return mapper.carColor(color);
	}
	
	public int colorInsert(CarColor file)throws Exception{
		return mapper.colorInsert(file);
	}
	
	public List<CarVO> colorList() throws Exception{
		return mapper.colorList();
	}
	
	public String colorName(String rent_id) throws Exception{
		return mapper.colorName(rent_id);
	}
}
