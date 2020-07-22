package com.rent.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PreferenceVO {
	//성별
	private int man;		//남자
	private int women;	//여자
	private int gender;	//사람수
	
	//나이대
	private int Twenties;	//20대
	private int Thirties;	//30대
	private int Forties;		//40대
	private int Fifteen;		//50대
	private int Sixties;		//60대
	private int age;			//사람수
	
}
