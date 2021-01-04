package com.beer.macSim.administer.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.beer.macSim.administer.model.vo.BeerSearch;
import com.beer.macSim.administer.model.vo.Report;
import com.beer.macSim.administer.model.vo.SelectData;
import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.data.model.vo.Beers;
import com.beer.macSim.member.model.vo.Member;
import com.beer.macSim.notice.model.vo.Notice;

@Repository
public class AdminDao {
	public int insertBeer(SqlSessionTemplate sqlSession, Beers b, Member m) {
		int i = sqlSession.insert("adminMapper.insertBeer", b);
		int j = sqlSession.update("adminMapper.updatePoint", m);
		return (i * j);
	}
	
	public int selectListCount(BeerSearch bs, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount", bs);
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, String noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}

	public ArrayList<Notice> selectNoticeList(PageInfo pi, BeerSearch bs, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", bs, rowBounds);
	}
	
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("adminMapper.insertNotice", n);
	}
	
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("adminMapper.updateNotice", n);
	}
	
	public int deleteNotice(SqlSessionTemplate sqlSession, String noticeNo) {
		return sqlSession.update("adminMapper.deleteNotice", noticeNo);
	}
	
	public int selectUserListCount(int status, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectUserListCount", status);
	}
	
	public ArrayList<Member> selectUserList(PageInfo pi, int status, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectUserList", status, rowBounds);
	}
	
	public int selectCallListCount(SqlSessionTemplate sqlSession, SelectData sd) {
		return sqlSession.selectOne("adminMapper.selectCallListCount", sd);
	}
	
	public ArrayList<Report> selectCallList(SqlSessionTemplate sqlSession, PageInfo pi, SelectData sd){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectCallList", sd, rowBounds);
		
	}
	
	public ArrayList<String> selectBeerNameAll(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectBeerNameAll");
	}
	public int userBan(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.update("adminMapper.userBan", userNo);
	}
	public int reportBC(SqlSessionTemplate sqlSession, SelectData sd) {
		return sqlSession.update("adminMapper.reportBC", sd);
	}
	
	public int selectBeerListCount(SqlSessionTemplate sqlSession, BeerSearch bs) {
		return sqlSession.selectOne("adminMapper.selectBeerListCount", bs);
	}
	
	public ArrayList<Beers> selectBeerList(SqlSessionTemplate sqlSession, PageInfo pi, BeerSearch bs){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectBeerList", bs, rowBounds);
	}
}
