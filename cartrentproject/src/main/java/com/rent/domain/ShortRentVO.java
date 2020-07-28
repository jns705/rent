package com.rent.domain;


import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ShortRentVO {
	private int buy_id;
	private int rent_id;
	private Date start_date;
	private String start_time;
	private String start_location;
	private Date end_date;
	private String end_time;
	private String end_location;
	private String rental_time;

}
