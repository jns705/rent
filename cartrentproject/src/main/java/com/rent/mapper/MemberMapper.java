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
	//id로 정보 가져오기
	public MemberVO accountDetail(String id) throws Exception;
	//회원 상세정보
	public MemberVO memberDetail(String id) throws Exception;
}
