package com.rent.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LogVO {
	private int Log_id;
	private String Log_content;
	private Timestamp Log_date;
}
