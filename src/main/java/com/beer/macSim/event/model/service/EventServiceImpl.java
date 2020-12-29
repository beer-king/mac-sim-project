package com.beer.macSim.event.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.event.model.dao.EventDao;
import com.beer.macSim.event.model.vo.Attachment;
import com.beer.macSim.event.model.vo.EvReply;
import com.beer.macSim.event.model.vo.Event;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private EventDao evDao;
	
	@Override
	public int selectEventCount() {
		return evDao.selectEventCount(sqlSession);
		
	}

	@Override
	public ArrayList<Event> selectEventList(PageInfo pi) {
		return evDao.selectEventList(sqlSession, pi);
	}

	@Override
	public int increaseCount(int eno) {
		return evDao.increaseCount(sqlSession, eno);
	}

	@Override
	public Event selectEvent(int eno) {
		return evDao.selectEvent(sqlSession, eno);
	}

	@Override
	public ArrayList<EvReply> selectEvReplyList(int eno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertEvReply(EvReply er) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int insertEvent(Event e) {
		return evDao.insertEvent(sqlSession, e);
	}

	@Override
	public int insertAttachment(Attachment a) {
		return evDao.insertAttachment(sqlSession, a);
	}

	@Override
	public ArrayList<Attachment> selectEvAttachment(int eno) {
		return evDao.selectEvAttachment(sqlSession, eno);
	}

}
