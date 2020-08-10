package com.rent.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.NoticeVO;
import com.rent.domain.ServiceVO;
import com.rent.mapper.ServiceCenterMapper;

@Service("com.rent.service.ServiceCenterService")
public class ServiceCenterService {
	
	@Resource(name="com.rent.mapper.ServiceCenterMapper")
	ServiceCenterMapper mapper;
	
	public List<ServiceVO> getList() throws Exception{
		return mapper.getList();
	}
	
	//페이징처리
	public List<ServiceVO>getTotal(Map<String, Object> map) throws Exception{
		return mapper.getTotal(map);
	}
	
	//페이징처리한 숫자
	public int getTotalSize(Map<String, Object> map) throws Exception{
		return mapper.getTotalSize(map);
	}
	
	//공지사항 글쓰기 
	public int noticeInsert(NoticeVO list) throws Exception{
		return mapper.noticeInsert(list);
	}
	
	//공지사항 상세정보
	public NoticeVO noticeDetail(int no) throws Exception{
		return mapper.noticeDetail(no);
	}
	
	//공지사항 수정
	public int noticeUpdate(NoticeVO list) throws Exception{
		return mapper.noticeUpdate(list);
	}
	
	//공지사항 삭제
	public int noticeDelete(int no) throws Exception{
		return mapper.noticeDelete(no);
	}
	
}
