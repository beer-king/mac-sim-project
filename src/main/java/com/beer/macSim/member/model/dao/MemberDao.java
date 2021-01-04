package com.beer.macSim.member.model.dao;

import com.beer.macSim.event.model.vo.Event;
import com.beer.macSim.groupBuy.model.vo.GroupBuy;
import com.beer.macSim.member.model.vo.Member;
import com.beer.macSim.member.model.vo.PointHistory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Repository
public class MemberDao {

    public int updateMember(SqlSessionTemplate sqlSession, Member m) {

        return sqlSession.update("memberMapper.updateMember",m);

    }

    public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
        return sqlSession.update("memberMapper.deleteMember",userId);
    }

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	public Member findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.idCheck", userId);
	}


	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);

	}

	public int deleteReivew(SqlSessionTemplate sqlSession, int scoreNo) {
    	return sqlSession.update("memberMapper.updateBeerReview",scoreNo);
	}

	public int memberPwdUpdate(SqlSessionTemplate sqlSession, Member m) {
    	return sqlSession.update("memberMapper.memberPwdUpdate",m);


	}

	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession,Member m) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectEventList",m);
	}

	public int reviewCount(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.reviewCount", m);
	}

	public int eventCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.eventCount", m);
	}

	public int groupCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.groupCount", m);
	}

	public int deleteEvent(SqlSessionTemplate sqlSession, int eventNo) {
		return sqlSession.update("memberMapper.deleteEvent", eventNo);
	}

	public String loginPoint(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.loginPoint", userNo);
	}

	public int memberPointUpdate(SqlSessionTemplate sqlSession, int userNo, int point) {
		
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("userNo",userNo);
		map.put("point",point);
		
		return sqlSession.update("memberMapper.memberPointUpdate", map);
	}

	public int pointHistory(SqlSessionTemplate sqlSession, int userNo, int point, int category, String pointHistory) {
		
		String cate = "";
		switch(category) {
		case 0: cate = "회원가입"; break;
		case 1: cate = "로그인" ; break;
		case 2: cate = "맥주리뷰";break;
		case 3: cate = "맥주정보제공";break;
		case 4: cate = "맥주정보수정";break;
		case 5: cate = "이벤트신청";break;
		case 6: cate = "이벤트생성";break;
		case 7: cate = "내이벤트참여";break;
		case 8: cate = "포럼입장";break;
		case 9: cate = "공구신청";break;
		}
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("userNo",Integer.toString(userNo));
		map.put("point",Integer.toString(point));
		map.put("cate",cate);
		map.put("pointHistory",pointHistory);
			
		return sqlSession.insert("memberMapper.pointHistory", map);
	}

	public ArrayList<PointHistory> selectPointHistory(SqlSessionTemplate sqlSession, Member m) {

    	return (ArrayList)sqlSession.selectList("memberMapper.selectPointHistory",m);

	}

	public ArrayList<GroupBuy> selectGroupBuyList(SqlSessionTemplate sqlSession, Member m) {
    	return (ArrayList)sqlSession.selectList("memberMapper.selectGroupBuyList",m);
	}

	


	

/*
	public ArrayList<> selectBeerReviewList(SqlSessionTemplate sqlSession){
    	return (ArrayList)sqlSession.selectList("memberMapper.selectBeerReviewList");
	}
*/
	


}



