package com.rent.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.mapper.CarMapper;

@Service("com.rent.service.CarService")
public class CarService {
	
	@Resource(name="com.rent.mapper.CarMapper")
	CarMapper mapper;
}
