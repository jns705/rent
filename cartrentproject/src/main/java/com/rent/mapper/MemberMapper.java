package com.rent.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.rent.domain.MemberVO;

@Repository("com.rent.mapper.MemberMapper")
public interface MemberMapper {
	
	//회원등록
	public int memberInsert(MemberVO member) throws Exception;
	
	//회원수정
	public int memberUpdate(MemberVO member) throws Exception;
	
	//회원삭제
	public int memberDelete(MemberVO member) throws Exception;
	
	//회원전체목록
	public List<MemberVO> memberList() throws Exception;
	
	//회원상세목록
	public MemberVO memberDetail(String id) throws Exception;
	
	//로그인 검사
	public String loginCheck(MemberVO dto, HttpSession ssesion) throws Exception;
	
	//로그아웃
	public void logout(HttpSession ssesion) throws Exception;
	
	//회원 아이디 검사하기
	public MemberVO getMember(MemberVO member) throws Exception;
	
}
