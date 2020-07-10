package com.rent.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RentListVO {
	private String manufacturer;
	private	String car_kind;
	private String car_name;
	private String Max_month;
	private int price1;
	private int price2;
	private int milage1;
	private int milage2;
	private int reg_date1;
	private int reg_date2;
	private String  l0;
	private String  l1;
	private String  l2;
	private String  l3;
	private String  l4;
	private String  f0;
	private String  f1;
	private String  f2;
	private String  f3;
	private String  f4;
	private String  orderBy;
	private String  limit;
	
	private String car_number;

}
