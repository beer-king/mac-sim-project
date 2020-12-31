package com.beer.macSim.member.model.dao;

import com.beer.macSim.event.model.vo.Event;
import com.beer.macSim.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public class MemberDao {

    public int updateMember(SqlSessionTemplate sqlSession, Member m) {

        return sqlSession.update("memberMapper.updateMember",m);

    }

    public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
        return sqlSession.update("memberMapper.deleteMember",userId);
    }

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	public Member findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.idCheck", userId);
	}


	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);

	}

	public int deleteReivew(SqlSessionTemplate sqlSession, int scoreNo) {
    	return sqlSession.update("memberMapper.updateBeerReview",scoreNo);
	}

	public int memberPwdUpdate(SqlSessionTemplate sqlSession, Member m) {
    	return sqlSession.update("memberMapper.memberPwdUpdate",m);


	}

	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession,Member m) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectEventList",m);
	}

	public int reviewCount(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.reviewCount", m);
	}

	public int eventCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.eventCount", m);
	}

	public int groupCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.groupCount", m);
	}

	public int deleteEvent(SqlSessionTemplate sqlSession, int eventNo) {
		return sqlSession.update("memberMapper.deleteEvent", eventNo);
	}


	

/*
	public ArrayList<> selectBeerReviewList(SqlSessionTemplate sqlSession){
    	return (ArrayList)sqlSession.selectList("memberMapper.selectBeerReviewList");
	}
*/
	


}



