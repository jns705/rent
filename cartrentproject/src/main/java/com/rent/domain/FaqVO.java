package com.rent.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FaqVO {
	//Frequently Asked Questions 자주찾는질문
	
	private int fno;			//faq 고유번호
	private String division;	//구분 (전체, 다이렉트, 단기, 중고차장기, 전기차, 멤버십, 긴급출동/사고, 공통)
	private String subject;		//소제목
	private String content;		//내용
	private	String fileName;	// 저장될 파일명
	private String fileOriName;	// 원래 파일명
	private	String fileUrl;		// 파일의 위치
}
