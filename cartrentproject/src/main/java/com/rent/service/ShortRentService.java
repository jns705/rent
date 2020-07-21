package com.rent.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.QNAVO;
import com.rent.domain.ShortRentVO;
import com.rent.mapper.QNAMapper;
import com.rent.mapper.ShortRentMapper;

@Service("com.rent.service.ShortRentService")
public class ShortRentService {
	
	@Resource(name="com.rent.mapper.ShortRentMapper")
	ShortRentMapper mapper;
	
	//글쓰기
	public int shortInsert(ShortRentVO list) throws Exception {
		return mapper.shortInsert(list);
	}
	
	//구매아이디로 조회
	public ShortRentVO shortDetail(int buy_id)throws Exception{
		return mapper.shortDetail(buy_id);
	}
}
