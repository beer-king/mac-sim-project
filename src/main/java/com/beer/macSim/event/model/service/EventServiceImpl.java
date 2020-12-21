package com.beer.macSim.event.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.event.model.vo.EvReply;
import com.beer.macSim.event.model.vo.Event;

@Service
public class EventServiceImpl implements EventService {

	@Override
	public int selectEventCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Event> selectEventList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int increaseCount(int eno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Event selectEvent(int eno) {
		// TODO Auto-generated method stub
		return null;
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

}
