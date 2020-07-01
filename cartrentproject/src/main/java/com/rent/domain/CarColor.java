package com.rent.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CarColor {
	private int color_id;
	private int car_id;
	private String color;
	private String color_image;
	private String color_url;

}
