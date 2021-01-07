package com.beer.macSim.groupBuy.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.event.model.vo.Attachment;
import com.beer.macSim.groupBuy.model.dao.GroupBuyDao;
import com.beer.macSim.groupBuy.model.vo.GbReply;
import com.beer.macSim.groupBuy.model.vo.GbRequest;
import com.beer.macSim.groupBuy.model.vo.GroupBuy;

@Service
public class GroupBuyServiceImpl implements GroupBuyService {
	
	@Autowired
	private GroupBuyDao gbDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return gbDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<GroupBuy> selectGroupBuyList(PageInfo pi) {
		return gbDao.selectGroupBuyList(sqlSession, pi);
	}

	@Override
	public int increaseCount(int gno) {
		return gbDao.increaseCount(sqlSession, gno);
	}

	@Override
	public GroupBuy selectGroupBuy(int gno) {
		return gbDao.selectGroupBuy(sqlSession, gno);
	}
	
	@Override
	public ArrayList<Attachment> selectGbAttachment(int gno) {
		return gbDao.selectGbAttachment(sqlSession, gno);
	}

	@Override
	public ArrayList<GbReply> selectGbReplyList(int gno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertGbReply(GbReply gr) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseApplyNo(GbRequest gbr) {
		return gbDao.increaseApplyNo(sqlSession, gbr);
	}
	
	@Override
	public int decreasePoint(GbRequest gbr) {
		return gbDao.decreasePoint(sqlSession, gbr);
	}

	@Override
	public int applyGroupBuy(GbRequest gbr) {
		return gbDao.applyGroupBuy(sqlSession, gbr);
	}

	

}
