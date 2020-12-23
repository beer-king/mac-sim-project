package com.beer.macSim.administer.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beer.macSim.administer.model.dao.AdminDao;
import com.beer.macSim.data.model.vo.Beers;
import com.beer.macSim.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDao aDao;
	
	
	
	@Override
	public int insertBeer(Beers b, Member m) {
		return aDao.insertBeer(sqlSession,b,m);
	}
	
	
}
