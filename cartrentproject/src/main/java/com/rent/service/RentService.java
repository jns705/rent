package com.rent.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.RentVO;
import com.rent.mapper.RentMapper;

@Service("com.rent.service.RentService")
public class RentService {
	
	@Resource(name="com.rent.mapper.RentMapper")
	RentMapper mapper;
	
	public int rentCarInsert(RentVO rent) throws Exception{
		return mapper.rentCarInsert(rent);
	}
	
	public List<RentVO> rentList()throws Exception{
		return mapper.rentList();
	}
	
	//id에따른 렌트 목록
	public RentVO rentListId(String rent_id) throws Exception{
		return mapper.rentListId(rent_id);
	}
	
	//렌트 수정
	public int rentCarUpdate(RentVO rent) throws Exception{
		return mapper.rentCarUpdate(rent);
	}
	
	
	//렌트 삭제
	public int rentCarDelete(String id) throws Exception{
		return mapper.rentCarDelete(id);
	}
	
	
	
	
	
	
}
