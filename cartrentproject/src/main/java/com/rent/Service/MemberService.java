package com.rent.Service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.MemberVO;
import com.rent.mapper.MemberMapper;

@Service("com.rent.Service.MemberService")
public class MemberService {
	
	@Resource(name="com.rent.mapper.MemberMapper")
	MemberMapper memberMapper;
	
	public int insertProc(MemberVO member) throws Exception{
		return memberMapper.insertProc(member);
	}
}
