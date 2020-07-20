package com.rent.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.CounselingVO;
import com.rent.mapper.CounselingMapper;

@Service("com.rent.service.CounselingService")
public class CounselingService {
	
	@Resource(name="com.rent.mapper.CounselingMapper")
	CounselingMapper mapper;
	
	//관리자에게 상담문자 보내기(등록)
	public int counselingInsert(CounselingVO counseling) throws Exception {
		return mapper.counselingInsert(counseling);
	}
	
	//상담글 상태 현황 변경(상담완료, 예약완료)
	public int counselingUpdate(CounselingVO counseling) throws Exception {
		return mapper.counselingUpdate(counseling);
	}
	
	//삭제
	public int counselingDelete(String counseling_id) throws Exception {
		return mapper.counselingDelete(counseling_id);
	}
	
	//전체목록(관리자)
	public List<CounselingVO> counselingList() throws Exception {
		return mapper.counselingList();
	}
	
	//전체목록(조건검색)
	public List<CounselingVO> searchList(String counseling_situation) throws Exception {
		return mapper.searchList(counseling_situation);
	}
	
	//상세목록
	public CounselingVO counselingDetail(String counseling_id) throws Exception {
		return mapper.counselingDetail(counseling_id);
	}
	
	//회원아이디로 상담신청했는지 확인 후 상담한 날짜를 뿌려준다
	public CounselingVO counselingOK(String id) throws Exception{
		return mapper.counselingOK(id);
	}
	
	
	
}
