package com.rent.service;

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
	
	//아이디 중복체크
	public int idCheck(String id)throws Exception{
		return mapper.idCheck(id);
	}
	
	//아이디로 정보 가져오기
	public MemberVO accountDetail(String id) throws Exception{
		return mapper.accountDetail(id);
	}
}
