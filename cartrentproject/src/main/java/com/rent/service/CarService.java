package com.rent.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
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
	
	public List<CarVO> carList()throws Exception{
		return mapper.carList();
	}
	
	public CarVO carDetail(String id) throws Exception{
		return mapper.carDetail(id);
	}
	
	public int carUpdate(CarVO car)throws Exception{
		return mapper.carUpdate(car);
	}
	
	public List<String> manufacturer()throws Exception{
		return mapper.manufacturer();
	}
	
	public List<String> carKind(String manufacturer)throws Exception{
		return mapper.carKind(manufacturer);
	}
	
	public List<String> selectCar(CarVO car)throws Exception{
		return mapper.selectCar(car);
	}
	
	public List<String> fuel()throws Exception{
		return mapper.fuel();
	}
	
	//차가 팔려서 사용횟수를 빼고 예약취소, 반남할땐 증가시킨다.
	public int carNumberAdding(CarVO car) throws Exception {
		return mapper.carNumberAdding(car);
	}
}
