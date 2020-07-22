package com.rent.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.CarVO;
import com.rent.domain.RentImageVO;
import com.rent.domain.RentVO;
import com.rent.domain.RentListVO;
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
	
	public int situation(RentVO rent) throws Exception{
		return mapper.situation(rent);
	}
	
	//렌트 조회
	public RentVO rentDetail(String rent_id) throws Exception{
		return mapper.rentDetail(rent_id);
	}
	
	public List<String> location() throws Exception{
		return mapper.location();
	}
	
	public List<RentVO> rentListPro(RentListVO list) throws Exception{
		return mapper.rentListPro(list);
	}

	public List<RentVO> newRentListPro(RentListVO list) throws Exception{
		return mapper.newRentListPro(list);
	}
	
	public int rentListCount(RentListVO list) throws Exception{
		return mapper.rentListCount(list);
	}
	
	//렌트 상담 후 대기인원 증가시킨다.
	public int rentStandby(RentVO rent) throws Exception {
		return mapper.rentStandby(rent);
	}
	public List<CarVO> carKindList(RentVO temp) throws Exception{
		return mapper.carKindList(temp);
	}
	
	
	
}
