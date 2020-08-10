package com.rent.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.BuyVO;
import com.rent.domain.MemberVO;
import com.rent.domain.PagingVO;
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
	//고객 아이디로 구매리스트 조회(장기전용)
	public List<BuyVO> buyListId(String id) throws Exception{
		return mapper.buyListId(id);
	}
	
	//구매목록
	public List<BuyVO> buyList(HashMap<String, Object> map) throws Exception { 
		return mapper.buyList(map);
	}
	
	//구매목록 총 갯수
	public int buyCount(HashMap<String, Object> map) throws Exception{
		return mapper.buyCount(map);	
	}
	
	//예약삭제
	public int rentBuyDelete(int buy_id) throws Exception {
		return mapper.rentBuyDelete(buy_id);
	}
	
	//예약현황 수정 (대여중, 반납완료)
	public int rentBuyUpdate(BuyVO buy) throws Exception {
		return mapper.rentBuyUpdate(buy);
	}
	
	//예약자 상세조회
	public BuyVO buyDetail(int buy_id) throws Exception {
		return mapper.buyDetail(buy_id);
	}
	
	//rent_id를 구매한 사람들의 id를 가져온다
	public List<BuyVO> buyListMember(String rent_id) throws Exception {
		return mapper.buyListMember(rent_id);
	}
	
	//차량 구매한사람들의 아이디로 성별과 나이를 찾는다.
	public MemberVO memberInformation(String id) throws Exception {
		return mapper.memberInformation(id);
	}
	
	//비회원 이름, 전화번호로 조회
	public List<BuyVO> getDetail(BuyVO buy) throws Exception{
		return mapper.getDetail(buy);
	}
	
	//바이아이디로 리스트 조회
	public List<BuyVO> buyListBuyId(String buy_id)throws Exception{
		return mapper.buyListBuyId(buy_id);
	}
	
	//전화번호로 리스트 출력
	public List<BuyVO> buyListTel(String tel)throws Exception{
		return mapper.buyListTel(tel);
	}
	
	//회원아이디로 구매한 리스트들 출력
	public List<BuyVO> buyListMemberId(String id) throws Exception {
		return mapper.buyListMemberId(id);
	}
	
	//회원탈퇴시 해당아이디에 대한 구매한 정보들을 전부 삭제한다 
	public int secessionDelete(String id) throws Exception {
		return mapper.secessionDelete(id);
	}
}
