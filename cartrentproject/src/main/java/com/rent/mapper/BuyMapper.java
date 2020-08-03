package com.rent.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rent.domain.BuyVO;
import com.rent.domain.MemberVO;
import com.rent.domain.PagingVO;

@Repository("com.rent.mapper.BuyMapper")
public interface BuyMapper {
	
	//렌트차량 구매하기
	public int rentBuyInsert(BuyVO buy) throws Exception;
	
	//구매목록
	public List<BuyVO> buyList(PagingVO paging) throws Exception;
	
	//구매목록 총 갯수
	public int buyCount() throws Exception;
	
	//예약삭제
	public int rentBuyDelete(int buy_id) throws Exception;
	
	//예약자 상세조회
	public BuyVO buyDetail(int buy_id) throws Exception;
	
	//id에 따른 구매목록(단기전용)
	public List<BuyVO> buyListSId(String id) throws Exception;
	
	//rent_id를 구매한 사람들의 id를 가져온다
	public List<BuyVO> buyListMember(String rent_id) throws Exception;
	
	//차량 구매한사람들의 아이디로 성별을 나눈다.
	public MemberVO memberInformation(String id) throws Exception;
	
	//전화번호 이름으로 비회원 조회
	public List<BuyVO> getDetail(BuyVO buy) throws Exception;
	
	//바이아이디로 리스트 조회
	public List<BuyVO> buyListBuyId(String buy_id)throws Exception;
	
	//전화번호로 리스트 조회
	public List<BuyVO> buyListTel(String tel)throws Exception;
	
	//회원아이디로 구매한 리스트들 출력
	public List<BuyVO> buyListMemberId(String id) throws Exception;
	
	//회원탈퇴시 해당아이디에 대한 구매한 정보들을 전부 삭제한다 
	public int secessionDelete(String id) throws Exception;
		
}
