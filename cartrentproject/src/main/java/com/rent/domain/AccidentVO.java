package com.rent.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AccidentVO {
	private int accident_id;
	private String accident_date;
	private String accident_content;
	private int accident_price;
	private String special_note;
	private int rent_id;

}
