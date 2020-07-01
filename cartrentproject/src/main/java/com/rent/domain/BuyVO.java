package com.rent.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BuyVO {
	
	private int buy_id;
	private String id;
	private String car_id;
	private String option_name;
	private String color;
	private Timestamp buy_date;
	private String counseling_date;
	private String name;
	private String address;
	private String tel;
	private String month;

}
