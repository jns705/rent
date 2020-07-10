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
	
	int id = 0 ; //댓글 순서를 위해 필요한 변수
	/**
	 * 댓글 등록
	 * @param comment - domain
	 */
	@RequestMapping("/insert")
	@ResponseBody
	private int CommentInsert(CommentVO comment) throws Exception{
		
		List<CommentVO> comList = service.commentList(comment.getQna_id());
		
		//서버 재접속 하면 id값이 0이 된다. 이를 방지하기 위해 for문을 실행시킨다.
		for(int i=0; i < comList.size() ; i++) {
			
			//count에 recomment_id의 max 값을 넣는다.
			int count = comList.get(i).getRecomment_id();
			
			//recomment_id 값이 있으면 id에 recomment_id +1 값을 넣는다
			if(id < comList.get(i).getRecomment_id()) id = count+1;
		}
		comment.setRecomment_id(id);
		id++;
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
	private int commentDelete(@PathVariable int comment_id) throws Exception {
		
		CommentVO comment = new CommentVO();
		
		comment = service.commentDetail(comment_id);
		List<CommentVO> idList = service.recommentDeleteList(comment);
		
		if(comment.getContent() != null) {
			for(int i=0; i < idList.size(); i++) {
				int commentList = idList.get(i).getComment_id();
				System.out.println(commentList);
				service.commentDelete(commentList);
			}
		}
		
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
		comment.setRecomment_id(comment.getRecomment_id());
		return service.recommentInsert(comment);
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
	//
	//
	//
	//
	//
	
	
	
}
