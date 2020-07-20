package com.rent.domain;

import java.util.List;

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
	private int count;
	private List<String> location;
	private List<String> fuel;
	private String  orderBy;
	private String  limit;
	private String  temp;
	
	private String car_number;

}
