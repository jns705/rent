package com.rent.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rent.domain.BuyVO;
import com.rent.domain.MemberVO;

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
	
	//id에 따른 구매목록(단기전용)
	public List<BuyVO> buyListSId(String id) throws Exception;
	
	//rent_id를 구매한 사람들의 id를 가져온다
	public List<BuyVO> buyListMember(String rent_id) throws Exception;
	
	//차량 구매한사람들의 아이디로 성별을 나눈다.
	public MemberVO memberGender(String id) throws Exception;
	
	//차량 구매한사람들의 아이디로  나이대를 구한다
	public MemberVO memberAge(String id) throws Exception;
	
		
}
