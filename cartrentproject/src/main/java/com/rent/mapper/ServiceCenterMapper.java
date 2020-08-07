package com.rent.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.rent.domain.ServiceVO;

@Repository("com.rent.mapper.ServiceCenterMapper")
public interface ServiceCenterMapper {
	
	//렌트 리스트
	public List<ServiceVO> getList() throws Exception;
	
	//페이징처리
	public List<ServiceVO>getTotal(Map<String, Object> map) throws Exception;
	
	//페이징처리 한 수
	public int getTotalSize(Map<String, Object> map) throws Exception;
}
