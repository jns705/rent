package com.rent.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.QNAVO;
import com.rent.mapper.QNAMapper;

@Service("com.rent.service.QNAService")
public class QNAService {
	
	@Resource(name="com.rent.mapper.QNAMapper")
	QNAMapper mapper;
	
	//글쓰기
	public int qnaInsert(QNAVO qna) throws Exception {
		return mapper.qnaInsert(qna);
	}
	
	//글수정
	public int qnaUpdate(QNAVO qna) throws Exception {
		return mapper.qnaUpdate(qna);
	}
	
	//글삭제
	public int qnaDelete(int qna_id) throws Exception {
		return mapper.qnaDelete(qna_id);
	}
	
	//전체목록
	public List<QNAVO> qnaList() throws Exception {
		return mapper.qnaList();
	}
	
	//상세목록
	public QNAVO qnaDetail(int qna_id) throws Exception {
		return mapper.qnaDetail(qna_id);
	}
	
	
}
