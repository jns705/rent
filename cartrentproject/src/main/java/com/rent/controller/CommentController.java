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
	
	@RequestMapping("/insert")
	@ResponseBody
	private int CommentInsert(@RequestParam int qna_id, @RequestParam String content,  @RequestParam String writer) throws Exception{
		System.out.println("commentInsert()");
		CommentVO comment = new CommentVO();
		comment.setQna_id(qna_id);
		comment.setContent(content);
		comment.setWriter(writer);
		return service.commentInsert(comment);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	private int CommentUpdate(@RequestParam CommentVO comment) throws Exception {
		return service.commentUpdate(comment);
	}
	
	@RequestMapping("/delete/{comment_id}")
	@ResponseBody
	private int CommentDelete(@PathVariable int comment_id) throws Exception {
		return service.commentDelete(comment_id);
	}
	
	@RequestMapping("/list/{qna_id}")
	@ResponseBody
	private List<CommentVO> CommentList(@PathVariable int qna_id, Model model) throws Exception {
		System.out.println("CommentList()");
		return service.commentList(qna_id);
	}
}
