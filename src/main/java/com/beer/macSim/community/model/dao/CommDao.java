package com.beer.macSim.community.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.community.model.vo.Community;

@Repository
public class CommDao {
	
	public int selectCommCount(SqlSessionTemplate sqlSession, int cate) {
		return sqlSession.selectOne("commMapper.selectCommCount", cate);
	}
	
	public ArrayList<Community> selectCommList(SqlSessionTemplate sqlSession, int cate, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("commMapper.selectCommList", cate, rowbounds);
		
	}

}
