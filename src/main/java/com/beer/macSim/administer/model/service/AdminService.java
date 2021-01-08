package com.beer.macSim.administer.model.service;

import java.util.ArrayList;

import com.beer.macSim.administer.model.vo.Batch;
import com.beer.macSim.administer.model.vo.BeerSearch;
import com.beer.macSim.administer.model.vo.GbRequest;
import com.beer.macSim.administer.model.vo.Report;
import com.beer.macSim.administer.model.vo.SelectData;
import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.data.model.vo.Beers;
import com.beer.macSim.event.model.vo.Attachment;
import com.beer.macSim.event.model.vo.Event;
import com.beer.macSim.groupBuy.model.vo.GroupBuy;
import com.beer.macSim.member.model.vo.Member;
import com.beer.macSim.notice.model.vo.Notice;

public interface AdminService {
	int insertBeer(Beers b, Member m);
	Beers selectBeerOne(String beerNo);
	
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
	
	int selectEventListCount(BeerSearch bs);
	ArrayList<Event> selectEventList(BeerSearch bs,PageInfo pi);
	
	int updateBatchEvent(Batch b);
	Event selectEventOne(String evNo);
	
	int updateBeer(Beers b, Member m);
	int updateBatchReport(Batch b);
	
	int selectPnocurrent();
	int enrollGB(GroupBuy GB);
	int enrollAT(Attachment a1, Attachment a2);
	int selectGBRlistCount(BeerSearch bs);
	ArrayList<GbRequest> selectGBRlist(BeerSearch bs, PageInfo pi);
	int updateBatchGB(Batch b);
	int returnPoint(Batch b);
	
	int selectGBlistCount(BeerSearch b);
	ArrayList<GroupBuy> selectGBlist(BeerSearch bs, PageInfo pi);
	int deleteGroupBuy(String pNo);
	int deleteAttach(String pNo);
	
	GroupBuy selectGBOne(String pNo);
	ArrayList<Attachment> selectATOne(String pNo);
	
	int updateGB(GroupBuy gb);
	int updateAttachment(Attachment a1, Attachment a2);
}
