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
	
	/**
	 * 차량 등록
	 * @param CarTable
	 */
	public int carInsert(CarVO car) throws Exception;
	
	//차량색상 등록
	public int colorInsert(CarColor file) throws Exception;
	
	public int optionInsert(OptionCarVO option)throws Exception;
	
	//이름에 따른 차량 옵션 조회
	public OptionCarVO selectName(String name)throws Exception;
	
	//차 옵션 업데이트
	public int carOptionUpdate(OptionCarVO option)throws Exception;
	
	/**
	 * 차량 수정
	 * @param CarTable
	 */
	public int carUpdate(CarVO car) throws Exception;
	
	/**
	 * 차량 삭제
	 * @param CarTable
	 */
	public int carDelete(String car_id) throws Exception;
	
	/**
	 * 차량 삭제하기 전 다른 테이블에 차가 등록 되었는지 확인하는 인터페이스
	 * @param CarTable
	 */
	public int carBuyCount(String car_id) throws Exception;
	
	/**
	 * 차량 전체 목록
	 * @param CarTable
	 */
	public List<CarVO> carList() throws Exception;
	
	/**
	 * 차량 상세조회
	 * @param CarTable
	 */
	public CarVO carDetail(String car_id) throws Exception;
	
	//차량 색상 상세 조회
	public CarVO carColorDetail(String car_id) throws Exception;
	
	//차량 옵션 상세 조회
	public List<OptionCarVO> carOptionDetail(String rent_id) throws Exception;
	
	//차량 색상 조회
	public List<CarVO> carColorList() throws Exception;
	
	//차량 옵션 조회
	public List<OptionCarVO> carOptionList() throws Exception;
	
	public List<String> manufacturer()throws Exception;
	
	//차량 검색
	public List<String> carKind(String manufacturer)throws Exception;
	
	public List<String> selectCar(CarVO car)throws Exception;
	//차목록(조건검색)
	//public List<CarVO> carListSelect(String 월대여료, 차명, 연료...) throws Exception;
}
