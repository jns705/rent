package com.rent.mapper;

import org.springframework.stereotype.Repository;

@Repository("com.rent.mapper.LogMapper")
public interface LogMapper {
	
	public int insertLog(String content) throws Exception;
}
