package com.rent.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OptionCarVO {
	
	private int rent_id;
	private int option_price;
	private String option_id;
	private String option_name;
	private String option_content;

}
