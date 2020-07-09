package com.rent.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.rent.domain.CommentVO;
import com.rent.mapper.CommentMapper;

@Service("com.rent.service.CommentService")
public class CommentService {
	
	@Resource(name="com.rent.mapper.CommentMapper")
	CommentMapper mapper;
	
	//댓글 개수
	public int commentCount(int qna_id) throws Exception{
		return mapper.commentCount(qna_id);
	}
	
	// 댓글 목록
	public List<CommentVO> commentList(int qna_id) throws Exception{
		return mapper.commentList(qna_id);
	}
	
	// 댓글 등록
	public int commentInsert(CommentVO comment) throws Exception{
		return mapper.commentInsert(comment);
	}
	
	// 댓글 수정
	public int commentUpdate(CommentVO comment) throws Exception{
		return mapper.commentUpdate(comment);
	}
	
	// 댓글 삭제
	public int commentDelete(int comment_id) throws Exception{
		return mapper.commentDelete(comment_id);
	}
	
	//대댓글 목록
	public List<CommentVO> recommentList(CommentVO comment) throws Exception {
		return mapper.recommentList(comment);
	}
	
	// 대댓글 등록
	public int recommentInsert(CommentVO comment) throws Exception {
		return mapper.recommentInsert(comment);
	}
	
	// 대댓글 수정
	public int recommentUpdate(CommentVO comment) throws Exception {
		return mapper.recommentUpdate(comment);
	}
	
	
}
