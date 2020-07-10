package com.rent.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.OptionCarVO;
import com.rent.mapper.CarOptionMapper;

@Service("com.rent.service.CarOptionService")
public class CarOptionService {
	
	@Resource(name="com.rent.mapper.CarOptionMapper")
	CarOptionMapper mapper;
	
	public int optionDelete(String rent_id)throws Exception{
		return mapper.optionDelete(rent_id);
	}
	
	public int optionInsert(OptionCarVO option)throws Exception{
		return mapper.optionInsert(option);
	}
	
	public List<OptionCarVO> optionDetail(String rent_id) throws Exception{
		return mapper.optionDetail(rent_id);
	}
	
	public List<OptionCarVO> optionList() throws Exception{
		return mapper.optionList();
	}
	
	public int optionUpdate(OptionCarVO option)throws Exception{
		return mapper.optionUpdate(option);
	}
	
	public OptionCarVO selectName(String name)throws Exception{
		return mapper.selectName(name);
	}
	
	
}
