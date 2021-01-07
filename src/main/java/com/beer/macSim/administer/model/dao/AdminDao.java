package com.beer.macSim.administer.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.beer.macSim.administer.model.vo.Batch;
import com.beer.macSim.administer.model.vo.BeerSearch;
import com.beer.macSim.administer.model.vo.GbRequest;
import com.beer.macSim.administer.model.vo.Report;
import com.beer.macSim.administer.model.vo.SelectData;
import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.data.model.vo.Beers;
import com.beer.macSim.event.model.vo.Attachment;
import com.beer.macSim.event.model.vo.Event;
import com.beer.macSim.groupBuy.model.vo.GroupBuy;
import com.beer.macSim.member.model.vo.Member;
import com.beer.macSim.notice.model.vo.Notice;

@Repository
public class AdminDao {
	public int insertBeer(SqlSessionTemplate sqlSession, Beers b, Member m) {
		int i = sqlSession.insert("adminMapper.insertBeer", b);
		int j = sqlSession.update("adminMapper.updatePoint", m);
		return (i * j);
	}
	
	public int updateBeer(SqlSessionTemplate sqlSession, Beers b, Member m) {
		int i = sqlSession.update("adminMapper.updateBeer", b);
		int j = sqlSession.update("adminMapper.updatePoint", m);
		return (i * j);
	}
	public int selectListCount(BeerSearch bs, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount", bs);
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, String noticeNo) {
		return sqlSession.selectOne("adminMapper.selectNotice", noticeNo);
	}

	public ArrayList<Notice> selectNoticeList(PageInfo pi, BeerSearch bs, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectNoticeList", bs, rowBounds);
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
	
	public int selectEventListCount(SqlSessionTemplate sqlSession, BeerSearch bs) {
		return sqlSession.selectOne("adminMapper.selectEventListCount", bs);
	}
	
	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession, PageInfo pi, BeerSearch bs){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectEventList", bs, rowBounds);
	}
	
	public int updateBatchEvent(SqlSessionTemplate sqlSession, Batch b) {
		return sqlSession.update("adminMapper.updateBatchEvent", b);
	}
	public Event selectEventOne(SqlSessionTemplate sqlSession, String evNo) {
		return sqlSession.selectOne("adminMapper.selectEventOne", evNo);
	}
	
	public Beers selectBeerOne(SqlSessionTemplate sqlSession, String beerNo) {
		return sqlSession.selectOne("adminMapper.selectBeerOne", beerNo);
	}
	
	public int updateBatchReport(SqlSessionTemplate sqlSession, Batch b) {
		int i = sqlSession.update("adminMapper.updateBatchReport", b);
		int j = 1;
		if(b.getStatus().equals("C")) {
			
			/* 해당 글 및 댓글 삭제처리 작업후 돌아갈 부분
			for(String s : b.getList()) {
				j = sqlSession.update("adminMapper.deleteReport", s);
				if(j <= 0) {
					break;
				}
			}*/
		}
		
		
		return i*j;
	}
	
	public int selectPnocurrent(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectPnocurrent");
	}
	
	public int enrollGB(SqlSession sqlSession, GroupBuy GB) {
		int result = sqlSession.update("adminMapper.insertGB", GB);
		return result;
	}
	
	public int enrollAT(SqlSession sqlSession, Attachment a1, Attachment a2) {
		int result2 = 1;
		int result3 = 1;
		
		if(a1 != null) {
			result2 = sqlSession.update("adminMapper.insertAttachment", a1);
		}
		if(a2 != null) {
			result3 = sqlSession.update("adminMapper.insertAttachment", a2);
		}
		return result2 * result3;
	}
	public int selectGBRlistCount(SqlSessionTemplate sqlSession, BeerSearch bs) {
		return sqlSession.selectOne("adminMapper.selectGBRlistCount", bs);
	}
	
	public ArrayList<GbRequest> selectGBRlist(SqlSessionTemplate sqlSession, BeerSearch bs, PageInfo pi){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectGBRlist", bs, rowBounds);
	}
	
	public int updateBatchGB(SqlSessionTemplate sqlSession, Batch b) {
		return sqlSession.update("adminMapper.updateBatchGB", b);
	}
	
	public int returnPoint(SqlSessionTemplate sqlSession, Batch b) {
		int result = 0;
		for(String no : b.getList()) {
			result = sqlSession.update("adminMapper.returnPoint", no);
			if(result <= 0) {
				break;
			}
		}
		
		return result;
	}
}
