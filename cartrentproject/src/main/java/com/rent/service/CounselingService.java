package com.rent.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.CounselingVO;
import com.rent.domain.PagingVO;
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
	/*
	//전체목록(관리자)
	public List<CounselingVO> counselingList() throws Exception {
		return mapper.counselingList();
	}
	*/
	//전체목록(관리자) 페이징
	public List<CounselingVO> counselingList(PagingVO paging) throws Exception {
		System.out.println("Service페이지당 글 갯수 "+paging.getCntPerPage());
		return mapper.counselingList(paging);
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
	public List<CounselingVO> counselingOK(String id) throws Exception{
		return mapper.counselingOK(id);
	}
	
	//회원 아이디 목록
	public List<CounselingVO> counselingListId(String id) throws Exception{
		return mapper.counselingListId(id);
	}
	
	//회원 전화번호로 리스트 출력
	public List<CounselingVO> counselingListTel(String tel) throws Exception{
		return mapper.counselingListTel(tel);
	}
	
	//상담목록 총 갯수
	public int counselingCount() throws Exception {
		return mapper.counselingCount();
	}
	
	//회원탈퇴시 해당아이디에 대한 구매한 정보들을 전부 삭제한다 
	public int secessionDelete(String id) throws Exception {
		return mapper.secessionDelete(id);
	}
	
}
