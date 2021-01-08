package com.beer.macSim.data.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.beer.macSim.data.model.vo.Beers;

@Repository
public class LoadMainDao {

	public int selectCountBeer(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mainMapper.selectCountBeer");
	}

	public Beers selectOneBeer(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("mainMapper.selectOneBeer", bno);
	}

	public ArrayList<Beers> selectRankList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainMapper.selectRankList");
	}

	public Beers selectGenderRank(SqlSessionTemplate sqlSession, String gender) {
		return sqlSession.selectOne("mainMapper.selectGenderRank", gender);
	}

}
