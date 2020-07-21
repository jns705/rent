package com.rent.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rent.domain.BuyVO;

@Repository("com.rent.mapper.BuyMapper")
public interface BuyMapper {
	
	//렌트차량 구매하기
	public int rentBuyInsert(BuyVO buy) throws Exception;
	
	//구매목록
	public List<BuyVO> buyList() throws Exception;
	
	//id에 따른 구매목록(단기전용)
	public List<BuyVO> buyListSId(String id) throws Exception;
	
	
}
