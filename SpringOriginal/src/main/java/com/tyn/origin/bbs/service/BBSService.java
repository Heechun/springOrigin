package com.tyn.origin.bbs.service;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.tyn.origin.bbs.vo.BBSVO;
import com.tyn.origin.bbs.vo.CommentVO;

public interface BBSService {

	ModelAndView bbsMain(int page);

	void bbsInsertImpl(BBSVO bbsVo);

	ModelAndView bbsRead(int idx, int page, int sort);

	void commentInsert(CommentVO commentVo);

	void commentCount(int commentIdx, int key, HttpServletResponse res);

	void commentDelete(int commentIdx);

	void bbsDelete(int idx);

}
