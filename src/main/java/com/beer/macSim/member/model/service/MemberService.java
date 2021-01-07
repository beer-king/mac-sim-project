package com.beer.macSim.member.model.service;


import com.beer.macSim.event.model.vo.Event;
import com.beer.macSim.groupBuy.model.vo.GroupBuy;
import com.beer.macSim.member.model.vo.Member;
import com.beer.macSim.member.model.vo.PointHistory;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public interface MemberService {

    //1. 로그인용 서비스
    //반환형 메소드명(매개변수,매개변수)
    Member loginMember(Member m);

    //2. 회원가입용 서비스
    int insertMember(Member m);

    //3. 회원정보수정용 서비스
    int updateMember(Member m);

    //4. 회원탈퇴용 서비스
    int deleteMember(String userPwd);

    // 아이디 찾기
    Member findId(Member m);
    
    // 아이디 중복체크!
    int idCheck(String userId);

    //맥주리뷰 리스트 조회
   // ArrayList selectBeerReivewList();
    
    
    //마이페이지 맥주리뷰 삭제
    //int deleteReview(int scoreNo);

	
    ArrayList<Event> selectEventList(Member m);
    
    // 회원 비빌번호 변경
    int memberPwdUpdate(Member m);
    
    
    int reviewCount(Member m );
    
    int eventCount(Member m);
    
    int groupCount(Member m);

	int deleteEvent(Member m);

	String loginPoint(int userNo);

	int memberPointUpdate(int userNo, int point);


	int pointHistory(int userNo, int point, int category, String pointHistory);


	//void sendTempLoginPwToEmail(Member loginMember,String contextPath);

	



     


    ArrayList<PointHistory> selectPointHistory(Member m);

    ArrayList<GroupBuy> selectGroupBuyList(Member m);

    int deleteGroupBuy(Member m);

    // 사용자의 포인트를 적립/차감 하고 + 포인트내역에 추가
	int updateMemberPoint(PointHistory ph);

}
