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
	
	//예약삭제
	public int rentBuyDelete(int buy_id) throws Exception;
	
	//예약자 상세조회
	public BuyVO buyDetail(int buy_id) throws Exception;
	
}
