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
		int i = sqlSession.update("adminMapper.reportBC", sd);
		int j = 1;
		int k = 1;
		if(sd.getStatus().equals("C")) {	
			System.out.println("reqNo : " + Integer.toString(sd.getCategory()));
			Report r = sqlSession.selectOne("adminMapper.selectReportOne", Integer.toString(sd.getCategory()));
			System.out.println(r);
			if(r.getRfromNo().equals("3")) {
				j = sqlSession.update("adminMapper.deleteProcess3", r);
				String userNo = sqlSession.selectOne("adminMapper.selectUserNoList3", r);
				k = sqlSession.update("adminMapper.increaseUserReport", userNo);
			}else if(r.getRfromNo().equals("2")) {
				j = sqlSession.update("adminMapper.deleteProcess2", r);
				String userNo = sqlSession.selectOne("adminMapper.selectUserNoList2", r);
				k = sqlSession.update("adminMapper.increaseUserReport", userNo);
			}else if(r.getRfromNo().equals("4")) {
				j = sqlSession.update("adminMapper.deleteProcess4", r);
				String userNo = sqlSession.selectOne("adminMapper.selectUserNoList4", r);
				k = sqlSession.update("adminMapper.increaseUserReport", userNo);
			}else if(r.getRfromNo().equals("5")) {
				j = sqlSession.update("adminMapper.deleteProcess5", r);
				String userNo = sqlSession.selectOne("adminMapper.selectUserNoList5", r);
				k = sqlSession.update("adminMapper.increaseUserReport", userNo);
			}else if(r.getRfromNo().equals("6")) {
				j = sqlSession.update("adminMapper.deleteProcess6", r);
				String userNo = sqlSession.selectOne("adminMapper.selectUserNoList6", r);
				k = sqlSession.update("adminMapper.increaseUserReport", userNo);
			}else {
				j = sqlSession.update("adminMapper.deleteProcess", r);
				String userNo = sqlSession.selectOne("adminMapper.selectUserNoList", r);
				k = sqlSession.update("adminMapper.increaseUserReport", userNo);
			}
		}
		return i * j * k;
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
		int k = 1;
		System.out.println("test");
		System.out.println(b.getStatus());
		if(b.getStatus().equals("C")) {	
			for(String reqNo : b.getList()) {
				System.out.println("reqNo : " + reqNo);
				Report r = sqlSession.selectOne("adminMapper.selectReportOne", reqNo);
				System.out.println(r);
				if(r.getRfromNo().equals("3")) {
					j = sqlSession.update("adminMapper.deleteProcess3", r);
					String userNo = sqlSession.selectOne("adminMapper.selectUserNoList3", r);
					k = sqlSession.update("adminMapper.increaseUserReport", userNo);
				}else if(r.getRfromNo().equals("2")) {
					j = sqlSession.update("adminMapper.deleteProcess2", r);
					String userNo = sqlSession.selectOne("adminMapper.selectUserNoList2", r);
					k = sqlSession.update("adminMapper.increaseUserReport", userNo);
				}else if(r.getRfromNo().equals("4")) {
					j = sqlSession.update("adminMapper.deleteProcess4", r);
					String userNo = sqlSession.selectOne("adminMapper.selectUserNoList4", r);
					k = sqlSession.update("adminMapper.increaseUserReport", userNo);
				}else if(r.getRfromNo().equals("5")) {
					j = sqlSession.update("adminMapper.deleteProcess5", r);
					String userNo = sqlSession.selectOne("adminMapper.selectUserNoList5", r);
					k = sqlSession.update("adminMapper.increaseUserReport", userNo);
				}else if(r.getRfromNo().equals("6")) {
					j = sqlSession.update("adminMapper.deleteProcess6", r);
					String userNo = sqlSession.selectOne("adminMapper.selectUserNoList6", r);
					k = sqlSession.update("adminMapper.increaseUserReport", userNo);
				}else {
					j = sqlSession.update("adminMapper.deleteProcess", r);
					String userNo = sqlSession.selectOne("adminMapper.selectUserNoList", r);
					k = sqlSession.update("adminMapper.increaseUserReport", userNo);
				}
				if(j * k <= 0) {
					break;
				}
			}
		}
		return i*j *k;
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

	public int selectGBlistCount(SqlSessionTemplate sqlSession, BeerSearch bs) {
		return sqlSession.selectOne("adminMapper.selectGBlistCount", bs);
	}

	public ArrayList<GroupBuy> selectGBlist(SqlSessionTemplate sqlSession, BeerSearch bs, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectGBlist", bs, rowBounds);
	}

	public int deleteGroupBuy(SqlSessionTemplate sqlSession, String pNo) {
		return sqlSession.update("adminMapper.deleteGroupBuy", pNo);
	}

	public int deleteAttach(SqlSessionTemplate sqlSession, String pNo) {
		return sqlSession.delete("adminMapper.deleteAttach", pNo);
	}

	public GroupBuy selectGBOne(SqlSessionTemplate sqlSession, String pNo) {
		return sqlSession.selectOne("adminMapper.selectGBOne", pNo);
	}

	public ArrayList<Attachment> selectATOne(SqlSessionTemplate sqlSession, String pNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectATOne", pNo);
	}

	public int updateGB(SqlSessionTemplate sqlSession, GroupBuy gb) {
		return sqlSession.update("adminMapper.updateGB", gb);
	}

	public int updateAttachment(SqlSessionTemplate sqlSession, Attachment a1, Attachment a2) {
		int result2 = 1;
		int result3 = 1;
		
		if(a1 != null) {
			result2 = sqlSession.update("adminMapper.updateAttachment", a1);

		}
		if(a2 != null) {
			result3 = sqlSession.update("adminMapper.updateAttachment", a2);

		}
		return result2 * result3;
	}

	public int callInsert(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.insert("adminMapper.callInsert", r);
	}

	public int increaseUserCount(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
