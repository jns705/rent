package com.rent.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rent.domain.CarColor;
import com.rent.domain.CarVO;
import com.rent.domain.OptionCarVO;
import com.rent.domain.RentVO;
import com.rent.service.CarColorService;
import com.rent.service.CarService;
import com.rent.service.RentService;


@Controller
@RequestMapping("/admin")
public class AdminController {

	@Resource(name = "com.rent.service.CarService")
	CarService carService;
	
	@Resource(name = "com.rent.service.CarColorService")
	CarColorService colorService;
	
	@Resource(name = "com.rent.service.RentService")
	RentService rentService;
	
	
	//차량 등록
	@RequestMapping("/carInsert")
	public String carInsertForm(Model model)throws Exception{
		return "/admin/carInsertForm";
	}
	
	@RequestMapping("/carInsertProc")
	public String carInsertForm(CarVO car)throws Exception{
			carService.carInsert(car);
		return "redirect:/admin/colorInsertForm/"+car.getCar_id();
	}
	
	//차 등록
	@RequestMapping("/colorInsertForm/{id}")
	public String colorInsertForm(Model model, @PathVariable String id) throws Exception{
		model.addAttribute("list", carService.carList());
		model.addAttribute("car_id", id);
		model.addAttribute("option", carService.carOptionList());
		return "/admin/colorInsertForm";
	}
	
	@RequestMapping("/carColorProc")
	public String carColorProc(@RequestParam(defaultValue = "1") int car_id, @RequestParam String color, Model model, @RequestPart MultipartFile files)throws Exception{
		
		//게시글 등록 화면에서 입력한 값들을 실어나르기 위한 BoardVO를 생성한다.
		CarColor file		=	new CarColor();
		
		if(!files.isEmpty()) {
		String 	sourceFileName = files.getOriginalFilename();
		File 	destinationFile;
		String	destinationFileName;
		// fileUrl="uploadFiles 폴더의 위치"
		String	fileUrl = "C:/Git/rent/cartrentproject/src/main/resources/static/upload/";
		do {
			destinationFileName = RandomStringUtils.randomAlphabetic(32) + sourceFileName;
			destinationFile		= new File(fileUrl + destinationFileName);
		}while(destinationFile.exists());
		
		//MultipartFile.transferTo() : 요청 시점의 임시 파일을 로컬 파일 시스템에 영구적으로 복사해준다.
		destinationFile.getParentFile().mkdir();
		files.transferTo(destinationFile);
		
		file.setCar_id		(car_id);
		file.setColor		(color);
		file.setColor_image	(destinationFileName);
		file.setColor_url	("http://localhost:8082/static/upload/");
		
		carService.colorInsert(file);
		}
		model.addAttribute("car_id", car_id);
		return "redirect:/admin/colorInsertForm/"+car_id;
	}
	
	//옵션 등록
	@RequestMapping("/optionForm")
	public String optionForm(Model model) throws Exception{
		model.addAttribute("list", carService.carList());
		return "/admin/optionForm";
	}
	
	@RequestMapping("/optionProc")
	public String optionProc(HttpServletRequest request)throws Exception{
		OptionCarVO option = new OptionCarVO();
		option.setRent_id(0);
		option.setOption_content(request.getParameter("option_content"));
		option.setOption_name(request.getParameter("option_name"));
		option.setOption_price(Integer.parseInt(request.getParameter("option_price")));
		carService.optionInsert(option);
		
		return "redirect:/admin/optionForm";
	}
	
	//옵션 전체 조회
	@RequestMapping("/optionList")
	@ResponseBody
	public List<OptionCarVO> optionList()throws Exception{
		return carService.carOptionDetail("0");
	}
	
	//차량 목록
	@RequestMapping("/carList")
	public String carList(Model model)throws Exception{
		model.addAttribute("list", carService.carList());
		return "/admin/carList";
	}
	
	//차량 수정
	@RequestMapping("/carUpdateForm/{id}")
	public String carUpdateForm(Model model,@PathVariable String id)throws Exception{
		model.addAttribute("car", carService.carDetail(id));
		return "/admin/carUpdateForm";
	}
	
	@RequestMapping("/carUpdateProc")
	public String carUpdateProc(CarVO car)throws Exception{
		carService.carUpdate(car);
		return "redirect:/admin/carList";
	}
	
	//차량 상세정보
	@RequestMapping("/carDetail/{id}")
	public String carDetail(@PathVariable String id, Model model)throws Exception{
		model.addAttribute("detail", carService.carDetail(id));
		model.addAttribute("color",  colorService.carColorDetail(id));
		return "/admin/carDetail";
	}
	
	//id에 따른 차량 색상 조회
	@RequestMapping("/colorList")
	@ResponseBody
	public List<CarColor> colorList(@RequestParam String car_id)throws Exception{
		System.out.println(car_id);
		return colorService.carColorDetail(car_id);
	}
	
	//렌트 입력 폼
	@RequestMapping("/rentInsertForm")
	public String rentInsertForm(Model model)throws Exception{
		model.addAttribute("car", 	 carService.carList());
		model.addAttribute("option", carService.carOptionDetail("1"));
		return "/admin/rentInsertForm";
	}
	//car_id에 따른 색상 추출
	@RequestMapping("/getColor")
	@ResponseBody
	public List<CarColor> getColor(@RequestParam String car_id)throws Exception{
		System.out.println(colorService.carColorDetail(car_id));
		return colorService.carColorDetail(car_id);
	}
	
	@RequestMapping("/color")
	@ResponseBody
	public CarColor color(CarColor car)throws Exception{
		System.out.println(colorService.carColor(car));
		return colorService.carColor(car);
	}
	
	//렌트 등록 프로세스
	 @RequestMapping("/rentInsertProc") 
	 public String rentInsertProc(RentVO rent, Model model, HttpServletRequest request)throws Exception{ 
		 rentService.rentCarInsert(rent);
		 List<OptionCarVO> list = carService.carOptionDetail("0");
		 for(OptionCarVO olist : list) {
			 if(request.getParameter(olist.getOption_name())!=null) {
				 olist = carService.selectName(olist.getOption_name());
				 olist.setRent_id(rent.getRent_id());
				 carService.optionInsert(olist);
			 }
		 }
		 return "redirect:/admin/rentInsertForm"; 
	 }
	 
	 //렌트 리스트
	 @RequestMapping("/rentList")
	 public String rentList(Model model)throws Exception{
		 List<CarVO> carList = new ArrayList<CarVO>();
		 for(RentVO rent : rentService.rentList()) {
			 carList.add(carService.carDetail(Integer.toString(rent.getCar_id())));
		 }
		 System.out.println(rentService.rentList());
		 model.addAttribute("car", carList);
		 model.addAttribute("rent", rentService.rentList());
		 return "/admin/rentList";
	 }
	 
	 @RequestMapping("/rentDetail/{id}")
	 public String rentDetail(@PathVariable String id, Model model)throws Exception{
		 model.addAttribute("option", carService.carOptionDetail(id));
		 return "/admin/rentDetail";
	 }
}
