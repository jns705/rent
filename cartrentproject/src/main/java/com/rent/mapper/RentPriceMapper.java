package com.rent.mapper;

import com.rent.domain.RentPriceVO;

public interface RentPriceMapper {
	
	//렌트 가격들 등록
	public int priceInsert(RentPriceVO price) throws Exception;
}
