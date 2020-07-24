package com.rent.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rent.domain.AccidentVO;
import com.rent.domain.PageMaker;

@Repository("com.rent.mapper.AccidentMapper")
public interface AccidentMapper {
	
	//사고이력 등록
	public int accidentInsert(AccidentVO accident) throws Exception;

	//사고이력 수정
	public int accidentUpdate(AccidentVO accident) throws Exception;

	//사고이력 삭제
	public int accidentDelete(int accident_id) throws Exception;

	//전체목록
	public List<AccidentVO> accidentList() throws Exception;
	
	//스크롤페이징 목록 불러오기 (스크롤다운)
	public List<AccidentVO> scrollDown(int accident_id) throws Exception;
	
	//스크롤페이징 목록 불러오기 (스크롤업)
	public List<AccidentVO> scrollUp(int accident_id) throws Exception;
	
	//전체목록
	public List<AccidentVO> accidentListId(String rent_id) throws Exception;
	
	//전체목록 갯수
	public int totalCount() throws Exception;	
	
}
