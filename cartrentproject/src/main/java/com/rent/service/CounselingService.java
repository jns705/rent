package com.rent.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.mapper.CounselingMapper;

@Service("com.rent.service.CounselingService")
public class CounselingService {
	
	@Resource(name="com.rent.mapper.CounselingMapper")
	CounselingMapper mapper;
	
	
	
	
	
}
