package com.beer.macSim.community.model.service;

import java.util.ArrayList;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.community.model.vo.Community;
import com.beer.macSim.community.model.vo.Forum;

public interface CommService {
	
	// 1. 커뮤니티 리스트 조회용 서비스
	int selectCommCount(int cate);
	ArrayList<Community> selectCommList(int cate, PageInfo pi);
	
	// 2. 커뮤니티 작성용 서비스
	int insertComm(Community comm);
	
	// 3. 포럼 리스트 조회용 서비스
	int selectForumCount();
	ArrayList<Forum> selectForumList(PageInfo pi);
	
	// 4. 포럼 상세페이지 조회 서비스
	int increaseCount(int fno);
	Forum selectForumDetail(int fno);
	
	// 5. 포럼 작성용 서비스
	int insertForum(Forum fo);
	
	// 6. 포럼 댓글/대댓글 리스트 조회용 서비스
	
	// 7. 포럼 댓글 작성용 서비스
	 

}
