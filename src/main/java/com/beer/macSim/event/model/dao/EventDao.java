package com.beer.macSim.event.model.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.event.model.vo.Attachment;
import com.beer.macSim.event.model.vo.Event;

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
}
