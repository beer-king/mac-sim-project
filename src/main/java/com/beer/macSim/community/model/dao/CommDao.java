package com.beer.macSim.community.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.community.model.vo.CommLikes;
import com.beer.macSim.community.model.vo.Community;
import com.beer.macSim.community.model.vo.Forum;
import com.beer.macSim.community.model.vo.Reply;
import com.beer.macSim.community.model.vo.SubReply;

@Repository
public class CommDao {
	
	// 커뮤니티 (맥일/오맥) 리스트 조회
	public int selectCommCount(SqlSessionTemplate sqlSession, int cate) {
		return sqlSession.selectOne("commMapper.selectCommCount", cate);
	}
	
	public ArrayList<Community> selectCommList(SqlSessionTemplate sqlSession, int cate, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("commMapper.selectCommList", cate, rowbounds);
		
	}
	
	// 포럼 리스트 조회
	public int selectForumCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("commMapper.selectForumCount");
	}
	
	public ArrayList<Forum> selectForumList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("commMapper.selectForumList", null, rowbounds);
		
	}

	// 포럼 디테일 페이지
	public int increaseCount(SqlSessionTemplate sqlSession, int fno) {
		return sqlSession.update("commMapper.increaseCount", fno);
	}

	public Forum selectForumDetail(SqlSessionTemplate sqlSession, int fno) {
		return sqlSession.selectOne("commMapper.selectForumDetail", fno);
	}

	public int insertComm(SqlSessionTemplate sqlSession, Community comm) {
		return sqlSession.insert("commMapper.insertComm", comm);
	}

	public int insertForum(SqlSessionTemplate sqlSession, Forum fo) {
		return sqlSession.insert("commMapper.insertForum", fo);
	}

	public ArrayList<CommLikes> selectCommLikes(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("commMapper.selectCommLikes", userNo);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int fno) {
		return (ArrayList)sqlSession.selectList("commMapper.selectReplyList", fno);
	}

	public ArrayList<SubReply> selectSubReplyList(SqlSessionTemplate sqlSession, int coNo) {
		return (ArrayList)sqlSession.selectList("commMapper.selectSubReplyList", coNo);
	}
		

}
