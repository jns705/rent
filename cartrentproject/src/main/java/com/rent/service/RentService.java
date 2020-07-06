package com.rent.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.RentVO;
import com.rent.mapper.RentMapper;

@Service("com.rent.service.RentService")
public class RentService {
	
	@Resource(name="com.rent.mapper.RentMapper")
	RentMapper mapper;
	
	public int rentCarInsert(RentVO rent) throws Exception{
		return mapper.rentCarInsert(rent);
	}
	
	
	
	
	
	
	
}
