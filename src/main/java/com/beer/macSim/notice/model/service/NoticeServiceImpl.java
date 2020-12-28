package com.beer.macSim.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.notice.model.dao.NoticeDao;
import com.beer.macSim.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
    private NoticeDao nDao;
    @Autowired
    private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int selectListCount() {
		return nDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return nDao.selectNoticeList(pi, sqlSession);
	}

	@Override
	public int increaseCount(int nno) {
		return nDao.increaseCount(sqlSession, nno);
	}

	@Override
	public Notice selectNotice(int nno) {
		return nDao.selectNotice(sqlSession, nno);
	}


	
	

	
}
