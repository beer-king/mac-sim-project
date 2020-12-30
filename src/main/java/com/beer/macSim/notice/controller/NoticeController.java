package com.beer.macSim.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.common.template.Pagination;
import com.beer.macSim.notice.model.service.NoticeService;
import com.beer.macSim.notice.model.vo.NoComment;
import com.beer.macSim.notice.model.vo.Notice;
import com.google.gson.Gson;



@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	@RequestMapping("list.no")
	public String selectNoticeList(@RequestParam(value="currentPage", defaultValue="1")int currentPage,Model model) {
		
		int listCount = nService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Notice> list = nService.selectNoticeList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "notice/noticeList";
		
	}
	
	@RequestMapping("detail.no")
	public String selectBoard(int nno, Model model) {
		
		int result = nService.increaseCount(nno);
		
		if(result > 0) {
			
			Notice n = nService.selectNotice(nno);
			
			model.addAttribute("n",n);
			
			return "notice/noticeDetailView";
			
		}else {
			
			model.addAttribute("errorMsg","존재하지 않는 공지사항이거나 삭제된 게시글 입니다.");
			return "common/errorPage";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="ncolist.no", produces = "application/json; charset=utf-8")
	public String selectNcommentList(int nno) {
		
		ArrayList<NoComment> list = nService.selectNcommentList(nno);
		
		return new Gson().toJson(list);
	}
	
	
	@ResponseBody
	@RequestMapping("ninsert.bo")
	public String insertReply(NoComment nc) {
		
		int result = nService.insertNcomment(nc);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
}




