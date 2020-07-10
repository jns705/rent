package com.rent.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rent.domain.CommentVO;
import com.rent.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Resource(name="com.rent.service.CommentService")
	CommentService service;
	
	/**
	 * 댓글 등록
	 * @param comment - domain
	 */
	@RequestMapping("/insert")
	@ResponseBody
	private int CommentInsert(CommentVO comment) throws Exception{
		System.out.println("commentInsert()");
		return service.commentInsert(comment);
	}
	
	/**
	 * 댓글 수정
	 * @param comment - domain
	 */
	@RequestMapping("/update")
	@ResponseBody
	private int commentUpdate(CommentVO comment) throws Exception {
		return service.commentUpdate(comment);
	}
	
	/**
	 * 댓글 삭제
	 * @param @PathVariable int comment_id
	 *	 commentAction.jsp 에서 comment_id의 값을 받아온다.
	 */
	@RequestMapping("/delete/{comment_id}")
	@ResponseBody
	private int commentDelete(@PathVariable int comment_id, Model model) throws Exception {
		return service.commentDelete(comment_id);
	}
	
	/**
	 * 댓글 목록
	 * @param @PathVariable int qna_id
	 * 	commentAction.jsp 에서 qna_id의 값을 받아온다.
	 */
	@RequestMapping("/list/{qna_id}")
	@ResponseBody
	private List<CommentVO> commentList(@PathVariable int qna_id) throws Exception {
		System.out.println("CommentList()");
		return service.commentList(qna_id);
	}
	
	/**
	 * 대댓글 등록
	 */
	@RequestMapping("/commentInsert")
	@ResponseBody
	private int recommentInsert(CommentVO comment) throws Exception {
		return service.recommentInsert(comment);
	}
	
	@RequestMapping("/commentList")
	@ResponseBody
	public List<CommentVO> recommentList(CommentVO comment) throws Exception {
		return service.recommentList(comment);
	}
	
	
	/**
	 * 대댓글 수정
	 * @param comment - domain
	 */
	@RequestMapping("/commentUpdate")
	@ResponseBody
	private int reCommentUpdate(CommentVO comment) throws Exception {
		return service.recommentUpdate(comment);
	}
	
	
	
}
