package com.rent.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageMaker {
	
	private int pageNum=1;	//페이지 번호
	private int amount=6;	//화면에 표시할 글목록의 개수
	
	private int startPage;
	private int endPage;
	private int startRow;
	private int endRow;
	private int pageCount;
	private int pageBlock;
	private int currentPage;
	private boolean prev;
	private boolean next;
	
	//	페이지메이커에서는 PagingCriteria와 total을 받아준다.
	//	*Math.ceil : 올림
	//total 글의 전체 개수
	public PageMaker(){
		int total = 18;
		currentPage = pageNum;
		
		//cri.getAmount() : 화면에 표시할 글목록의 개수를 설정한다.
		//startRow : 현 페이지 글목록에 표시할 시작 글번호를 설정하는 부분이다.
		//startRow변수는 시작 글 번호를 가지고 있다.
		this.startRow = (currentPage - 1) * amount +1;
		//endRow : 현 페이지 글목록에 표시할 마지막 글번호를 설정하는 부분이다.
		//endRow변수는 마지막 글 번호를 가지고 있다.
		this.endRow = currentPage * amount;
		//pageCount : 보여져야할 페이지수.
		//한 화면에 보이는 개수로 나누어 나머지가 있으면 한페이지를 더 보여야 한다.
		this.pageCount = total / amount + (total % amount == 0 ? 0 : 1);
		this.startPage = (int)(currentPage/10)*10+1;
		this.pageBlock = 5; //화면 화단에 보여줄 페이지의 개수
		this.endPage = startPage + pageBlock -1;
		//계산한 endPage가 실제 가지고 있는 페이지수보다 많으면 가장 마지막 페이지를 실제 페이지로 맞춘다.
		if(endPage > pageCount) endPage = pageCount;
		
		this.prev = startPage > pageBlock; //이전
		this.next = endPage < pageCount; //다음
		
		
	}
}
