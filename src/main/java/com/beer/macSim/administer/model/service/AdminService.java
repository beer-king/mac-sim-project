package com.beer.macSim.administer.model.service;

import java.util.ArrayList;

import com.beer.macSim.administer.model.vo.BeerSearch;
import com.beer.macSim.administer.model.vo.Report;
import com.beer.macSim.administer.model.vo.SelectData;
import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.data.model.vo.Beers;
import com.beer.macSim.member.model.vo.Member;
import com.beer.macSim.notice.model.vo.Notice;

public interface AdminService {
	int insertBeer(Beers b, Member m);
	
	int selectCallListCount(SelectData sd);
	ArrayList<Report> selectCallList(PageInfo pi, SelectData sd);
	int selectUserListCount(int status);
	ArrayList<Member> selectUserList(PageInfo pi, int status);
	
	int selectListCount(BeerSearch bs);
	ArrayList<Notice> selectNoticeList(PageInfo pi, BeerSearch bs);
	
	int insertNotice(Notice n);
	
	int updateNotice(Notice n);
	
	int deleteNotice(String noticeNo);
	
	Notice selectNotice(String noticeNo);
	
	ArrayList<String> selectBeerNameAll();
	
	int userBan(String userNo);
	
	int reportBC(SelectData sd);
	
	int selectBeerListCount(BeerSearch bs);
	ArrayList<Beers> selectBeerList(BeerSearch bs,PageInfo pi);
}
