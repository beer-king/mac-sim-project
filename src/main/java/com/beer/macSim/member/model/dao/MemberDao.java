package com.beer.macSim.member.model.dao;

import com.beer.macSim.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public class MemberDao {

    public int updateMember(SqlSessionTemplate sqlSession, Member m) {

        return sqlSession.update("memberMapper.updateMember",m);

    }

    public int deleteMember(SqlSessionTemplate sqlSession, String userPwd) {
        return sqlSession.delete("memberMapper.deleteMember",userPwd);
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
		return sqlSession.selectOne("memberMapper.loginMember",m);


	public ArrayList<> selectBeerReviewList(SqlSessionTemplate sqlSession){
    	return (ArrayList)sqlSession.selectList("memberMapper.selectBeerReviewList");
	}


	public int deleteReview(SqlSessionTemplate sqlSession, int scoreNo) {
    	return sqlSession.update("memberMapper.updateBeerReview",scoreNo);

	}
}



