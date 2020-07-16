package com.rent.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rent.domain.CounselingVO;

@Repository("com.rent.mapper.CounselingMapper")
public interface CounselingMapper {
	
	//관리자에게 상담문자 보내기(등록)
	public int counselingInsert(CounselingVO counseling) throws Exception;
	
	//삭제
	public int counselingDelete(int counseling_id) throws Exception;
	
	//전체목록(관리자)
	public List<CounselingVO> counselingList() throws Exception;
	
	//상세목록
	public CounselingVO counselingDetail(String counseling_id) throws Exception;
}
