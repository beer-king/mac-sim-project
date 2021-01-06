package com.beer.macSim.community.model.service;

import java.util.ArrayList;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.community.model.vo.CommLikes;
import com.beer.macSim.community.model.vo.Community;
import com.beer.macSim.community.model.vo.Forum;
import com.beer.macSim.community.model.vo.Reply;
import com.beer.macSim.community.model.vo.SubReply;

public interface CommService {
	
	// 1. 커뮤니티 리스트 조회용 서비스
	int selectCommCount(int cate);
	ArrayList<Community> selectCommList(int cate, PageInfo pi);
	
	// 2. 커뮤니티 작성용 서비스
	int insertComm(Community comm);
	
	// 3. 커뮤니티 좋아요 조회
	ArrayList<CommLikes> selectCommLikes(int userNo);
	
	// 4. 커뮤니티 좋아요 추가
	
	// 5. 커뮤니티 좋아요 삭제
	
	// 3. 포럼 리스트 조회용 서비스
	int selectForumCount();
	ArrayList<Forum> selectForumList(PageInfo pi);
	
	// 4. 포럼 상세페이지 조회 서비스
	int increaseCount(int fno);
	Forum selectForumDetail(int fno);
	
	// 5. 포럼 작성용 서비스
	int insertForum(Forum fo);
	
	// 6. 포럼 댓글/대댓글 리스트 조회용 서비스
	ArrayList<Reply> selectReplyList(int fno);
	ArrayList<SubReply> selectSubReplyList(int coNo);
	int updateReplyUpdate(Reply r);
	int updateSubReplyUpdate(Reply r);
	int replyDelete(int coNo);
	int subReplyDelete(int coNo);
	int selectLikeLength(int cNo);
	int selectIsLike(CommLikes cl);
	int replyInsert(Reply r);
	int subReplyInsert(Reply r);
	
	// 7. 포럼 댓글 작성용 서비스
	 

}
