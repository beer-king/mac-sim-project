package com.beer.macSim.event.model.service;

import java.util.ArrayList;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.event.model.vo.Attachment;
import com.beer.macSim.event.model.vo.EvReply;
import com.beer.macSim.event.model.vo.Event;
import com.beer.macSim.event.model.vo.EventAttendee;
import com.beer.macSim.event.model.vo.EventSearch;

public interface EventService {
	
	// 1. 이벤트리스트 조회용 서비스
	int selectEventCount();
	ArrayList<Event> selectEventList(PageInfo pi);
	
	// 2. 이벤트 상세페이지 서비스
	int increaseCount(int eno);
	Event selectEvent(int eno);
	ArrayList<Attachment> selectEvAttachment(int eno);
	int checkApplyEvent(EventAttendee ea);
	
	// 3. 이벤트 댓글리스트 조회용 서비스
	ArrayList<EvReply> selectEvReplyList(int eno);
	
	// 4. 이벤트 댓글 작성용 서비스
	int insertEvReply(EvReply er);
	
	// 5. 이벤트 작성하기용 서비스
	int insertEvent(Event e, Attachment a);
	
	// 6. 이벤트 신청하기용 서비스
	int decreasePoint(EventAttendee ea);
	int applyEvent(EventAttendee ea);
	
	// 7. 이벤트 검색결과 리스트용 서비스
	int searchEventCount(EventSearch es);
	ArrayList<Event> searchEventList(PageInfo pi, EventSearch es);
}
