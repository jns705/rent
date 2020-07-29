package com.rent.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rent.domain.BuyVO;
import com.rent.domain.CarVO;
import com.rent.domain.CounselingVO;
import com.rent.domain.MemberVO;
import com.rent.domain.ShortRentVO;
import com.rent.service.BuyService;
import com.rent.service.CarOptionService;
import com.rent.service.CarService;
import com.rent.service.CounselingService;
import com.rent.service.MemberService;
import com.rent.service.RentImageService;
import com.rent.service.RentService;
import com.rent.service.ShortRentService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Resource(name="com.rent.service.BuyService")
	BuyService buyService;
	
	@Resource(name="com.rent.service.CarService")
	CarService carService;
	
	@Resource(name="com.rent.service.RentService")
	RentService rentService;
	
	@Resource(name="com.rent.service.CarOptionService")
	CarOptionService optService;
	
	@Resource(name="com.rent.service.CounselingService")
	CounselingService couService;
	
	@Resource(name="com.rent.service.ShortRentService")
	ShortRentService shortService;
	
	@Resource(name="com.rent.service.MemberService")
	MemberService mMemberService;
	
	@Resource(name="com.rent.service.RentImageService")
	RentImageService rentImageService;
	
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
		member.setAddress(request.getParameter("zipcode")+"-"+request.getParameter("address")+"-"+request.getParameter("addressDetail"));
		mMemberService.insertProc(member);
		return "/member/loginForm";
	}
	
	//계정 검사
	@RequestMapping("/loginProc")
	public String loginProc(@RequestParam String id, @RequestParam String password, HttpSession session, Model model)throws Exception{
		String login_msg = "";
		if		(mMemberService.accountCheck(id)==null) login_msg = "아이디가 틀렸습니다.";
		else if	(!mMemberService.accountCheck(id).equals(password)) login_msg = "비밀번호가 틀렸습니다.";
		
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
	
	//아이디 중복검사
	@RequestMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam String id) throws Exception {
		return mMemberService.idCheck(id);
	}
	
	@RequestMapping("/main")
	public String main()throws Exception{
		return "/main";
	}
	
	//비회원 조회
	@RequestMapping("/checkId")
	public String checkId(BuyVO buyList, Model model)throws Exception{
			List<BuyVO> Buy = buyService.getDetail(buyList);
			if(Buy.isEmpty()) return "/buy/buyAlert";
			List<CarVO> Car = new ArrayList<CarVO>();
			List<ShortRentVO> SRent = new ArrayList<ShortRentVO>();
			List<String> situation = new ArrayList<String>();
			for(BuyVO buy : Buy ) {
				Car.add(carService.carDetail(Integer.toString(rentService.rentDetail(buy.getRent_id()).getCar_id())));
				SRent.add(shortService.shortDetail(buy.getBuy_id()));
				situation.add(rentService.rentDetail(buy.getRent_id()).getSituation());
			}
		model.addAttribute("Buy", Buy);
		model.addAttribute("Car", Car);
		model.addAttribute("SRent", SRent);
		model.addAttribute("situation", situation);
		return "/buy/short_rentList";
	}
	
	//비회원 조회
	@RequestMapping("/checkId1")
	public String checkId1(BuyVO buyList, Model model)throws Exception{
		List<BuyVO> Buy = buyService.getDetail(buyList);
		if(Buy.isEmpty()) {
			return "redirect:/buy/buyAlert?check=1";
		}
		List<CarVO> Car = new ArrayList<CarVO>();
		List<String> situation = new ArrayList<String>();
		for(BuyVO buy : Buy ) {
			Car.add(carService.carDetail(Integer.toString(rentService.rentDetail(buy.getRent_id()).getCar_id())));
			situation.add(rentService.rentDetail(buy.getRent_id()).getSituation());
		}
		model.addAttribute("Buy", Buy);
		model.addAttribute("Car", Car);
		model.addAttribute("situation", situation);
		return "/buy/userBuyList";
	}
	//회원 상세 정보
	@RequestMapping("/detail/{id}")
	public String memberDetail(@PathVariable String id, Model model) throws Exception {
		MemberVO member = mMemberService.memberDetail(id);
		
		String address[] = member.getAddress().split("/");
		
		model.addAttribute("address", address);
		model.addAttribute("detail", mMemberService.memberDetail(id));
		return "/member/memberDetail";
	}
	
	//회원정보 수정
	@RequestMapping("/update")
	public String memberUpdate(MemberVO member, HttpServletRequest rq) throws Exception {
		String zipcode = rq.getParameter("address0");
		String address = rq.getParameter("address1");
		String detailedAddress = rq.getParameter("address2");
		
		member.setAddress(zipcode +"/"+ address +"/"+ detailedAddress);
		mMemberService.memberUpdate(member);
		System.out.println(member.getId()+"회원 정보수정");
		return "redirect:/member/detail/"+member.getId();
	}
	
	//회원탈퇴
	@RequestMapping("/delete")
	public String memberDelete(MemberVO member) throws Exception {
		System.out.println(member.getId()+"회원 탈퇴");
		mMemberService.memberDelete(member);
		return "/main";
	}
	
}
