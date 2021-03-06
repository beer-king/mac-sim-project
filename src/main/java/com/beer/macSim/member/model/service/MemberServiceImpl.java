package com.beer.macSim.member.model.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.beer.macSim.data.model.vo.Score;
import com.beer.macSim.event.model.vo.Event;
import com.beer.macSim.groupBuy.model.vo.GroupBuy;
import com.beer.macSim.member.model.dao.MemberDao;
import com.beer.macSim.member.model.vo.Member;
import com.beer.macSim.member.model.vo.PointHistory;


@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberDao mDao;

    @Autowired
    private SqlSessionTemplate sqlSession;
    
    @Autowired
	private JavaMailSender mailSender;

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

	@Override
	public int deleteReview(Score score) {
		return mDao.deleteReview(sqlSession,score);
	}

	@Override
	public int updateBeerReview(Score score) {
		return mDao.updateBeerReview(sqlSession,score);
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

	@Override

	public void sendMail(String userId, String email) {
		// TODO Auto-generated method stub
		
	}


	public ArrayList<Score> selectBeerReivewList(int userNo) {
		return mDao.selectReviewList(sqlSession,userNo);
	}

	// 사용자의 포인트를 적립/차감 하고 + 포인트내역에 추가
	@Override
	public int updateMemberPoint(PointHistory ph) {
		return mDao.updateMemberPoint(sqlSession, ph);
	}


	@Override
	public int updateMemberLoginTime(int userNo) {
		return mDao.updateMemberLoginTime(sqlSession, userNo);
	}

	@Override
	public int searchPassword(String userId, String email, String key) {
		return mDao.searchPassword(sqlSession,userId, email, key);
	}
	
	
	
	
	
	
	
	
	
}






