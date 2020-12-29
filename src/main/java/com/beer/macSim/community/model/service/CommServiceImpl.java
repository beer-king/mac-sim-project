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
	private CommDao cmDao;

	@Override
	public int selectCommCount(int cate) {
		return cmDao.selectCommCount(sqlSession, cate);
	}

	@Override
	public ArrayList<Community> selectCommList(int cate, PageInfo pi) {
		return cmDao.selectCommList(sqlSession, cate, pi);
	}

	@Override
	public int insertComm(Community comm) {
		return 0;
	}

	@Override
	public int selectForumCount() {
		return 0;
	}

	@Override
	public ArrayList<Forum> selectForumList(PageInfo pi) {
		return null;
	}

	@Override
	public int increaseCount(int fno) {
		return 0;
	}

	@Override
	public Forum selectForum(int fno) {
		return null;
	}

	@Override
	public int insertForum(Forum fo) {
		return 0;
	}

}
