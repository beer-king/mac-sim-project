package com.beer.macSim.groupBuy.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.groupBuy.model.dao.GroupBuyDao;
import com.beer.macSim.groupBuy.model.vo.GbReply;
import com.beer.macSim.groupBuy.model.vo.GroupBuy;

@Service
public class GroupBuyServiceImpl implements GroupBuyService {
	
	@Autowired
	private GroupBuyDao gbDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<GroupBuy> selectGroupBuyList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int increaseCount(int gbno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public GroupBuy selectGroupBuy(int gbno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<GbReply> selectGbReplyList(int gbno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertGbReply(GbReply gr) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}