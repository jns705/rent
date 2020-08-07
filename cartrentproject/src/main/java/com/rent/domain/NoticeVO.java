package com.rent.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {
	
	private int no;				//공지사항 등록번호
	private String division;	//공지사항 구분(공통, 단기렌터카, 장기렌터카)
	private String subject;		//제목
	private String content;		//내용
	private String reg_date;	//등록날짜 ( now() )
	
}
