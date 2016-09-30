package com.tyn.origin.bbs.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.tyn.origin.bbs.vo.BBSVO;
import com.tyn.origin.bbs.vo.CommentVO;

@Repository
public interface BBSDao {

	int getTotalCount();

	List<BBSVO> getBBSList(HashMap<String, Integer> map);

	void insertBBS(BBSVO bbsVo);

	BBSVO getBBSContent(int idx);

	void updateHit(int idx);

	void insertComment(CommentVO commentVo);

	List<CommentVO> getCommentList(int idx);

	void updateGoodCount(int commentIdx);

	void updateBadCount(int commentIdx);

	void deleteComment(int commentIdx);

	void deleteBBS(int idx);

	List<CommentVO> getCommentListByNew(int idx);


}
