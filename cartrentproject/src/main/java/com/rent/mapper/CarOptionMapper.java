package com.rent.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rent.domain.OptionCarVO;

@Repository("com.rent.mapper.CarOptionMapper")
public interface CarOptionMapper {
	
	//차옵션 등록
	public int optionInsert(OptionCarVO option) throws Exception;
	
	//차옵션 수정
	public int optionUpdate(OptionCarVO option) throws Exception;
	
	//차옵션 삭제
	public int optionDelete(String car_id) throws Exception;
	
	//차옵션 전체목록
	public List<OptionCarVO> optionList() throws Exception;
	
	//차옵션 상세조회 
	public OptionCarVO optionDetail(String car_id) throws Exception;
}
