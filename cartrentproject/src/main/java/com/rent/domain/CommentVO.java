package com.rent.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentVO {
	private int comment_id;
	private int qna_id;
	private String content;
	private String writer;
	private Timestamp comment_date;
	private int recomment_id;
	private String comment_content;
	private String comment_writer;

}
