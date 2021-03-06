package com.rent.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RentVO {
	private int rent_id;
	private int car_id;
	private String color;
	private int milage;
	private Timestamp reg_date;
	private String location;
	private String manufacturer;
	private String special_note;
	private String Max_month;
	private String situation;
	private String car_number;
	private int price;
	private int standby_personnel;
	private String rent_url;
	private	String car_name;
	private int count;
	private int car_price;
	
	
	private	String color_url;
	private	String color_image;

}
