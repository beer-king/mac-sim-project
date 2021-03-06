package com.beer.macSim.groupBuy.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.event.model.vo.Attachment;
import com.beer.macSim.groupBuy.model.vo.GbRequest;
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
	
	public int increaseCount(SqlSessionTemplate sqlSession, int gno) {
		return sqlSession.update("groupBuyMapper.increaseCount", gno);
	}
	
	public GroupBuy selectGroupBuy(SqlSessionTemplate sqlSession, int gno) {
		return sqlSession.selectOne("groupBuyMapper.selectGroupBuy", gno);
	}
	
	public ArrayList<Attachment> selectGbAttachment(SqlSessionTemplate sqlSession, int gno){
		return (ArrayList)sqlSession.selectList("groupBuyMapper.selectGbAttachment", gno);
	}
	
	public int increaseApplyNo(SqlSessionTemplate sqlSession, GbRequest gbr) {
		return sqlSession.update("groupBuyMapper.increaseApplyNo", gbr);
	}
	
	public int decreasePoint(SqlSessionTemplate sqlSession, GbRequest gbr) {
		return sqlSession.update("groupBuyMapper.decreasePoint", gbr);
	}
	
	public int applyGroupBuy(SqlSessionTemplate sqlSession, GbRequest gbr) {
		return sqlSession.insert("groupBuyMapper.applyGroupBuy", gbr);
	}	
	
	public int checkApplyGroupBuy(SqlSessionTemplate sqlSession, GbRequest gbr) {
		return sqlSession.selectOne("groupBuyMapper.checkApplyGroupBuy", gbr);
	}
	
	public int searchGBCount(SqlSessionTemplate sqlSession, String category, String searchWord) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("searchWord", searchWord);
		
		return sqlSession.selectOne("groupBuyMapper.searchGBCount", map);
	}
	
	public ArrayList<GroupBuy> searchGBList(SqlSessionTemplate sqlSession, PageInfo pi,
											 String category, String searchWord){
		
		HashMap<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("searchWord", searchWord);
		
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("groupBuyMapper.searchGBList", map, rowBounds);
	}
}
