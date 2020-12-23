package com.beer.macSim.member.model.service;

import com.beer.macSim.member.model.vo.Member;

import java.util.ArrayList;

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
    int deleteReview(int scoreNo);

	

    
    // 회원 비빌번호 변경
    int memberPwdUpdate(Member m);

     
}
