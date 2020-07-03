package com.rent.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.mapper.CarColorMapper;

@Service("com.rent.service.CarColorService")
public class CarColorService {
	
	@Resource(name="com.rent.mapper.CarColorMapper")
	CarColorMapper mapper;
}
