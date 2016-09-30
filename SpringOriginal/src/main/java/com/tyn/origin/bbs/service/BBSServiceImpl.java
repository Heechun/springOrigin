package com.tyn.origin.bbs.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.tyn.origin.bbs.dao.BBSDao;
import com.tyn.origin.bbs.vo.BBSVO;
import com.tyn.origin.bbs.vo.CommentVO;

@Service("bbsService")
public class BBSServiceImpl implements BBSService {
	@Inject
	private BBSDao bbsDao;
	
	private static final Logger logger = LoggerFactory.getLogger(BBSServiceImpl.class);
	
	@Override
	public ModelAndView bbsMain(int page) {
		logger.info("bbsMain 접속");
		
		int endRow;
		int startRow;
		int totalCount = bbsDao.getTotalCount();
		int totalPage = totalCount / 10;
		ModelAndView mav = new ModelAndView();
		
		if(totalPage == 0){
			totalPage = 1;
		}
		else{
			totalPage += 1;
			if(totalCount%10 == 0){
				totalPage -= 1;
			}
		}
		
		if(page == totalPage){
			endRow = totalCount%10;
			if(endRow == 0){
				endRow = 10;
			}
			startRow = 1;
		}
		else{
			endRow = totalCount - (10*(page-1));
			startRow = endRow-9;
		}

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<BBSVO> bbsList = bbsDao.getBBSList(map);
		mav.addObject("bbsList", bbsList);
		mav.addObject("page", page);
		mav.addObject("totalPage", totalPage);
		mav.addObject("totalCount", totalCount);
		mav.setViewName("bbs");
		return mav;
	}

	@Override
	public void bbsInsertImpl(BBSVO bbsVo) {
		bbsDao.insertBBS(bbsVo);
	}

	@Override
	public ModelAndView bbsRead(int idx, int page, int sort) {
		ModelAndView mav = new ModelAndView();
		bbsDao.updateHit(idx);
		BBSVO bbsVo = bbsDao.getBBSContent(idx);
		List<CommentVO> commentVo;
		if(sort==0){
			commentVo = bbsDao.getCommentList(idx);
		}
		else{
			commentVo = bbsDao.getCommentListByNew(idx);
		}
		
		mav.addObject("bbsVo", bbsVo);
		mav.addObject("commentList", commentVo);
		mav.addObject("page", page);
		mav.setViewName("read");
		return mav;
	}

	@Override
	public void bbsDelete(int idx) {
		bbsDao.deleteBBS(idx);
	}	
	
	@Override
	public void commentInsert(CommentVO commentVo) {
		bbsDao.insertComment(commentVo);
	}

	@Override
	public void commentCount(int commentIdx, int key, HttpServletResponse res) {
		if(key==0){
			bbsDao.updateGoodCount(commentIdx);
		}
		else{
			bbsDao.updateBadCount(commentIdx);
		}
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("commentIdx", commentIdx);
		hm.put("key", key);

		JSONObject jb = new JSONObject(hm);
		
		PrintWriter pw;
		try {
			pw = res.getWriter();
			pw.println(jb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void commentDelete(int commentIdx) {
		bbsDao.deleteComment(commentIdx);
	}


}
