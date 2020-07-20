package com.rent.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.MemberVO;
import com.rent.mapper.MemberMapper;

@Service("com.rent.service.MemberService")
public class MemberService {
	
	@Resource(name="com.rent.mapper.MemberMapper")
	MemberMapper mapper;
	
	//회원가입
	public int insertProc(MemberVO member)throws Exception{
		return mapper.insertProc(member);
	}
	
	//계정 체크
	public String accountCheck(String id)throws Exception{
		return mapper.accountCheck(id);
	}
	
	//회원 상세정보
	public MemberVO memberDetail(String id) throws Exception {
		return mapper.memberDetail(id);
	}
}
