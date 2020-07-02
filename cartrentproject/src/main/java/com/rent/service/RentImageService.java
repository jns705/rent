package com.rent.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.mapper.RentImageMapper;

@Service("com.rent.service.RentImageService")
public class RentImageService {

	@Resource(name="com.rent.mapper.RentImageMapper")
	RentImageMapper mapper;
	
	
	
	
	
	
	
}
