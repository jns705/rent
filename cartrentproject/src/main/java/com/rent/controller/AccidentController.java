package com.rent.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rent.domain.AccidentVO;
import com.rent.domain.CommentVO;
import com.rent.domain.PagingVO;
import com.rent.service.AccidentService;
import com.rent.service.RentService;

@Controller
@RequestMapping("/accident")
public class AccidentController {
	
	@Resource(name="com.rent.service.AccidentService")
	AccidentService service;
	
	@Resource(name = "com.rent.service.RentService")
	RentService rentService;
	
	/**
	 * 사고이력 목록
	 * @param paging
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String accidentList(Model model) throws Exception{
		int total = service.totalCount();
		
		System.out.println(total);
		
		model.addAttribute("accident", service.accidentList());
		model.addAttribute("rent", rentService.rentList());
		
		return "/accident/accidentList";
	}
	
	@RequestMapping("/scrollDown")
	public @ResponseBody List<AccidentVO> scrollDown(@RequestBody AccidentVO accident) throws Exception {
		
		Integer idToStart = accident.getAccident_id()-1;
		System.out.println("scrollDwon id : " + idToStart);
		
		return service.scrollDown(idToStart);
	}
	@RequestMapping("/scrollUp")
	public @ResponseBody List<AccidentVO> scrollUp(@RequestBody AccidentVO accident) throws Exception {
		
		Integer idToStart = accident.getAccident_id()+1;
		System.out.println("scrollUp id : " + idToStart);
		
		return service.scrollDown(idToStart);
	}
	
	
	/**
	 * 사고이력 등록
	 * @param accident
	 * @return public String accidentList(Model model) 새로고침
	 * @throws Exception
	 * rentDetail.jsp에서 ajax사용
	 */
	@RequestMapping("/insertProc")
	private String accidentInsertProc(AccidentVO accident) throws Exception {
		service.accidentInsert(accident);
		return "redirect:/accident/list";
	}
	
	/**
	 * 사고이력 수정
	 * @param accident
	 * @param request
	 * @return public String accidentList(Model model) 새로고침
	 * @throws Exception
	 * rentDetail.jsp에서 ajax사용
	 * 여러개 수정하기 위해 for문 사용
	 */
	@RequestMapping("/update")
	private String accidentUpdate(AccidentVO accident, HttpServletRequest request) throws Exception {
			
		int count =Integer.parseInt(request.getParameter("count"));
		count+=1;
			for(int i = 0; i < count; i++) {
				if(request.getParameter("accident_content"+i) != null) {
				AccidentVO acc = new AccidentVO();
				acc.setAccident_id(Integer.parseInt(request.getParameter("accident_id_"+i)));
				acc.setAccident_content(request.getParameter("accident_content"+i));
				acc.setAccident_price(Integer.parseInt(request.getParameter("accident_price"+i)));
				acc.setAccident_date(request.getParameter("accident_date"+i));
				acc.setSpecial_note(request.getParameter("special_note"+i));
				service.accidentUpdate(acc);
				}
			}
		return "redirect:/accident/list";
	}
	
	/**
	 * 사고이력 삭제
	 * @param accident_id
	 * @return public String accidentList(Model model) 새로고침
	 * @throws Exception
	 * rentDetail.jsp 에서 ajax사용
	 * 여러개 삭제하기 위해 for문 사용
	 */
	@RequestMapping("/delete/{accident_id}")
	private String accidentDelete(@PathVariable List accident_id) throws Exception {
		System.out.println("accident_Delete 실행중");
		System.out.println(accident_id);
		
		for(int i=0; i < accident_id.size(); i++) {
			String id = (String) accident_id.get(i);
			service.accidentDelete(Integer.parseInt(id));
		}
		return "redirect:/accident/list";
	}
	
}
