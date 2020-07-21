package com.rent.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BuyVO {
	//buy에 car_id를 넣으면 car테이블에서 car_number +1?
	private int buy_id;
	private String id;
	private String rent_id;
	private String option_name;
	private String color;
	private Timestamp buy_date;
	private String counseling_date;
	private String name;
	private String address;
	private String tel;
	private String month;

}
