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
import com.rent.domain.RentVO;
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
	public String loginForm(@RequestParam(defaultValue = "0") int check, Model model, HttpServletRequest request) throws Exception{
		model.addAttribute("check", check);
		model.addAttribute("Referer", request.getHeader("Referer"));
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
		member.setAddress(request.getParameter("zipcode")+"-"+request.getParameter("address")+"-"+request.getParameter("addressDetail"));
		mMemberService.insertProc(member);
		return "/member/loginForm";
	}
	
	//계정검사 AJAX
	@RequestMapping("/loginProcAjax")
	@ResponseBody
	public int loginProcAjax(MemberVO member, Model model)throws Exception{
		int check = 0;
		if		(mMemberService.accountCheck(member.getId())==null) check = 0;
		else if	(!mMemberService.accountCheck(member.getId()).equals(member.getPassword())) check = 1;
		else if	(mMemberService.accountCheck(member.getId()).equals(member.getPassword()))  check = 2;
		return check;
	}
	
	//계정 검사
	@RequestMapping("/loginProc")
	public String loginProc(@RequestParam(defaultValue = "0") int check, @RequestParam String Referer , @RequestParam String id, HttpSession session, Model model)throws Exception{
		System.out.println("loginProc : " + check);
		//아이디, 비밀번호가 있으면 세션을 등록한다
		session.setAttribute("id", id);
		if(Referer.equals("http://localhost:8082/buy/memberCheckForm")) return "redirect:/buy/short_rentList";
		if(Referer.equals("http://localhost:8082/buy/memberCheckForm?check=1")) return "redirect:/counseling/userList";
		return "redirect:" + Referer.substring(21);
	}
	//맴버 알람 페이지 
	@RequestMapping("/memberAlert")
	public String memberAlert(@RequestParam(defaultValue = "0") int check, Model model) {
		System.out.println("Alert : " + check);
		model.addAttribute("check", check);
		return "/member/memberAlert";
	}
	
	//로그아웃
	@RequestMapping("/logOut")
	public String logOut(HttpSession session, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		session.invalidate();
		if(referer.contains("/buy/short_rentList")) return "redirect:/buy/memberCheckForm";
		if(referer.contains("/counseling/userList") || referer.contains("/buy/userBuyList")) return "redirect:/buy/memberCheckForm?check=1";
		return "redirect:" + referer.substring(21);
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
	public String memberDelete(MemberVO member, HttpSession session) throws Exception {
		System.out.println(member.getId()+"회원 탈퇴");
		//예약 상담 삭제해야함
		
		//1. 회원아이디에 해당하는 상담들을 삭제한다.
		List<CounselingVO> counList = new ArrayList<CounselingVO>();
		counList = couService.counselingListId(member.getId());
		for(int i=0; i < counList.size(); i++) {
			
			//렌트아이디없이 상담한 경우 
			if(counList.get(i).getRent_id() == null) {
				couService.counselingDelete(counList.get(i).getCounseling_id());
				continue;
			}
			
			//i번째 렌트아이디를 가져온다
			RentVO rentCou = rentService.rentDetail(counList.get(i).getRent_id());
			
			//회원이 상담신청을 했는데 상담 대기중일 경우
			if(counList.get(i).getCounseling_situation().equals("상담 대기중")) {
				int standby = rentCou.getStandby_personnel();
				
				//상담인원수가 1이면
				if(standby == 1) {
					//-1하면 0명이니까 예약가능으로 바꾼다.
					rentCou.setStandby_personnel(standby-1);
					rentCou.setSituation("예약가능");
				}else if(standby == 0) { //혹시 모르니 만들어둠
					rentCou.setStandby_personnel(0);
					rentCou.setSituation("예약가능");
				}else {
					//상담인원수 -1한다
					rentCou.setStandby_personnel(standby-1);
				}
				//상담인원수를 수정한다.
				rentService.rentStandby(rentCou);
			}
			//회원의 상담을 삭제한다.
			couService.counselingDelete(counList.get(i).getCounseling_id());
		}
		
		//2. 회원아이디에 해당하는 구매(예약)목록을 삭제한다.
		
		List<BuyVO> buyList = new ArrayList<BuyVO>();
		//회원 아이디에 해당하는 구매목록들을 전부 가져온다.
		buyList = buyService.buyListMemberId(member.getId());
		
		for(int i=0; i < buyList.size(); i++) {
			//예약을 취소 했으니 car 재고량을 1증가시킨다
			RentVO rentBuy = rentService.rentDetail(buyList.get(i).getRent_id());
			CarVO car = carService.carDetail(Integer.toString(rentBuy.getCar_id()));
			int count = car.getCar_number();
			car.setCar_number(count+1);
			carService.carNumberAdding(car);
			
			//예약을 취소 했으니 렌트예약가능으로 바꾼다
			rentBuy.setSituation("예약가능");
			rentService.rentStandby(rentBuy);
			
			//회원아이디에 해당하는 구매목록을 삭제한다.
			int buy_id = buyList.get(i).getBuy_id();
			buyService.rentBuyDelete(buy_id);
			
		}
		
		//3. 마지막으로 회원아이디를 삭제 후 로그인세션을 종료시킨다.
		mMemberService.memberDelete(member);
		session.invalidate();
		return "/main";
	}
	
}
