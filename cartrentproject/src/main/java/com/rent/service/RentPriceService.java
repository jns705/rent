package com.rent.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.mapper.RentPriceMapper;

@Service("com.rent.service.RentPriceService")
public class RentPriceService {
	
	@Resource(name="com.rent.service.RentPriceMapper")
	RentPriceMapper mapper;
	
	
	
	
	
	
	
	
}
