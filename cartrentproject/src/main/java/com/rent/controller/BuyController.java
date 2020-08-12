package com.rent.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rent.domain.BuyVO;
import com.rent.domain.CarVO;
import com.rent.domain.CounselingVO;
import com.rent.domain.MemberVO;
import com.rent.domain.OptionCarVO;
import com.rent.domain.PagingVO;
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
@RequestMapping("/buy")
public class BuyController {
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
	MemberService memService;
	
	@Resource(name="com.rent.service.RentImageService")
	RentImageService rentImageService;
	
	/**
	 * 렌트구매(예약)페이지
	 * @param model
	 * @param request
	 * @param rent_id
	 * @return
	 * @throws Exception
	 * 구매페이지에서 request를 이용해 총합비용, 보증금, 계약날짜, 주행거리를 사용자에게 보여주고
	 * hidden으로 차옵션들을 숨겨준다.
	 */
	@RequestMapping("/insert/{rent_id}")
	private String rentBuyInsert(Model model, HttpServletRequest request, @PathVariable String rent_id) throws Exception {
		
		String id = request.getParameter("id");
		
		if(id != "") model.addAttribute("member" ,memService.memberDetail(id));
		
		String totalPrice = request.getParameter("totalPrice"); // 총합 비용
		String deposit = request.getParameter("deposit"); 		//보증금
		String month = request.getParameter("term"); 			// 계약날짜
		String km = request.getParameter("km"); 				// 주행거리

		model.addAttribute("month", month);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("deposit", deposit);
		model.addAttribute("km", km);
		
		RentVO rent = rentService.rentDetail(rent_id);
		//rent에서 car_id뽑아낸다.
		int car_id = rent.getCar_id();
		
		model.addAttribute("car", carService.carDetail(Integer.toString(car_id)));
		model.addAttribute("rent", rent);
		
		String onOff[] = new String [8]; 
		
		for(int i = 0; i < 8; i++) { onOff[i] = "off"; }
		
		List<OptionCarVO> list = optService.optionDetail(rent_id);
		for(int i = 0; list.size() > i ; i++) {
			OptionCarVO List = list.get(i);
			if(List.getOption_name().equals("가죽시트"))  	onOff[0] = "on";
			if(List.getOption_name().equals("네비게이션")) 	onOff[1] = "on";
			if(List.getOption_name().equals("ECM룸미러 ")) 	onOff[2] = "on";
			if(List.getOption_name().equals("스마트키")) 	onOff[3] = "on";
			if(List.getOption_name().equals("썬루프")) 		onOff[4] = "on";
			if(List.getOption_name().equals("통풍시트")) 	onOff[5] = "on";
			if(List.getOption_name().equals("후방카메라")) 	onOff[6] = "on";
		}
		model.addAttribute("rentImage" , rentImageService.imageList(Integer.parseInt(rent_id)));
		model.addAttribute("count"  , onOff);
		
		return "/buy/rentBuyInsert";
	}
	
	/**
	 * 렌트구매(예약) 프로세스
	 * @param request
	 * @param buy
	 * @return
	 * @throws Exception
	 * car_id, id, rent_id를 가져와서
	 * car 테이블에 재고량 -1 해주고 
	 * rent 테이블에 상담인원수를 0으로 초기화, 상담상태에 렌트완료를 넣어주고
	 * buy 테이블에 값들을 넣어준다.
	 */
	@RequestMapping("/insertProc")
	private String rentBuyInsertProc(HttpServletRequest request, BuyVO buy) throws Exception {
		
		String car_id 	= request.getParameter("car_id");
		String id 		= request.getParameter("id");
		String rent_id 	= request.getParameter("rent_id");
		List<OptionCarVO> optionList = optService.optionDetail(rent_id);
		//rent_id에 해당하는 option_name들을 합친다.
		String options = "";
		for(int i =0; i< optionList.size(); i++) {
			options += optionList.get(i).getOption_name();
			if(optionList.size() > i+1) options+=", ";	
		}
		
		List<CounselingVO> counseling = couService.counselingOK(id);
		int num = 0;
		
		//가장 최근의 상담날짜를 넣어둔다
		for(int i=0; i> counseling.size(); i++) {
			System.out.println("상담 "+i+"개 : " + counseling);
			num +=1;
		}
		
		if(counseling != null) {
			buy.setCounseling_date(counseling.get(num).getCounseling_date());
		}else {
			SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
			Calendar time = Calendar.getInstance();
			buy.setCounseling_date(format1.format(time.getTime()));
		}
		
		buy.setOption_name(options);
		buy.setBuy_situation("대여중");
		
		//렌트카를 돈주고 예약 했으니 car테이블에 있는 car_number(재고량)를 뺀다
		CarVO car = carService.carDetail(car_id);
		int count = car.getCar_number();
		
		//만약 해당 렌트카의 재고가 없으면
		if(count <= 0) {
			
		}
		count -=1;
		car.setCar_number(count);
		
		RentVO rent = rentService.rentDetail(rent_id);
		//예약했으니 상담대기인원수 0으로 만들기
		
		rent.setStandby_personnel(0);
		rent.setSituation("렌트완료");
		rentService.rentStandby(rent);
		
		carService.carNumberAdding(car);
		buyService.rentBuyInsert(buy);
		
		return "redirect:/rent/rentList";
	}
	
	/**
	 * 구매자(예약) 리스트(페이징, 조건검색)
	 * @param model
	 * @param paging
	 * @param nowPage
	 * @param cntPerPage
	 * @param buyKind
	 * @param buySearch
	 * @return
	 * @throws Exception
	 * 해당buy 테이블의 rent_id를 가지고
	 * rent테이블의 car_id를 가져와 List<String> car_name에 차이름을 넣어준다.
	 */
	@RequestMapping("/list")
	public String buyList(Model model, PagingVO paging
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(defaultValue = "all") String buyKind //검색종류
			, @RequestParam(defaultValue = "") String buySearch /*검색어*/) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("Search : "+buySearch);
		map.put("buyKind", buyKind);
		map.put("buySearch", buySearch);
		int total = buyService.buyCount(map);
		System.out.println("total : " + total);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		paging = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		paging.calcStartEnd(Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		map.put("start", paging.getStart());
		map.put("end", paging.getEnd());
		
		List<BuyVO> buy = buyService.buyList(map);
		
		
		List<String> car_name = new ArrayList<String>();
		for(int i = 0; i < buy.size(); i++) {
			String rent_id = buy.get(i).getRent_id();
			
			//오류 방지
			if(rent_id == null) {
				car_name.add("선택차량없음");
				System.out.println("if문들어온 차량 : "+car_name);
				continue;
			}
			RentVO ren = rentService.rentListId(rent_id);
			int car_id = ren.getCar_id();
			CarVO car = carService.carDetail(Integer.toString(car_id));
			car_name.add(car.getCar_name());
		}
		
		model.addAttribute("map",map);
		model.addAttribute("car",car_name);
		model.addAttribute("paging", paging);
		model.addAttribute("buyList", buyService.buyList(map));
		return "/buy/buyList";
	}
	
	/**
	 * 구매자(예약) 상세조회
	 * @param buy_id
	 * @param model
	 * @return
	 * @throws Exception
	 * car_name을 가져오기 위해 buy테이블 해당하는 rent_id를
	 * rent 테이블 rent_id의 car_id로 car테이블의 이름을 가져온다
	 * buy테이블(rent_id = rent테이블의 rent_id)
	 * rent테이블(car_id - > car테이블 car_name조회)
	 */
	@RequestMapping("/detail/{buy_id}")
	public String buyDetail(@PathVariable int buy_id, Model model) throws Exception {
		BuyVO buy = buyService.buyDetail(buy_id);
		String rent_id = buy.getRent_id();
		
		if(rent_id == null) {
			
		}else {
			RentVO rent = rentService.rentDetail(rent_id);
			int car_id = rent.getCar_id();
			CarVO car = carService.carDetail(Integer.toString(car_id));
			model.addAttribute("car", car);
		}
		model.addAttribute("detail", buy);
		return "/buy/buyDetail";
	}
	
	/**
	 * 구매(예약)현황 수정 (대여중, 반납완료)
	 * @param re
	 * @param buy
	 * @return
	 * @throws Exception
	 * buy테이블의 buy_situation(반납완료, 대여중)을 수정할 수 있다.
	 */
	@RequestMapping("/update")
	public String buyUpdate(HttpServletRequest re, BuyVO buy) throws Exception {
		String buy_situation = re.getParameter("buy_situation");
		String existing_situation = re.getParameter("existing_situation");
		String rent_id = re.getParameter("rent_id");
		
		RentVO rent = rentService.rentDetail(rent_id);
		String car_id = Integer.toString(rent.getCar_id());
		CarVO car = carService.carDetail(car_id);
		int count = car.getCar_number();
		
		//잘못 눌렀을 경우 (반납완료 -> 반납완료)
		if(buy_situation.equals(existing_situation)) {
			System.out.println("같은값누르면 새로고침");
			return "redirect:/buy/detail/"+buy.getBuy_id();
		}
		
		//기본값은 대여중이다.
		//만약 반납완료 -> 대여중으로 바꾸면 (넘어온값이 대여중)
		if(buy_situation.equals("대여중")) {
			rent.setSituation("렌트완료");
			if(count <= 0) {
				car.setCar_number(0);
			}else {
				car.setCar_number(count-1);
			}
			
		}else if(buy_situation.equals("반납완료")) {
			rent.setSituation("예약가능");
			car.setCar_number(count+1);
		}
		
		//수정한다.
		rentService.situation(rent);
		carService.carNumberAdding(car);
		buyService.rentBuyUpdate(buy);
		System.out.println("수정완료");
		return "redirect:/buy/detail/"+buy.getBuy_id();
	}
	
	
	//예약 취소
	/**
	 * 구매(예약) 취소(삭제)
	 * @param buy_id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete/{buy_id}")
	public String buyDelete(@PathVariable int buy_id, HttpServletRequest request) throws Exception {
		
		String rent_id = request.getParameter("rent_id_"+buy_id);
		buyService.rentBuyDelete(buy_id);
		
		//예약을 취소 했으니 car 재고량을 1증가시킨다
		RentVO rent = rentService.rentDetail(rent_id);
		CarVO car = carService.carDetail(Integer.toString(rent.getCar_id()));
		int count = car.getCar_number();
		car.setCar_number(count+1);
		carService.carNumberAdding(car);
		
		//예약을 취소 했으니 렌트예약가능으로 바꾼다
		rent.setSituation("예약가능");
		rentService.rentStandby(rent);
		return "redirect:/buy/list";
	}
	
	
	@RequestMapping("/short_rentProc")
	public String short_rentProc(@RequestParam String rent_id, ShortRentVO sRent, BuyVO buy, Model model, HttpSession session, HttpServletRequest request) throws Exception{
		String id = (String)(session.getAttribute("id"));
		if(id==null) id = "비회원";
		RentVO rent = new RentVO();
		rent.setRent_id(Integer.parseInt(rent_id));
		rent.setStandby_personnel(0);
		rent.setSituation("확인중");
		
		
		buy.setId(id);
		buy.setColor(rentService.rentDetail(rent_id).getColor());
		buy.setBuy_situation("확인중");
		buy.setRent_id(rent_id);
		buy.setOption_name("null");
		buy.setMonth("00");
		buy.setAddress(request.getParameter("zipcode")+"/"+request.getParameter("address")+"/"+request.getParameter("addressDetail"));
		buyService.rentBuyInsert(buy);
		sRent.setBuy_id(buy.getBuy_id());
		sRent.setStart_time(request.getParameter("sHour")+":"+request.getParameter("sMinute"));
		sRent.setEnd_time(request.getParameter("lHour")+":"+request.getParameter("lMinute"));
		shortService.shortInsert(sRent);
		rentService.rentStandby(rent);
		return "redirect:/buy/short_rentList?buy_id="+buy.getBuy_id();
	}
	
	@RequestMapping("/short_rentList")
	public String short_rentList(Model model, HttpSession session, @RequestParam(defaultValue = "n") String buy_id) throws Exception{
		String id = (String)(session.getAttribute("id"));
		List<BuyVO> Buy = new ArrayList<BuyVO>();
		if(id != null) 
			Buy = buyService.buyListSId(id);
		else
			Buy = buyService.buyListBuyId(buy_id);
		
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
	
	@RequestMapping("/newRent")
	public String newRent(BuyVO list, HttpSession session) throws Exception{
		list.setId((String)session.getAttribute("id"));
		if(session.getAttribute("id")==null || session.getAttribute("id").equals("")) list.setId("비회원");
		list.setBuy_situation("확인중");
		list.setOption_name("파퓰러 패키지,빌트인 캠 패키지");
		buyService.rentBuyInsert(list);
		return "redirect:/buy/userBuyList?tel="+list.getTel();
	}
	
	@RequestMapping("/memberCheckForm")
	public String memberCheckForm(@RequestParam(defaultValue = "0") int check, Model model) {
			model.addAttribute("check", check);
		return "/buy/memberCheckForm";
	}
	
	//경고메세지
	@RequestMapping("/buyAlert")
	public String buyAlert(@RequestParam(defaultValue = "0") String check, Model model) {
		model.addAttribute("check", check);
		return "/buy/buyAlert";
	}
	
	@RequestMapping("/userBuyList")
	public String userBuyList(Model model, HttpSession session, @RequestParam(defaultValue = "n") String tel) throws Exception{
		List<BuyVO> buyList = new ArrayList<BuyVO>();
		if(tel.equals("n")) {
			String id = (String)session.getAttribute("id");
			buyList = buyService.buyListId(id);
		}else  buyList = buyService.buyListTel(tel); 
		List<CarVO> Car = new ArrayList<CarVO>();
		List<String> situation = new ArrayList<String>();
		
		for(BuyVO buy : buyList) {
			Car.add(carService.carDetail(Integer.toString(rentService.rentDetail(buy.getRent_id()).getCar_id())));
			situation.add(rentService.rentDetail(buy.getRent_id()).getSituation());
		}
		
		if(buyList.isEmpty())
			model.addAttribute("tel", tel);
		else
			model.addAttribute("tel", buyList.get(0).getTel());
		

		List<String> map = new ArrayList<String>();
		for(int i = 0; i < buyList.size(); i++) {
			BuyVO List = buyList.get(i);
			if(List.getRent_id() != null) {
			if(rentService.rentDetail(List.getRent_id()).getSpecial_note() != null)
				map.add(rentService.rentDetail(List.getRent_id()).getSpecial_note());
			if(rentService.rentDetail(List.getRent_id()).getSpecial_note() == null)
				map.add("null");
			}
				
		}
		System.out.println(map);
		model.addAttribute("map", map);
		model.addAttribute("Buy", buyList);
		model.addAttribute("Car", Car);
		model.addAttribute("situation", situation);
		return "/buy/userBuyList";
	}
	
	
	
}
