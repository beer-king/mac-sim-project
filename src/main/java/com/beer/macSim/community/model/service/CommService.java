package com.beer.macSim.community.model.service;

import java.util.ArrayList;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.community.model.vo.CommLikes;
import com.beer.macSim.community.model.vo.Community;
import com.beer.macSim.community.model.vo.Forum;
import com.beer.macSim.community.model.vo.Reply;
import com.beer.macSim.community.model.vo.SubReply;
import com.beer.macSim.member.model.vo.PointHistory;

public interface CommService {
	
	// 1. 커뮤니티 리스트 조회용 서비스
	int selectCommCount(int cate);
	ArrayList<Community> selectCommList(int cate, PageInfo pi);
	
	// 커뮤니티 작성용 서비스
	int insertComm(Community comm);
	
	// 커뮤니티 수정
	Community updateFormComm(int commNo);
	int updateComm(Community c);
	
	// 커뮤니티 삭제
	int deleteComm(int commNo);
	
	// 2. 커뮤니티 좋아요 조회
	ArrayList<CommLikes> selectCommLikes(int userNo);
	int selectLikeLength(int cNo);
	int selectIsLike(CommLikes cl);
	
	// 커뮤니티 좋아요 추가
	int insertCommLike(CommLikes cl);
	
	// 커뮤니티 좋아요 삭제
	int deleteCommLike(CommLikes cl);
	
	// 3. 포럼 리스트 조회용 서비스
	int selectForumCount();
	ArrayList<Forum> selectForumList(PageInfo pi);
	
	// 포럼 상세페이지 조회 서비스
	int selectForumEnter(PointHistory ph);
	int increaseCount(int fno);
	Forum selectForumDetail(int fno);
	
	// 포럼 작성용 서비스
	int insertForum(Forum fo);
	
	// 포럼 수정
	Forum updateFormForum(int forNo);
	int updateForum(Forum f);
	
	// 포럼 삭제
	int deleteForum(int forNo);
	
	// 4. 포럼 댓글/대댓글 조회
	ArrayList<Reply> selectReplyList(int fno);
	ArrayList<SubReply> selectSubReplyList(int coNo);
	
	// 포럼 댓글/대댓글 수정
	int replyUpdate(Reply r);
	int subReplyUpdate(Reply r);
	
	// 포럼 댓글/대댓글 삭제
	int replyDelete(int coNo);
	int subReplyDelete(int coNo);
	
	// 포럼 댓글/대댓글 작성
	int replyInsert(Reply r);
	int subReplyInsert(Reply r);
	
	// 방금 만들어진 댓글 하나 조회해오는 서비스
	ArrayList<Reply> selectReplyOne(Reply r);
	ArrayList<SubReply> selectSubReplyOne(Reply r);
	
	 

}
