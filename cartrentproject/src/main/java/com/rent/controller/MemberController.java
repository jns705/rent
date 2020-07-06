package com.rent.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String insertProc(HttpServletRequest request, MemberVO member) throws Exception{
		member.setTel(request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3"));
		mMemberService.insertProc(member);
		return "/member/loginForm";
	}
	
	//계정 검사
	@RequestMapping("/loginProc")
	public String loginProc(@RequestParam String id, @RequestParam String password, HttpSession session, Model model)throws Exception{
		String login_msg = "";
		if		(mMemberService.accountCheck(id)==null) 			
			login_msg = "아이디가 틀렸습니다.";
		else if	(!mMemberService.accountCheck(id).equals(password)) 
			login_msg = "비밀번호가 틀렸습니다.";
		
		//아이디, 비밀번호가 있으면 세션을 등록한다
		else if	(mMemberService.accountCheck(id).equals(password))  
			session.setAttribute("id", id);
		model.addAttribute("msg", login_msg);
		
		return "/member/memberAlert";
	}
	//맴버 알람 페이지 
	@RequestMapping("/memberAlert")
	public String memberAlert() {
		return "/member/memberAlert";
	}
	
	//로그아웃
	@RequestMapping("/logOut")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "/main";
	}
	
	@RequestMapping("/test")
	public String test() {
		return "/member/test";
	}
}
