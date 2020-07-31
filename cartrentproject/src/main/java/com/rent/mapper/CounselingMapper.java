package com.rent.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rent.domain.CounselingVO;
import com.rent.domain.PagingVO;

@Repository("com.rent.mapper.CounselingMapper")
public interface CounselingMapper {
	
	//관리자에게 상담문자 보내기(등록)
	public int counselingInsert(CounselingVO counseling) throws Exception;
	
	//상담글 상태 현황 변경(상담완료, 예약완료)
	public int counselingUpdate(CounselingVO counseling) throws Exception;
	
	//삭제
	public int counselingDelete(String counseling_id) throws Exception;
	
	//전체목록(관리자)
	//public List<CounselingVO> counselingList() throws Exception;
	
	//전체목록(관리자) 페이징
	public List<CounselingVO> counselingList(PagingVO paging) throws Exception;
	
	//전체목록(조건검색)
	public List<CounselingVO> searchList(String counseling_situation) throws Exception;
	
	//상세목록
	public CounselingVO counselingDetail(String counseling_id) throws Exception;
	
	//회원아이디로 상담신청했는지 확인 후 상담한 날짜를 뿌려준다
	public CounselingVO counselingOK(String id) throws Exception;
	
	//아이디로 상담리스트 조회
	public List<CounselingVO> counselingListId(String id) throws Exception;
	
	//전화번호로 리스트 출력
	public List<CounselingVO> counselingListTel(String tel) throws Exception;
	
	//상담목록 총 갯수
	public int counselingCount() throws Exception;
	
}
