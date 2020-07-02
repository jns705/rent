package com.rent.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rent.domain.BuyVO;

@Repository("com.rent.mapper.BuyMapper")
public interface BuyMapper {
	
	//구매목록
	public List<BuyVO> buyList() throws Exception;
	
	
}
