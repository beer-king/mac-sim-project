package com.beer.macSim.administer.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.beer.macSim.data.model.vo.Beers;
import com.beer.macSim.member.model.vo.Member;

@Repository
public class AdminDao {
	public int insertBeer(SqlSessionTemplate sqlSession, Beers b, Member m) {
		int i = sqlSession.insert("adminMapper.insertBeer", b);
		int j = sqlSession.update("adminMapper.updatePoint", m);
		return (i * j);
	}
}
