package com.rent.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CarVO {
	private int car_id;
	private String car_number; //??
	private String manufacturer;
	private String car_name;
	private int exhaust_volume;
	private String car_kind;
	private String fuel;
	private String transmission;
	private int car_price;
	private String made_country;
	private String content;
	private String car_year;

}
