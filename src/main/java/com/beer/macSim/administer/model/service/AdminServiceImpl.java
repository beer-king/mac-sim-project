package com.beer.macSim.administer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beer.macSim.administer.model.dao.AdminDao;
import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.data.model.vo.Beers;
import com.beer.macSim.member.model.vo.Member;
import com.beer.macSim.notice.model.vo.Notice;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDao aDao;
	
	
	
	@Override
	public int insertBeer(Beers b, Member m) {
		return aDao.insertBeer(sqlSession,b,m);
	}
	
	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return aDao.selectNoticeList(pi, sqlSession);
	}

	@Override
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}

	@Override
	public int insertNotice(Notice n) {
		return aDao.insertNotice(sqlSession,n);
	}
	
	
}
