package com.beer.macSim.member.model.dao;

import com.beer.macSim.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
}
