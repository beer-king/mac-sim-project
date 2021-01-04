package com.beer.macSim.administer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beer.macSim.administer.model.dao.AdminDao;
import com.beer.macSim.administer.model.vo.BeerSearch;
import com.beer.macSim.administer.model.vo.Report;
import com.beer.macSim.administer.model.vo.SelectData;
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
	public ArrayList<Notice> selectNoticeList(PageInfo pi, BeerSearch bs) {
		return aDao.selectNoticeList(pi, bs, sqlSession);
	}

	@Override
	public int selectListCount(BeerSearch bs) {
		return aDao.selectListCount(bs, sqlSession);
	}

	@Override
	public int insertNotice(Notice n) {
		return aDao.insertNotice(sqlSession,n);
	}

	@Override
	public int updateNotice(Notice n) {
		return aDao.updateNotice(sqlSession, n);
	}

	@Override
	public int deleteNotice(String noticeNo) {
		return aDao.deleteNotice(sqlSession, noticeNo);
	}

	@Override
	public Notice selectNotice(String noticeNo) {
		return aDao.selectNotice(sqlSession, noticeNo);
	}

	@Override
	public int selectCallListCount(SelectData sd) {
		return aDao.selectCallListCount(sqlSession, sd);
	}

	@Override
	public ArrayList<Report> selectCallList(PageInfo pi, SelectData sd) {
		return aDao.selectCallList(sqlSession, pi, sd);
	}

	@Override
	public int selectUserListCount(int status) {
		return aDao.selectUserListCount(status, sqlSession);
	}

	@Override
	public ArrayList<Member> selectUserList(PageInfo pi, int status) {
		return aDao.selectUserList(pi, status, sqlSession);
	}

	@Override
	public ArrayList<String> selectBeerNameAll() {
		return aDao.selectBeerNameAll(sqlSession);
	}

	@Override
	public int userBan(String userNo) {
		return aDao.userBan(sqlSession, userNo);
	}

	@Override
	public int reportBC(SelectData sd) {
		return aDao.reportBC(sqlSession, sd);
	}

	@Override
	public int selectBeerListCount(BeerSearch bs) {
		return aDao.selectBeerListCount(sqlSession, bs);
	}

	@Override
	public ArrayList<Beers> selectBeerList(BeerSearch bs, PageInfo pi) {
		return aDao.selectBeerList(sqlSession, pi, bs);
	}
	
	
}
