package com.rent.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.rent.domain.CarColor;
import com.rent.domain.CarVO;
import com.rent.domain.OptionCarVO;

@Repository(value = "com.rent.mapper.CarMapper")
public interface CarMapper {
	
	//차량 등록
	public int carInsert(CarVO car) throws Exception;
	
	//차량색상 등록
	public int colorInsert(CarColor file) throws Exception;
	
	//차량 수정
	public int carUpdate(CarVO car) throws Exception;
	
	//차량 삭제
	public int carDelete(String car_id) throws Exception;
	
	// 차량 삭제하기 전 다른 테이블에 차가 등록 되었는지 확인하는 인터페이스
	public int carBuyCount(String car_id) throws Exception;
	
	// 차량 전체 목록
	public List<CarVO> carList() throws Exception;
	
	// 차량 상세조회
	public CarVO carDetail(String car_id) throws Exception;
	
	//제조사 리스트 조회
	public List<String> manufacturer()throws Exception;
	
	//차량 종류 리스트 조회
	public List<String> carKind(String manufacturer)throws Exception;
	
	//차량 리스트 조회
	public List<String> selectCar(CarVO car)throws Exception;
	
	//연료 리스트 조회
	public List<String> fuel()throws Exception;
	
	//차가 팔려서 사용횟수를 증가시킨다.
	public int carNumberAdding(CarVO car) throws Exception;
	
	//렌트아이디로 차량이름 조회
	public String carName(String car_id)throws Exception;
	
	//차목록(조건검색)
	//public List<CarVO> carListSelect(String 월대여료, 차명, 연료...) throws Exception;
}
