package com.rent.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.BuyVO;
import com.rent.mapper.BuyMapper;

@Service("com.rent.service.BuyService")
public class BuyService {
	
	@Resource(name="com.rent.mapper.BuyMapper")
	BuyMapper mapper;
	
	//렌트차량 구매하기
	public int rentBuyInsert(BuyVO buy) throws Exception {
		return mapper.rentBuyInsert(buy);
	}
	
	
	
}
