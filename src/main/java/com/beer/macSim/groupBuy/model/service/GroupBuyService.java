package com.beer.macSim.groupBuy.model.service;

import java.util.ArrayList;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.event.model.vo.Attachment;
import com.beer.macSim.groupBuy.model.vo.GbReply;
import com.beer.macSim.groupBuy.model.vo.GroupBuy;

public interface GroupBuyService {
	
	// 1. 공구리스트 조회용 서비스
	int selectListCount();
	ArrayList<GroupBuy> selectGroupBuyList(PageInfo pi);
	
	// 2. 공구 상세페이지 서비스
	int increaseCount(int gno);
	GroupBuy selectGroupBuy(int gno);
	ArrayList<Attachment> selectGbAttachment(int gno);
	
	// 3. 공구 댓글리스트 조회용 서비스
	ArrayList<GbReply> selectGbReplyList(int gno);
	
	// 4. 공구 댓글 작성용 서비스
	int insertGbReply(GbReply gr);
}
