package com.rent.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.mapper.RentMapper;

@Service("com.rent.service.RentService")
public class RentService {
	
	@Resource(name="com.rent.service.RentMapper")
	RentMapper mapper;
	
	
	
	
	
	
	
	
}
