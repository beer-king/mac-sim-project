package com.beer.macSim.groupBuy.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.groupBuy.model.vo.GroupBuy;

@Repository
public class GroupBuyDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("groupBuyMapper.selectListCount");
	}
	
	public ArrayList<GroupBuy> selectGroupBuyList(SqlSessionTemplate sqlSession, PageInfo pi ){
		// 마이바티스는 페이징 처리를 위해 RowBounds라는 객체 제공
		// RowBounds => 몇개의 게시글 건너(offset)띄고 몇개 조회할건지에 대하여 정의
	
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("groupBuyMapper.selectGroupBuyList", null, rowbounds);
	}
	
}
