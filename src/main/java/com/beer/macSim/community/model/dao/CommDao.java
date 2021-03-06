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
import com.beer.macSim.member.model.vo.PointHistory;

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

	public int replyUpdate(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("commMapper.replyUpdate", r);
	}

	public int subReplyUpdate(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("commMapper.subReplyUpdate", r);
	}

	public int replyDelete(SqlSessionTemplate sqlSession, int coNo) {
		return sqlSession.update("commMapper.replyDelete", coNo);
	}

	public int subReplyDelete(SqlSessionTemplate sqlSession, int coNo) {
		return sqlSession.update("commMapper.subReplyDelete", coNo);
	}

	public int selectLikeLength(SqlSessionTemplate sqlSession, int cNo) {
		return sqlSession.selectOne("commMapper.selectLikeLength", cNo);
	}

	public int selectIsLike(SqlSessionTemplate sqlSession, CommLikes cl) {
		return sqlSession.selectOne("commMapper.selectIsLike", cl);
	}

	public int replyInsert(SqlSessionTemplate sqlSession, Reply r) {
		int i = sqlSession.insert("commMapper.replyInsert", r);
		int j = sqlSession.update("commMapper.replyIncrease", r);
		return i*j;
	}

	public int subReplyInsert(SqlSessionTemplate sqlSession, Reply r) {
		int i = sqlSession.insert("commMapper.subReplyInsert", r);
		int j = sqlSession.update("commMapper.replyIncrease", r);
		return i*j;
	}

	public ArrayList<Reply> selectReplyOne(SqlSessionTemplate sqlSession, Reply r) {
		return (ArrayList)sqlSession.selectList("commMapper.selectReplyOne", r);
	}

	public ArrayList<SubReply> selectSubReplyOne(SqlSessionTemplate sqlSession, Reply r) {
		return (ArrayList)sqlSession.selectList("commMapper.selectSubReplyOne", r);
	}

	public Community updateFormComm(SqlSessionTemplate sqlSession, int commNo) {
		//HashMap<Integer, Community> map = new HashMap<Integer, Community>();
		return sqlSession.selectOne("commMapper.updateFormComm", commNo);
	}

	public int updateComm(SqlSessionTemplate sqlSession, Community c) {
		return sqlSession.update("commMapper.updateComm", c);
	}

	public Forum updateFormForum(SqlSessionTemplate sqlSession, int forNo) {
		return sqlSession.selectOne("commMapper.updateFormForum", forNo);
	}

	public int updateForum(SqlSessionTemplate sqlSession, Forum f) {
		return sqlSession.update("commMapper.updateForum", f);
	}

	public int deleteComm(SqlSessionTemplate sqlSession, int commNo) {
		return sqlSession.update("commMapper.deleteComm", commNo);
	}

	public int deleteForum(SqlSessionTemplate sqlSession, int forNo) {
		return sqlSession.update("commMapper.deleteForum", forNo);
	}

	public int selectForumEnter(SqlSessionTemplate sqlSession, PointHistory ph) {
		return sqlSession.selectOne("commMapper.selectForumEnter", ph);
	}

	public int insertCommLike(SqlSessionTemplate sqlSession, CommLikes cl) {
		return sqlSession.insert("commMapper.insertCommLike", cl);
	}

	public int deleteCommLike(SqlSessionTemplate sqlSession, CommLikes cl) {
		return sqlSession.delete("commMapper.deleteCommLike", cl);
	}
		

}
