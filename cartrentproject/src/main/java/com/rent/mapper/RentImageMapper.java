package com.rent.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rent.domain.RentImageVO;

@Repository("com.rent.mapper.RentImageMapper")
public interface RentImageMapper {
	
	//렌트카의 이미지, 이미지경로를 등록한다
	public int imageInsert(RentImageVO car) throws Exception;
	
	//렌트 이미지 조회
	public List<RentImageVO> imageList(int rent_id) throws Exception;
	
	//렌트 총 숫자
	public int imageCount(int rent_id)throws Exception;
	
	//수정
	public int imageUpdate(RentImageVO car) throws Exception;
	
	//삭제
	public int imageDelete(String rent_id) throws Exception;
}
