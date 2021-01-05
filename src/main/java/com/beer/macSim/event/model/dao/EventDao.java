package com.beer.macSim.event.model.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.event.model.vo.Attachment;
import com.beer.macSim.event.model.vo.Event;
import com.beer.macSim.event.model.vo.EventAttendee;
import com.beer.macSim.event.model.vo.EventSearch;

@Repository
public class EventDao {
	
	public int selectEventCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("eventMapper.selectEventCount");
	}
	
	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession, PageInfo pi){
		// 마이바티스는 페이징 처리를 위해 RowBounds라는 객체 제공
		// RowBounds => 몇개의 게시글 건너(offset)띄고 몇개 조회할건지에 대하여 정의
				
		int offset = (pi.getCurrentPage() -1 )* pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eventMapper.selectEventList", null, rowbounds);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int eno) {
		return sqlSession.update("eventMapper.increaseCount", eno);
	}
	
	public Event selectEvent(SqlSessionTemplate sqlSession, int eno) {
		return sqlSession.selectOne("eventMapper.selectEvent", eno);
	}
	
	public int insertEvent(SqlSessionTemplate sqlSession, Event e) {
		return sqlSession.insert("eventMapper.insertEvent",e);
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("eventMapper.insertAttachment", a);
	}
	
	public ArrayList<Attachment> selectEvAttachment(SqlSessionTemplate sqlSession, int eno) {
		return (ArrayList)sqlSession.selectList("eventMapper.selectEvAttachment", eno);
	}
	
	public int decreasePoint(SqlSessionTemplate sqlSession, EventAttendee ea) {
		return sqlSession.update("eventMapper.decreasePoint", ea);
	}
	
	public int applyEvent(SqlSessionTemplate sqlSession, EventAttendee ea) {
		return sqlSession.insert("eventMapper.applyEvent", ea);
	}
	
	public int checkApplyEvent(SqlSessionTemplate sqlSession, EventAttendee ea) {
		return sqlSession.selectOne("eventMapper.checkApplyEvent", ea);
	}
	
	public int searchEventCount(SqlSessionTemplate sqlSession, EventSearch es) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("category", es.getCategory());
		map.put("searchWord", es.getSearchWord());
		
		return sqlSession.selectOne("eventMapper.searchEventCount", map);
	}
	
	public ArrayList<Event> searchEventList(SqlSessionTemplate sqlSession, PageInfo pi, EventSearch es){
		
		HashMap<String, String> map = new HashMap<>();
		map.put("category", es.getCategory());
		map.put("searchWord", es.getSearchWord());
		
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("eventMapper.searchEventList", map, rowBounds);
	}
}
