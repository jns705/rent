package com.rent.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.AccidentVO;
import com.rent.mapper.AccidentMapper;

@Service("com.rent.service.AccidentService")
public class AccidentService {
	
	@Resource(name="com.rent.mapper.AccidentMapper")
	AccidentMapper mapper;
	
	//사고이력 등록
	public int accidentInsert(AccidentVO accident) throws Exception{
		System.out.println("accidentInsert() 실행중. . .");
		return mapper.accidentInsert(accident);
	}
	
	//사고이력 수정
	public int accidentUpdate(AccidentVO accident) throws Exception{
		System.out.println("accidentUpdate() 실행중. . .");
		return mapper.accidentUpdate(accident);
	}

	//사고이력 삭제
	public int accidentDelete(int accident_id) throws Exception{
		System.out.println("accidentDelete() 실행중. . .");
		return mapper.accidentDelete(accident_id);
	}

	//전체목록
	public List<AccidentVO> accidentList() throws Exception{
		System.out.println("accidentList() 실행중. . .");
		return mapper.accidentList();
	}
	
	//렌트 아이디에 따른 전체목록
	public List<AccidentVO> accidentListId(String rent_id) throws Exception{
		System.out.println("accidentListId() 실행중. . .");
		return mapper.accidentListId(rent_id);
	}
	
	
	
}
