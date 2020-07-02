package com.rent.mapper;

import org.springframework.stereotype.Repository;

import com.rent.domain.CarColor;

@Repository("com.rent.mapper.CarColorMapper")
public interface CarColorMapper {
	
	//차번호, 색상, 이미지, 파일경로 등록
	public int colorInsert(CarColor car) throws Exception;
	
	//수정
	public int colorUpdate(CarColor car) throws Exception;
	
	//삭제
	public int colorDelete(String color_id) throws Exception;
}
