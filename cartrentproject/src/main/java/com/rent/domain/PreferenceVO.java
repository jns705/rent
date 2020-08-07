package com.rent.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PreferenceVO {
	//성별
	private int man;	//남자
	private int women;	//여자
	
	//나이대
	private int twenties;	//20대
	private int thirties;	//30대
	private int forties;	//40대
	private int fifteen;	//50대
	private int sixties;	//60대
	
	//총인원수
	private int total;
	
}
