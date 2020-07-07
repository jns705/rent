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
	
	public int carDelete(String car_id)throws Exception{
		return mapper.carDelete(car_id);
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
	
	
	public List<OptionCarVO> carOptionDetail(String rent_id) throws Exception{
		return mapper.carOptionDetail(rent_id);
	}
	
	public List<CarVO> carColorList() throws Exception{
		return mapper.carColorList();
	}
	
	public List<OptionCarVO> carOptionList() throws Exception{
		return mapper.carOptionList();
	}
	
	public int carUpdate(CarVO car)throws Exception{
		return mapper.carUpdate(car);
	}
	
	public int carOptionUpdate(OptionCarVO option)throws Exception{
		return mapper.carOptionUpdate(option);
	}
	
	public OptionCarVO selectName(String name)throws Exception{
		return mapper.selectName(name);
	}
}
