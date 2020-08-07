package com.rent.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PagingVO {
	private int nowPage;	//현재페이지
	private int startPage;	//시작페이지
	private int endPage;	//끝페이지
	private int total;		//게시글 총 갯수
	private int cntPerPage; //페이지당 글 갯수
	private int lastPage;	//마지막페이지
	private int start;		//SQL쿼리에 쓸 start
	private int end;		//SQL쿼리에 쓸 end
	private int cntPage = 5;//화면에 보여줄 갯수
	
	public PagingVO() {
		//생성자
	}
	public PagingVO(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
		System.out.println("PagingVO 생성자 페이지당 글 갯수 "+cntPerPage);
	}
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage +1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage +1);
	}
	
}
