package com.rent.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.mapper.CommentMapper;

@Service("com.rent.service.CommentService")
public class CommentService {
	
	@Resource(name="com.rent.mapper.CommentMapper")
	CommentMapper mapper;
	
	
	
}
