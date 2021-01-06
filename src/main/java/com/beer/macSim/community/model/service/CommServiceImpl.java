package com.beer.macSim.community.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.community.model.dao.CommDao;
import com.beer.macSim.community.model.vo.CommLikes;
import com.beer.macSim.community.model.vo.Community;
import com.beer.macSim.community.model.vo.Forum;
import com.beer.macSim.community.model.vo.Reply;
import com.beer.macSim.community.model.vo.SubReply;

@Service
public class CommServiceImpl  implements CommService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CommDao cDao;

	// 커뮤니티 (맥일/오맥) 리스트 조회
	@Override
	public int selectCommCount(int cate) {
		return cDao.selectCommCount(sqlSession, cate);
	}

	@Override
	public ArrayList<Community> selectCommList(int cate, PageInfo pi) {
		return cDao.selectCommList(sqlSession, cate, pi);
	}

	// 커뮤니티 (맥일/오맥) 작성
	@Override
	public int insertComm(Community comm) {
		return cDao.insertComm(sqlSession, comm);
	}

	// 커뮤니티 좋아요 조회
	@Override
	public ArrayList<CommLikes> selectCommLikes(int userNo) {
		return cDao.selectCommLikes(sqlSession, userNo);
	}

	// 포럼 리스트 조회
	@Override
	public int selectForumCount() {
		return cDao.selectForumCount(sqlSession);
	}

	@Override
	public ArrayList<Forum> selectForumList(PageInfo pi) {
		return cDao.selectForumList(sqlSession, pi);
	}

	// 포럼 상세 페이지 조회
	@Override
	public int increaseCount(int fno) {
		return cDao.increaseCount(sqlSession, fno);
	}

	@Override
	public Forum selectForumDetail(int fno) {
		return cDao.selectForumDetail(sqlSession, fno);
	}

	// 포럼 작성
	@Override
	public int insertForum(Forum fo) {
		return cDao.insertForum(sqlSession, fo);
	}

	// 포럼 댓글 조회
	@Override
	public ArrayList<Reply> selectReplyList(int fno) {
		return cDao.selectReplyList(sqlSession, fno);
	}
	// 포럼 대댓글 조회
	@Override
	public ArrayList<SubReply> selectSubReplyList(int coNo) {
		return cDao.selectSubReplyList(sqlSession, coNo);
	}

	@Override
	public int updateReplyUpdate(Reply r) {
		return cDao.updateReplyUpdate(sqlSession, r);
	}

	@Override
	public int updateSubReplyUpdate(Reply r) {
		return cDao.updateSubReplyUpdate(sqlSession, r);
	}

	@Override
	public int replyDelete(int coNo) {
		return cDao.replyDelete(sqlSession, coNo);
	}

	@Override
	public int subReplyDelete(int coNo) {
		return cDao.subReplyDelete(sqlSession, coNo);
	}

	@Override
	public int selectLikeLength(int cNo) {
		return cDao.selectLikeLength(sqlSession, cNo);
	}

	@Override
	public int selectIsLike(CommLikes cl) {
		return cDao.selectIsLike(sqlSession, cl);
	}

	@Override
	public int replyInsert(Reply r) {
		return cDao.replyInsert(sqlSession, r);
	}

	@Override
	public int subReplyInsert(Reply r) {
		return cDao.subReplyInsert(sqlSession, r);
	}

	@Override
	public ArrayList<Reply> selectReplyOne(Reply r) {
		return cDao.selectReplyOne(sqlSession, r);
	}

}
