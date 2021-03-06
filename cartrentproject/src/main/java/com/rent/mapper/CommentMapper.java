package com.rent.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rent.domain.CommentVO;

@Repository("com.rent.mapper.CommentMapper")
public interface CommentMapper {
	
	// 댓글 개수
	public int commentCount(int qna_id) throws Exception;
	
	// 댓글 목록
	public List<CommentVO> commentList(int qna_id) throws Exception;
	
	// 댓글 등록
	public int commentInsert(CommentVO comment) throws Exception;
	
	// 댓글 수정
	public int commentUpdate(CommentVO comment) throws Exception;
	
	// 댓글 삭제
	public int commentDelete(int comment_id) throws Exception;
	
	// 댓글 삭제 시 대댓글의 comment_id를 알아오는 메서드
	public List<CommentVO> recommentDeleteList(CommentVO comment) throws Exception;
	
	// 댓글 삭제 시 삭제하는 댓글의 recomment_id를 가져오는 메서드
	public CommentVO commentDetail(int comment_id) throws Exception;
	
	// 대댓글 등록
	public int recommentInsert(CommentVO comment) throws Exception;
	
	// 대댓글 수정
	public int recommentUpdate(CommentVO comment) throws Exception;
	
}
