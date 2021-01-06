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
import com.beer.macSim.event.model.vo.EventAttendee;
import com.beer.macSim.event.model.vo.EventSearch;

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
		return evDao.selectEvReplyList(sqlSession, eno);
	}

	@Override
	public int insertEvReply(EvReply er) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int insertEvent(Event e, Attachment a) {
		
		int result1 = evDao.insertEvent(sqlSession, e);
		
		int result2 =1; // 첨부파일이 없어도 업로드 되게끔 1로 초기화
		if (a != null) { // 첨부파일이 있었을 경우
			result2 = evDao.insertAttachment(sqlSession, a);
		}
		
		return result1 * result2;
	}


	@Override
	public ArrayList<Attachment> selectEvAttachment(int eno) {
		return evDao.selectEvAttachment(sqlSession, eno);
	}

	@Override
	public int decreasePoint(EventAttendee ea) {
		return evDao.decreasePoint(sqlSession, ea);
	}

	@Override
	public int applyEvent(EventAttendee ea) {
		return evDao.applyEvent(sqlSession, ea);
	}

	@Override
	public int checkApplyEvent(EventAttendee ea) {
		return evDao.checkApplyEvent(sqlSession, ea);
	}

	@Override
	public int searchEventCount(EventSearch es) {
		return evDao.searchEventCount(sqlSession, es);
	}

	@Override
	public ArrayList<Event> searchEventList(PageInfo pi, EventSearch es) {
		return evDao.searchEventList(sqlSession, pi, es);
	}

}
