package com.beer.macSim.administer.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beer.macSim.administer.model.dao.AdminDao;
import com.beer.macSim.administer.model.vo.Batch;
import com.beer.macSim.administer.model.vo.BeerSearch;
import com.beer.macSim.administer.model.vo.GbRequest;
import com.beer.macSim.administer.model.vo.Report;
import com.beer.macSim.administer.model.vo.SelectData;
import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.data.model.vo.Beers;
import com.beer.macSim.event.model.vo.Attachment;
import com.beer.macSim.event.model.vo.Event;
import com.beer.macSim.groupBuy.model.vo.GroupBuy;
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

	@Override
	public int selectEventListCount(BeerSearch bs) {
		return aDao.selectEventListCount(sqlSession, bs);
	}

	@Override
	public ArrayList<Event> selectEventList(BeerSearch bs, PageInfo pi) {
		return aDao.selectEventList(sqlSession, pi, bs);
	}

	@Override
	public int updateBatchEvent(Batch b) {
		return aDao.updateBatchEvent(sqlSession, b);
	}

	@Override
	public Event selectEventOne(String evNo) {
		return aDao.selectEventOne(sqlSession, evNo);
	}

	@Override
	public Beers selectBeerOne(String beerNo) {
		return aDao.selectBeerOne(sqlSession, beerNo);
	}

	@Override
	public int updateBeer(Beers b, Member m) {
		return aDao.updateBeer(sqlSession, b, m);
	}

	@Override
	public int updateBatchReport(Batch b) {
		return aDao.updateBatchReport(sqlSession, b);
	}

	@Override
	public int selectPnocurrent() {
		return aDao.selectPnocurrent(sqlSession);
	}

	@Override
	public int enrollGB(GroupBuy GB) {
		return  aDao.enrollGB(sqlSession, GB);
	}

	@Override
	public int enrollAT(Attachment a1, Attachment a2) {
		return aDao.enrollAT(sqlSession, a1, a2);
	}

	@Override
	public ArrayList<GbRequest> selectGBRlist(BeerSearch bs, PageInfo pi) {
		return aDao.selectGBRlist(sqlSession, bs, pi);
	}

	@Override
	public int selectGBRlistCount(BeerSearch bs) {
		return aDao.selectGBRlistCount(sqlSession, bs);
	}

	@Override
	public int updateBatchGB(Batch b) {
		return aDao.updateBatchGB(sqlSession, b);
	}
	
	
}
