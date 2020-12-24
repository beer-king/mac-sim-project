package com.beer.macSim.administer.model.service;

import java.util.ArrayList;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.data.model.vo.Beers;
import com.beer.macSim.member.model.vo.Member;
import com.beer.macSim.notice.model.vo.Notice;

public interface AdminService {
	int insertBeer(Beers b, Member m);
	
	int selectListCount();
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	int insertNotice(Notice n);
	
	int updateNotice(Notice n);
	
	int deleteNotice(String noticeNo);
	
	Notice selectNotice(String noticeNo);
}
