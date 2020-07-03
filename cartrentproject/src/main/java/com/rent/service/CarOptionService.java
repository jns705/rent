package com.rent.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.mapper.CarOptionMapper;

@Service("com.rent.service.CarOptionService")
public class CarOptionService {
	
	@Resource(name="com.rent.service.CarOptionMapper")
	CarOptionMapper mapper;
	
	
	
	
}
