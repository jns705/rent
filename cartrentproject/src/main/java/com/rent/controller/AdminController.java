package com.rent.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rent.domain.CarColor;
import com.rent.domain.CarVO;
import com.rent.domain.OptionCarVO;
import com.rent.domain.RentImageVO;
import com.rent.domain.RentVO;
import com.rent.service.AccidentService;
import com.rent.service.CarColorService;
import com.rent.service.CarOptionService;
import com.rent.service.CarService;
import com.rent.service.RentImageService;
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
	
	@Resource(name="com.rent.service.AccidentService")
	AccidentService accService;
	
	@Resource(name="com.rent.service.CarOptionService")
	CarOptionService opService;
	
	@Resource(name="com.rent.service.RentImageService")
	RentImageService rentImageService;
	
	//차량 등록
	@RequestMapping("/carInsert")
	public String carInsertForm(Model model)throws Exception{
		return "/admin/carInsertForm";
	}
	
	//차량 등록
	@RequestMapping("/carInsertProc")
	public String carInsertForm(CarVO car)throws Exception{
			carService.carInsert(car);
		return "redirect:/admin/colorInsertForm/"+car.getCar_id();
	}
	
	//차 등록폼
	@RequestMapping("/colorInsertForm/{id}")
	public String colorInsertForm(Model model, @PathVariable String id) throws Exception{
		model.addAttribute("list", carService.carList());
		model.addAttribute("car_id", id);
		model.addAttribute("option", opService.optionList());
		return "/admin/colorInsertForm";
	}
	
	//차량 색상 등록
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
		colorService.colorInsert(file);
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
	
	//옵션등록
	@RequestMapping("/optionProc")
	public String optionProc(OptionCarVO option, HttpServletRequest request)throws Exception{
		if(!option.getOption_name().equals(""))
		opService.optionInsert(option);
		int size = opService.optionDetail(Integer.toString(option.getRent_id())).size();
		System.out.println(size);
		for(int i = 0; i < size; i++) {
			if(request.getParameter("option_name"+i)!= null) {
				OptionCarVO list = new OptionCarVO();
				list.setOption_content	(request.getParameter("option_content"+i));
				list.setOption_name   	(request.getParameter("option_name"+i));
				list.setOption_price	(Integer.parseInt(request.getParameter(("option_price"+i))));
				list.setOption_id	    ((request.getParameter(("option_id"+i))));
				list.setRent_id			(option.getRent_id());
				opService.optionUpdate(list);
				System.out.println(list);
			}
		}
		return "redirect:/admin/optionForm";
	}
	
	//옵션 전체 조회
	@RequestMapping("/optionList")
	@ResponseBody
	public Map<String, Object> optionList(@RequestParam String rent_id)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", 	opService.optionDetail(rent_id));
		map.put("detail", 	opService.optionDetailAll());
		return map;
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
	
	//차량 삭제
	@RequestMapping("/carDeleteProc/{id}")
	public String carDeleteForm(Model model,@PathVariable String id)throws Exception{
		model.addAttribute("car", carService.carDelete(id));
		return "redirect:/admin/carList";
	}
	
	//차량업데이트
	@RequestMapping("/carUpdateProc")
	public String carUpdateProc(CarVO car)throws Exception{
		carService.carUpdate(car);
		return "redirect:/admin/carList";
	}
	
	//차량 상세정보
	@RequestMapping("/carDetail/{id}")
	public String carDetail(@PathVariable String id, Model model)throws Exception{
		model.addAttribute("detail", carService.carDetail(id));
		model.addAttribute("color",  colorService.colorDetail(id));
		return "/admin/carDetail";
	}
	
	//id에 따른 차량 색상 조회
	@RequestMapping("/colorList")
	@ResponseBody
	public List<CarColor> colorList(@RequestParam String car_id)throws Exception{
		System.out.println(car_id);
		return colorService.colorDetail(car_id);
	}
	
	//렌트 입력 폼
	@RequestMapping("/rentInsertForm")
	public String rentInsertForm(Model model)throws Exception{
		model.addAttribute("car", 	 carService.carList());
		return "/admin/rentInsertForm";
	}
	//car_id에 따른 색상 추출
	@RequestMapping("/getColor")
	@ResponseBody
	public List<CarColor> getColor(@RequestParam String car_id)throws Exception{
		System.out.println(colorService.colorDetail(car_id));
		return colorService.colorDetail(car_id);
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
		 if(rent.getColor()!=null) 
		 rentService.rentCarInsert(rent);
		 else
		 opService.optionDelete(Integer.toString(rent.getRent_id()));
		 
		 List<OptionCarVO> list = opService.optionDetailAll();
		 for(OptionCarVO olist : list) {
			 if(request.getParameter(olist.getOption_name())!=null) {
				 olist = opService.selectName(olist.getOption_name());
				 olist.setRent_id(rent.getRent_id());
				 opService.optionInsert(olist);
			 }
		 }
			 return "redirect:/admin/rentDetail/"+rent.getRent_id();
	 }
	 
	 //렌트 리스트
	 @RequestMapping("/rentList")
	 public String rentList(Model model)throws Exception{
		 int [] imageSize = new int[rentService.rentList().size()];
		 List<CarVO> carList = new ArrayList<CarVO>();
		 for(int i = 0; i < rentService.rentList().size(); i++) {
			 RentVO rent = rentService.rentList().get(i);
			 carList.add(carService.carDetail(Integer.toString(rent.getCar_id())));
			 imageSize[i] = rentImageService.imageCount(rent.getRent_id());
		 }
		 System.out.println(imageSize.toString());
		 model.addAttribute("car", carList);
		 model.addAttribute("rent", rentService.rentList());
		 model.addAttribute("image", imageSize);
		 return "/admin/rentList";
	 }
	 
	 @RequestMapping("/rentDetail/{rent_id}")
	 public String rentDetail(@PathVariable String rent_id, Model model)throws Exception{
		 model.addAttribute("option", 	opService.optionDetail(rent_id));
		 model.addAttribute("accident", accService.accidentListId(rent_id));
		 model.addAttribute("rent_id", 	rent_id);
		 return "/admin/rentDetail";
	 }
	 
	 @RequestMapping("/rentUpdateForm/{id}")
	 public String rentUpdateForm(@PathVariable String id, Model model)throws Exception{
		 model.addAttribute("rent",rentService.rentListId(id));
		 model.addAttribute("car" ,carService.carList());
		 return "/admin/rentUpdateForm";
	 }
	 
	 @RequestMapping("/rentUpdateProc")
	 public String rentUpdateProc(RentVO rent)throws Exception{
		 rentService.rentCarUpdate(rent);
		 return "redirect:/admin/rentList";
	 }
	 
	 @RequestMapping("/rentCarDelete/{id}")
	 public String rentCarDelete(@PathVariable String id)throws Exception{
		 rentService.rentCarDelete(id);
		 return "redirect:/admin/rentList";
	 }
	 
	 @RequestMapping("/situation")
	 @ResponseBody
	 public void situation(RentVO rent)throws Exception{
		 rentService.situation(rent);
	 }
	 
	 @RequestMapping("/rentImageForm/{id}")
	 public String rentImageForm(@PathVariable String id, Model model)throws Exception{
		 model.addAttribute("rent", rentService.rentDetail(id));
		 model.addAttribute("car", 	carService.carDetail(Integer.toString(rentService.rentDetail(id).getCar_id())));
		 return "/admin/rentImageForm";
	 }
	 
		@RequestMapping("/rentImageProc")
		public String rentImageProc(@RequestParam int rent_id, @RequestParam String rent_image, Model model, @RequestPart MultipartFile files)throws Exception{
			
			//게시글 등록 화면에서 입력한 값들을 실어나르기 위한 BoardVO를 생성한다.
			RentImageVO file		=	new RentImageVO();
			
			if(!files.isEmpty()) {
			String 	sourceFileName = files.getOriginalFilename();
			File 	destinationFile;
			String	destinationFileName;
			// fileUrl="uploadFiles 폴더의 위치"
			String	fileUrl = "C:/Git/rent/cartrentproject/src/main/resources/static/rentUpload/";
			do {
				destinationFileName = RandomStringUtils.randomAlphabetic(32) + sourceFileName;
				destinationFile		= new File(fileUrl + destinationFileName);
			}while(destinationFile.exists());
			
			//MultipartFile.transferTo() : 요청 시점의 임시 파일을 로컬 파일 시스템에 영구적으로 복사해준다.
			destinationFile.getParentFile().mkdir();
			files.transferTo(destinationFile);
			
			file.setRent_id(rent_id);
			file.setRent_image(rent_image);
			file.setRent_url("http://localhost:8082/static/rentUpload/" + destinationFileName);
			
			rentImageService.imageInsert(file);
			}
			return "redirect:/admin/rentImageForm/"+rent_id;
		}
		
		@RequestMapping("/rentImageList")
		@ResponseBody
		public List<RentImageVO> rentImageList(@RequestParam int rent_id)throws Exception{
			return rentImageService.imageList(rent_id);
		}
	 
	 
}
