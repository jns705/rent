package com.rent.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.mapper.MemberMapper;

@Service("com.rent.service.MemberService")
public class MemberService {
	
	@Resource(name="com.rent.service.MemberMapper")
	MemberMapper mapper;
}
