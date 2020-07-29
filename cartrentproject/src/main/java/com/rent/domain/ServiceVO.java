package com.rent.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ServiceVO {
	private int no;
	private String division;
	private String subject;
	private String content;
	private Date   reg_date;
}
