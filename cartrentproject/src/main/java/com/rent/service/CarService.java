package com.rent.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.CarColor;
import com.rent.domain.CarVO;
import com.rent.domain.OptionCarVO;
import com.rent.mapper.CarMapper;

@Service("com.rent.service.CarService")
public class CarService {
	
	@Resource(name="com.rent.mapper.CarMapper")
	CarMapper mapper;
	
	public int carInsert(CarVO car)throws Exception{
		return mapper.carInsert(car);
	}
	
	public int colorInsert(CarColor file)throws Exception{
		return mapper.colorInsert(file);
	}
	
	public List<CarVO> carList()throws Exception{
		return mapper.carList();
	}
	
	public int optionInsert(OptionCarVO option)throws Exception{
		return mapper.optionInsert(option);
	}
	
	public CarVO carDetail(String id) throws Exception{
		return mapper.carDetail(id);
	}
	
	public CarVO carColorDetail(String id) throws Exception{
		return mapper.carColorDetail(id);
	}
	
	public CarVO carOptionDetail(String id) throws Exception{
		return mapper.carOptionDetail(id);
	}
	
	public List<CarVO> carColorList() throws Exception{
		return mapper.carColorList();
	}
	
	public List<CarVO> carOptionList() throws Exception{
		return mapper.carOptionList();
	}
}
