package com.rent.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.CarColor;
import com.rent.mapper.CarColorMapper;

@Service("com.rent.service.CarColorService")
public class CarColorService {
	
	@Resource(name="com.rent.mapper.CarColorMapper")
	CarColorMapper mapper;
	
	public List<CarColor> carColorDetail(String car_id) throws Exception{
		return mapper.carColorDetail(car_id);
	}
}
