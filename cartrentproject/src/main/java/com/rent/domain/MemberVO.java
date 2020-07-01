package com.rent.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	private String id;
	private String password;
	private String name;
	private Timestamp reg_date;
	private String tel;
	private String address;
	private String date_of_birth;

}
