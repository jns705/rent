package com.rent.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.RentImageVO;
import com.rent.mapper.RentImageMapper;

@Service("com.rent.service.RentImageService")
public class RentImageService {

	@Resource(name="com.rent.mapper.RentImageMapper")
	RentImageMapper mapper;
	
	//렌트 이미지 등록
	public int imageInsert(RentImageVO file)throws Exception{
		return mapper.imageInsert(file);
	}
	
	//렌트 이미지 목록
	public List<RentImageVO> imageList(int rent_id)throws Exception{
		return mapper.imageList(rent_id);
	}
	
	//렌트 이미지 총 숫자
	public int imageCount(int rent_id)throws Exception{
		return mapper.imageCount(rent_id);
	}
	
	
	
	
}
