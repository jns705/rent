package com.rent.mapper;

import org.springframework.stereotype.Repository;

import com.rent.domain.MemberVO;

@Repository(value="com.rent.mapper.MemberMapper")
public interface MemberMapper {

	//회원가입
	public int insertProc(MemberVO member) throws Exception;
	
	//계정체크
	public String accountCheck(String id) throws Exception;
	
	//id중복체크
	public int idCheck(String id)throws Exception;
}
