package com.rent.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rent.domain.BuyVO;
import com.rent.domain.CarVO;
import com.rent.domain.RentVO;
import com.rent.domain.RentListVO;
import com.rent.domain.RentPriceVO;

@Repository("com.rent.mapper.RentMapper")
public interface RentMapper {
	
	//차량 등록
	public int rentCarInsert(RentVO rent) throws Exception;
	
	//id에따른 렌트 목록 
	public RentVO rentListId(String rent_id)throws Exception;
	
	//차량 수정
	public int rentCarUpdate(RentVO rent) throws Exception;
	
	public int situation(RentVO rent) throws Exception;
	
	//차량 삭제
	public int rentCarDelete(String id) throws Exception;
	
	//차량 전체 목록
	public List<RentVO> rentList() throws Exception;
	
	//차량 상세 조회
	public RentVO rentDetail(String rent_id) throws Exception;
	
	//차 조건 검색
	//public List<RentVO> rentSelect(String 검색할것들) throws Exception;
	
	//buy테이블에서 차량 구매한적 있는지 찾는다
	public List<BuyVO> buyList() throws Exception;
	
	//구매한 차량 정보들을 buy 테이블에 넣는다.
	public int buyInsert(BuyVO buy) throws Exception;
	
	public List<String> location() throws Exception;
	
	//렌트리스트 최종
	public List<RentVO> rentListPro(RentListVO list) throws Exception;
	
	//렌트리스트 최종
	public List<RentVO> newRentListPro(RentListVO list) throws Exception;
	
	//렌트리스트 숫자
	public int rentListCount(RentListVO list) throws Exception;
	
	//렌트 상담 후 대기인원 증가시킨다.
	public int rentStandby(RentVO rent) throws Exception;
	
	public List<CarVO> carKindList(RentVO temp) throws Exception;
	
	//렌트 가격들 등록
	public int priceInsert(RentPriceVO price) throws Exception;
	
	//수정
	public int priceUpdate(RentPriceVO price) throws Exception;
	
	//삭제
	public int priceDelete(String rentPrice_id) throws Exception;
	
	//차량아이디로 금액
	public String getPrice(String car_id)throws Exception;
}
