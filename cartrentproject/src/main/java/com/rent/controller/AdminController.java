package com.rent.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.rent.domain.CarColor;
import com.rent.domain.CarVO;
import com.rent.domain.OptionCarVO;
import com.rent.service.CarService;


@Controller
@RequestMapping("/admin")
public class AdminController {

	@Resource(name = "com.rent.service.CarService")
	CarService carService;
	
	
	//차량 등록
	@RequestMapping("/carInsert")
	public String carInsertForm()throws Exception{
		return "/admin/carInsertForm";
	}
	
	@RequestMapping("/carInsertProc")
	public String carInsertForm(CarVO car)throws Exception{
			carService.carInsert(car);
		return "redirect:/admin/colorInsertForm/"+car.getCar_id();
	}
	
	//차 색상 등록
	@RequestMapping("/colorInsertForm/{id}")
	public String colorInsertForm(Model model, @PathVariable String id) throws Exception{
		model.addAttribute("list", carService.carList());
		model.addAttribute("car_id", id);
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
		String	fileUrl = "C:/cha/rent/cartrentproject/src/main/resources/static/upload/";
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
		file.setColor_url	("http://localhost:8082/static/img/");
		
		carService.colorInsert(file);
		}
		model.addAttribute("car_id", car_id);
		return "redirect:/admin/colorInsertForm/"+car_id;
	}
	
	//옵션 등록
	@RequestMapping("/optionForm/{id}")
	public String optionForm(Model model, @PathVariable String id) throws Exception{
		model.addAttribute("list", carService.carList());
		model.addAttribute("car_id", id);
		return "/admin/optionForm";
	}
	
	@RequestMapping("/optionProc")
	public String optionProc(@RequestParam int car_id, HttpServletRequest request)throws Exception{
		OptionCarVO option = new OptionCarVO();
		option.setCar_id(car_id);
		option.setOption_content(request.getParameter("option_content"));
		option.setOption_name(request.getParameter("option_name"));
		option.setOption_price(Integer.parseInt(request.getParameter("option_price")));
		carService.optionInsert(option);
		
		return "redirect:/admin/optionForm/"+car_id;
	}
	
	//차량 목록
	@RequestMapping("/carList")
	public String carList(Model model)throws Exception{
		model.addAttribute("list", carService.carList());
		return "/admin/carList";
	}
	
	//차량 상세정보
	@RequestMapping("/carDetail/{id}")
	public String carDetail(@PathVariable String id, Model model)throws Exception{
		model.addAttribute("detail", carService.carDetail(id));
		model.addAttribute("color",  carService.carColorList());
		model.addAttribute("option", carService.carOptionList());
		return "/admin/carDetail";
	}
}
