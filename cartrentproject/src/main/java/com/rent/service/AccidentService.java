package com.rent.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.mapper.AccidentMapper;

@Service("com.rent.service.AccidentService")
public class AccidentService {
	
	@Resource(name="com.rent.mapper.AccidentMapper")
	AccidentMapper mapper;
	
	
	
	
	
	
	
	
	
}
