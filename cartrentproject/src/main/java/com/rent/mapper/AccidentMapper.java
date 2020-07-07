package com.rent.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rent.domain.AccidentVO;

@Repository("com.rent.mapper.AccidentMapper")
public interface AccidentMapper {
	
	//사고이력 등록
	public int accidentInsert(AccidentVO accident) throws Exception;

	//사고이력 수정
	public int accidentUpdate(AccidentVO accident) throws Exception;
	/*
	//사고이력 삭제
	public int accidentDelete(int accident_id) throws Exception;
	*/
	//전체목록
	public List<AccidentVO> accidentList() throws Exception;
	
	//전체목록
	public List<AccidentVO> accidentListId(String rent_id) throws Exception;
	
	//상세조회
	public AccidentVO accidentDetail(int accident_id) throws Exception;
	
}
