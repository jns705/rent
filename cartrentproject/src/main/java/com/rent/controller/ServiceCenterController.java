package com.rent.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rent.domain.NoticeVO;
import com.rent.domain.ServiceVO;
import com.rent.service.ServiceCenterService;

@Controller
public class ServiceCenterController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource(name = "com.rent.service.ServiceCenterService")
	ServiceCenterService service;
	
	//고객센터 공지사항
	@RequestMapping("/serviceCenter")
	public String serviceCenter(Model model, 
		 @RequestParam(defaultValue = "")  		String moVal 	//검색할 검색어
		,@RequestParam(defaultValue = "전체")  	String moKind  	//검색할 종류
		,@RequestParam(defaultValue = "1") 		int number 		//현재 페이지 수
	) throws Exception{
		
		int sSize	 = service.getList().size();	//전체 리스트 사이즈 숫자
		int showNum  = 4;							//한페이지에 보여질 페이지
		int listNum  = 4;							//페이징 보여질 수
		int showPage = number*showNum-(showNum-1);
		int startNum = ((number/showNum) - (number%showNum==0 ? 1 : 0)) * listNum + 1  ;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("moVal"		, moVal);
		map.put("moKind"	, moKind);
		map.put("startNum"	, showPage-1);
		map.put("showNum"	, showNum);
		
		List<ServiceVO> sList = service.getTotal(map);
		int SSize = service.getTotalSize(map);
		
		int pagingSize = SSize/listNum + (SSize%listNum != 0 ? 1 : 0);
		model.addAttribute("number"	, number);
		model.addAttribute("moVal"	, moVal);
		model.addAttribute("moKind"	, moKind);
		model.addAttribute("list"	, sList);
		model.addAttribute("sSize"	, sSize);
		model.addAttribute("SSize"	, SSize);
		model.addAttribute("startNum", startNum);
		model.addAttribute("listNum", listNum);
		model.addAttribute("showPage", showPage);
		model.addAttribute("showNum", showNum);
		model.addAttribute("pagingSize", pagingSize);
		return "/serviceCenter";
	}
	
	/**
	 * 고객상담 폼
	 * @return
	 */
	@RequestMapping("/serviceCenter/customerConsultation")
	public String customerConsultation() {
		logger.info("customerConsultation");
		return "/service/customerConsultation";
	}
	
	/**
	 * 자주찾는질문
	 * @return
	 * 해당DB가 없어서 jsp에서 javascript를 사용해 보여주기식 으로 만듬
	 */
	@RequestMapping("/serviceCenter/faq")
	public String frequentlyAskedQuestions() {
		logger.info("frequentlyAskedQuestions");
		return "/service/faq";
	}
	
	/**
	 * 공지사항 등록폼
	 * @return
	 */
	@RequestMapping("/serviceCenter/noticeInsertForm")
	public String noticeInsertForm() {
		logger.info("noticeInsertForm");
		return "/service/noticeInsert";
	}
	/**
	 * 공지사항 등록 프로세스
	 * @return
	 */
	@RequestMapping("/serviceCenter/noticeInsert")
	public String noticeInsert(NoticeVO notice) throws Exception {
		System.out.println(notice);
		service.noticeInsert(notice);
		return "redirect:/serviceCenter";
	}
	
	//공지사항 상세글
	@RequestMapping("/serviceCenter/noticeDetail/{id}")
	public String noticeDetail(@PathVariable int id, Model model,
			 @RequestParam(defaultValue = "")  		String moVal 	//검색할 검색어
			,@RequestParam(defaultValue = "전체")  	String moKind  	//검색할 종류
			,@RequestParam(defaultValue = "1") 		int number 		//현재 페이지 수
		) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("moVal"		, moVal);
		map.put("moKind"	, moKind);
		//전체를 조회, 리미트 값 조회 구별하기 위한 식별자
		map.put("aaaa"		, 1);
		
		List<ServiceVO> sList = service.getTotal(map);
		
		//검색에 따라 달라진 값을 조회하기 위해
		//현재글, 다음글, 이전글을 구별하는 식별자
		int temp = 0;
		
		//현재글
		for(int i = 0; i < sList.size(); i++) {
			ServiceVO sL = sList.get(i);
			if(id == sL.getNo()) {
				map.put("a", sL);
				temp = i;
			}
		}
		
		//전번 글
		if(temp != 0) {
			for(int i = 0; i < sList.size(); i++) {
				ServiceVO sL = sList.get(i);
				if(i == temp-1) {
					map.put("b", sL);
				}
			}
		}
		
		//다음글
		if(temp != sList.size()) {
			for(int i = 0; i < sList.size(); i++) {
				ServiceVO sL = sList.get(i);
				if(i == temp+1) {
					map.put("c", sL);
				}
			}
		}
		
		
		model.addAttribute("list", map);
		return "/service/noticeDetail";
	}
	
	/**
	 * 공지사항 업데이트폼
	 * @return
	 */
	@RequestMapping("/serviceCenter/noticeUpdateForm")
	public String noticeUpdateForm(@RequestParam int no, Model model) throws Exception{
		model.addAttribute("list", service.noticeDetail(no));
		return "/service/noticeUpdate";
	}
	/**
	 * 공지사항 업데이트 프로세스
	 * @return
	 */
	@RequestMapping("/serviceCenter/noticeUpdate")
	public String noticeUpdate(NoticeVO list, Model model) throws Exception {
		service.noticeUpdate(list);
		return "redirect:/serviceCenter/noticeDetail/"+list.getNo();
	}
	
	//공지사항 삭제
	@RequestMapping("/serviceCenter/noticeDelete")
	public String noticeDelete(@RequestParam int no, Model model) throws Exception {
		service.noticeDelete(no);
		return  "redirect:/serviceCenter";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
