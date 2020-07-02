package com.rent.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.mapper.QNAMapper;

@Service("com.rent.service.QNAService")
public class QNAService {
	
	@Resource(name="com.rent.service.QNAMapper")
	QNAMapper mapper;
	
	
	
	
}
