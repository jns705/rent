package com.rent.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.mapper.BuyMapper;

@Service("com.rent.service.BuyService")
public class BuyService {
	
	@Resource(name="com.rent.mapper.BuyMapper")
	BuyMapper mapper;
	
}
