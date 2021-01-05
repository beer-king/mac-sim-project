package com.beer.macSim.notice.model.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.notice.model.vo.NoComment;
import com.beer.macSim.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}

	public ArrayList<Notice> selectNoticeList(PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", null, rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.update("noticeMapper.increaseCount", nno);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.selectOne("noticeMapper.selectNotice", nno);
	}
	
	// 댓글리스트
	public ArrayList<NoComment> selectNcommentList(SqlSessionTemplate sqlSession, int nno) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNcommentList", nno);
	}
	
	// 댓글insert
	
	public int insertNcomment(SqlSessionTemplate sqlSession, NoComment nc) {
		return sqlSession.insert("noticeMapper.insertNcomment", nc);
	}

	public int searchNoticeListCount(SqlSessionTemplate sqlSession, String condition, String keyword) {
		
		HashMap<String, String> map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("noticeMapper.searchNoticeListCount", map);
		
		
	}

	public ArrayList<Notice> searchNoticeList(SqlSessionTemplate sqlSession, String condition, String keyword,
			PageInfo pi) {
		
		HashMap<String, String> map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.searchNoticeList",map, rowBounds);
		
		
	}

	
	
}
