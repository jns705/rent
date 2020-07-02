package com.rent.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rent.domain.CommentVO;

@Repository("com.rent.mapper.CommentMapper")
public interface CommentMapper {
	
	//댓글 개수
	public int commentCount() throws Exception;
	
	// 댓글 목록
	public List<CommentVO> commentList(int comment_id) throws Exception;
	
	// 댓글 등록
	public int commentInsert(CommentVO comment) throws Exception;
	
	// 댓글 수정
	public int commentUpdate(CommentVO comment) throws Exception;
	
	// 댓글 삭제
	public int commentDelete(int comment_id) throws Exception;

}
