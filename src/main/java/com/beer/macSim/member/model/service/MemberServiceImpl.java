package com.beer.macSim.member.model.service;

import com.beer.macSim.member.model.dao.MemberDao;
import com.beer.macSim.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberDao mDao;

    @Autowired
    private SqlSessionTemplate sqlSession;

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


    @Override
    public int deleteReview(int scoreNo) {

        return mDao.deleteReivew(sqlSession,scoreNo);
    }

    @Override
    public int memberPwdUpdate(Member m) {
        return mDao.memberPwdUpdate(sqlSession,m);
    }


}




