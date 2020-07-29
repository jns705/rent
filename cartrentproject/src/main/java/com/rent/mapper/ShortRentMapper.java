package com.rent.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rent.domain.QNAVO;
import com.rent.domain.ShortRentVO;

@Repository("com.rent.mapper.ShortRentMapper")
public interface ShortRentMapper {
	
	//글쓰기
	public int shortInsert(ShortRentVO list) throws Exception;
	
	//구매아이디로 조회
	public ShortRentVO shortDetail(int buy_id)throws Exception;
	
	//렌트아이디와 시간을 구한다.
	public List<ShortRentVO> getTimeList()throws Exception;
}
