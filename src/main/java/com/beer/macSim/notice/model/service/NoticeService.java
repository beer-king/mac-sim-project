package com.beer.macSim.notice.model.service;

import java.util.ArrayList;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.notice.model.vo.NoComment;
import com.beer.macSim.notice.model.vo.Notice;



public interface NoticeService {

	//리스트 조회/총 갯수
	int selectListCount();
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	// 공지사항 상세보기
	int increaseCount(int nno);
	Notice selectNotice(int nno);
	
	// 댓글
	
	ArrayList<NoComment> selectNcommentList(int nno);
	
	int insertNcomment(NoComment nc);
	
}
