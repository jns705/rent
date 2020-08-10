package com.rent.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.rent.domain.NoticeVO;
import com.rent.domain.ServiceVO;

@Repository("com.rent.mapper.ServiceCenterMapper")
public interface ServiceCenterMapper {
	
	//렌트 리스트
	public List<ServiceVO> getList() throws Exception;
	
	//페이징처리
	public List<ServiceVO>getTotal(Map<String, Object> map) throws Exception;
	
	//페이징처리 한 수
	public int getTotalSize(Map<String, Object> map) throws Exception;
	
	//공지사항 글쓰기
	public int noticeInsert(NoticeVO list) throws Exception;
	
	//공지사항 상세정보
	public NoticeVO noticeDetail(int no) throws Exception;
	
	//공지사항 수정
	public int noticeUpdate(NoticeVO list) throws Exception;
	
	//공지사항 삭제
	public int noticeDelete(int no) throws Exception;
	
}
