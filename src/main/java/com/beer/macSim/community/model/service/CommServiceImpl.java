package com.beer.macSim.community.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.community.model.dao.CommDao;
import com.beer.macSim.community.model.vo.Community;
import com.beer.macSim.community.model.vo.Forum;

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

	@Override
	public int insertComm(Community comm) {
		return 0;
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

	@Override
	public int insertForum(Forum fo) {
		return 0;
	}

}
