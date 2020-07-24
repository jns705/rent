package com.rent.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PagingCriteria {
	
	private int pageNum=1;	//페이지 번호
	private int amount=6;	//화면에 표시할 글목록의 개수
	
}
