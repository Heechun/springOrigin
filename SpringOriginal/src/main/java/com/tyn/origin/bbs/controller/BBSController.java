package com.tyn.origin.bbs.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tyn.origin.bbs.service.BBSService;
import com.tyn.origin.bbs.vo.BBSVO;
import com.tyn.origin.bbs.vo.CommentVO;

@Controller
public class BBSController {
	@Resource(name = "bbsService")
	private BBSService bbsService;
	
	private static final Logger logger = LoggerFactory.getLogger(BBSController.class);
	
	@RequestMapping("/bbs.do")
	public ModelAndView bbsMain(@RequestParam("page") int page){
		logger.info("bbs.do 접속");
		return bbsService.bbsMain(page);
	}
	
	@RequestMapping("/bbsInsert.do")
	public String bbsInsert(){
		logger.info("bbsInsert.do 접속");
		return "insert";
	}
	
	@RequestMapping("/bbsInsertImpl.do")
	public String bbsInsertImpl(@ModelAttribute BBSVO bbsVo){
		logger.info("bbsInsertImpl.do 접속");
		bbsService.bbsInsertImpl(bbsVo);
		return "redirect:/bbs.do?page=1";
	}
	
	@RequestMapping("/bbsRead.do")
	public ModelAndView bbsRead(@RequestParam("idx") int idx, @RequestParam("page") int page, 
			@RequestParam(value="sort", required=false, defaultValue="0")int sort){
		logger.info("bbsRead.do 접속");
		
		return bbsService.bbsRead(idx, page, sort);
	}
	@RequestMapping("/bbsDelete.do")
	public String bbsDelete(@RequestParam("idx") int idx, @RequestParam("page")int page){
		logger.info("bbsDelete.do 접속");
		bbsService.bbsDelete(idx);
		return "redirect:/bbs.do?page="+page;
	}
	/*
	 * 댓글관련 controller
	 * 
	 */
	@RequestMapping("/commentInsert.do")
	public String commentInsert(@ModelAttribute CommentVO commentVo, @RequestParam("page") int page){
		logger.info("commentInsert.do 접속");
		bbsService.commentInsert(commentVo);
		
		return "redirect:/bbsRead.do?idx="+commentVo.getBbsIdx()+"&page="+page;
	}
	@RequestMapping("/commentCountBtn.do")
	public void commentCount(@RequestParam("commentIdx") int commentIdx, @RequestParam("key") int key, HttpServletResponse res){
		logger.info("commentCountBtn.do 접속(json)");
		bbsService.commentCount(commentIdx, key, res);
	}
	
	@RequestMapping("/commentDelete.do")
	public String commentDelete(@RequestParam("commentIdx")int commentIdx, @RequestParam("bbsIdx")int bbsIdx, @RequestParam("page")int page){
		logger.info("commentDelete.do 접속");
		bbsService.commentDelete(commentIdx);
		return "redirect:/bbsRead.do?idx="+bbsIdx+"&page="+page;
	}
}
