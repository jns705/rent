package com.rent.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.MemberVO;
import com.rent.mapper.MemberMapper;

@Service("com.rent.service.MemberService")
public class MemberService {
	
	@Resource(name="com.rent.mapper.MemberMapper")
	MemberMapper mapper;
	
	public int insertProc(MemberVO member)throws Exception{
		return mapper.insertProc(member);
	}
}
