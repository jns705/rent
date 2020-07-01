package com.rent.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RentPrice {
	private int rentPrice_id;
	private int rent_id;
	private String rent_kind;
	private int months60;
	private int months48;
	private int months36;
	private int oneMonths;
	private int oneDays;

}
