package com.rent.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.BuyVO;
import com.rent.domain.MemberVO;
import com.rent.mapper.BuyMapper;

@Service("com.rent.service.BuyService")
public class BuyService {
	
	@Resource(name="com.rent.mapper.BuyMapper")
	BuyMapper mapper;
	
	//렌트차량 구매하기
	public int rentBuyInsert(BuyVO buy) throws Exception {
		return mapper.rentBuyInsert(buy);
	}
	
	//고객 아이디로 구매리스트 조회(단기전용)
	public List<BuyVO> buyListSId(String id) throws Exception{
		return mapper.buyListSId(id);
}
	
	//구매목록
	public List<BuyVO> buyList() throws Exception { 
		return mapper.buyList();
	}
	
	//예약삭제
	public int rentBuyDelete(int buy_id) throws Exception {
		return mapper.rentBuyDelete(buy_id);
	}
	
	//예약자 상세조회
	public BuyVO buyDetail(int buy_id) throws Exception {
		return mapper.buyDetail(buy_id);
	}
	
	//rent_id를 구매한 사람들의 id를 가져온다
	public List<BuyVO> buyListMember(String rent_id) throws Exception {
		return mapper.buyListMember(rent_id);
	}
	
	//차량 구매한사람들의 아이디로 성별을 나눈다.
	public MemberVO memberGender(String id) throws Exception {
		return mapper.memberGender(id);
	}
	
	//차량 구매한사람들의 아이디로  나이대를 구한다
	public MemberVO memberAge(String id) throws Exception {
		return mapper.memberAge(id);
	}
}
