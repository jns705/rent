package com.rent.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rent.domain.MemberVO;
import com.rent.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Resource(name="com.rent.service.MemberService")
	MemberService mMemberService;	
	
	//로그인 홈페이지
	@RequestMapping("/loginForm")
	public String loginForm() throws Exception{
		return "/member/loginForm";
	}
	
	//회원가입 홈페이지
	@RequestMapping("/insertForm")
	public String insertFrom()throws Exception{
		return "/member/insertForm";
	}
	
	//회원가입
	@RequestMapping("/insertProc")
	public String insertProc(HttpServletRequest request) throws Exception{
		MemberVO member = new MemberVO();
		member.setAddress(request.getParameter("address"));
		member.setDate_of_birth(request.getParameter("birth1")+"|"+request.getParameter("birth2")+"|"+request.getParameter("birth3"));
		member.setId(request.getParameter("id"));
		member.setName(request.getParameter("name"));
		member.setPassword(request.getParameter("password"));
		member.setTel(request.getParameter("tel1")+"|"+request.getParameter("tel2")+"|"+request.getParameter("tel3"));
		mMemberService.insertProc(member);
		return "/member/loginForm";
	}
}
