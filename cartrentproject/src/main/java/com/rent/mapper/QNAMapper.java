package com.rent.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rent.domain.QNAVO;

@Repository("com.rent.mapper.QNAMapper")
public interface QNAMapper {
	
	//글쓰기
	public int qnaInsert(QNAVO qna) throws Exception;
	
	//글수정
	public int qnaUpdate(QNAVO qna) throws Exception;
	
	//글삭제
	public int qnaDelete(int qna_id) throws Exception;
	
	//전체목록
	public List<QNAVO> qnaList() throws Exception;
	
	//상세목록
	public QNAVO qnaDetail(int qna_id) throws Exception;
	
	//조건검색
	//public List<QNAVO> qnaList2(String 검색조건) throws Exception;
}
