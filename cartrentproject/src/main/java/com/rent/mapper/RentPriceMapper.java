package com.rent.mapper;

import org.springframework.stereotype.Repository;

import com.rent.domain.RentPriceVO;

@Repository("com.rent.mapper.RentPriceMapper")
public interface RentPriceMapper {
	
	//렌트 가격들 등록
	public int priceInsert(RentPriceVO price) throws Exception;
}
