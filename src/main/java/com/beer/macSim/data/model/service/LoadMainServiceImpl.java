package com.beer.macSim.data.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beer.macSim.data.model.dao.LoadMainDao;
import com.beer.macSim.data.model.vo.Beers;

@Service
public class LoadMainServiceImpl implements LoadMainService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private LoadMainDao mDao;
	
	@Override
	public int selectCountBeer() {
		return mDao.selectCountBeer(sqlSession);
	}

	@Override
	public Beers selectOneBeer(int bno) {
		return mDao.selectOneBeer(sqlSession, bno);
	}

	@Override
	public ArrayList<Beers> selectRankList() {
		return mDao.selectRankList(sqlSession);
	}

	@Override
	public Beers selectGenderRank(String gender) {
		return mDao.selectGenderRank(sqlSession, gender);
	}

}
