package com.beer.macSim.member.model.service;

import com.beer.macSim.event.model.vo.Event;
import com.beer.macSim.groupBuy.model.vo.GroupBuy;
import com.beer.macSim.member.model.dao.MemberDao;
import com.beer.macSim.member.model.vo.Member;
import com.beer.macSim.member.model.vo.PointHistory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.ArrayList;


@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberDao mDao;

    @Autowired
    private SqlSessionTemplate sqlSession;
    
    @Autowired
    private MailService mailService;

    @Override
    public Member loginMember(Member m) {
        return mDao.loginMember(sqlSession, m);
    }

    @Override
    public int insertMember(Member m) {
    	return mDao.insertMember(sqlSession, m);
    }

    @Override
    public int updateMember(Member m) {
        return mDao.updateMember(sqlSession,m);
    }

    @Override
    public int deleteMember(String userId) {

        return mDao.deleteMember(sqlSession,userId);
    }

	@Override
	public Member findId(Member m) {
		return mDao.findId(sqlSession,m);
	}

	@Override
	public int idCheck(String userId) {
		return mDao.idCheck(sqlSession, userId); 
	}
	

	/*
    @Override
    public ArrayList<> selectBeerReivewList() {

        return mDao.selectBeerReviewList(sqlSession);
    }

    */

	/*
    @Override
    public int deleteReview(int scoreNo) {

        return mDao.deleteReview(sqlSession,scoreNo);
    }
    */

    @Override
    public int memberPwdUpdate(Member m) {
        return mDao.memberPwdUpdate(sqlSession,m);
    }

	
    @Override
	public ArrayList<Event> selectEventList(Member m) {
		return mDao.selectEventList(sqlSession,m);
	}

	@Override
	public int reviewCount(Member m) {
		
		return mDao.reviewCount(sqlSession,m);
	}

	@Override
	public int eventCount(Member m) {
		return mDao.eventCount(sqlSession,m);
	}

	@Override
	public int groupCount(Member m) {
		return mDao.groupCount(sqlSession,m);
	}

	@Override
	public int deleteEvent(Member m) {
		return mDao.deleteEvent(sqlSession,m);
	}

	@Override
	public String loginPoint(int userNo) {
		return mDao.loginPoint(sqlSession, userNo);
	}

	// 포인트 증가 메소드
	@Override
	public int memberPointUpdate(int userNo, int point) {
		return mDao.memberPointUpdate(sqlSession, userNo, point);
	}



	// 포인트 히스토리에 insert
	@Override
	public int pointHistory(int userNo, int point, int category, String pointHistory) {
		return mDao.pointHistory(sqlSession, userNo, point, category, pointHistory);
	}

	// 회원의 포인트 상태조회
	@Override
	public ArrayList<PointHistory> selectPointHistory(Member m) {
		return mDao.selectPointHistory(sqlSession,m);
	}
	
	
	// 회원 공동구매 상태조회
	@Override
	public ArrayList<GroupBuy> selectGroupBuyList(Member m) {
		return mDao.selectGroupBuyList(sqlSession,m);
	}



	

	




	@Override
	public int deleteGroupBuy(Member m) {
		return mDao.deleteGroupBuy(sqlSession,m);
	}



}




