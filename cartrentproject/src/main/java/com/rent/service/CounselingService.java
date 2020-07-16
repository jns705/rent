package com.rent.service;

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
	
	
	
}
