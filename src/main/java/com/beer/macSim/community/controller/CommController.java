package com.beer.macSim.community.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.common.template.Pagination;
import com.beer.macSim.community.model.service.CommService;
import com.beer.macSim.community.model.vo.Community;
import com.beer.macSim.community.model.vo.Forum;

@Controller
public class CommController {

	@Autowired
	private CommService cService;
	
	// 커뮤니티 (맥일/오맥) 리스트 조회
	@RequestMapping("list.cm") // list.cm?cate=x&currentPage=x
	public String selectCommList(@RequestParam(value="cate", defaultValue="0") int cate,
								 @RequestParam(value="currentPage", defaultValue="1") int currentPage,
								 Model model) {
		
		//System.out.println("cate : " + cate);
		//System.out.println("currentPage : " + currentPage);
		
		// 페이징
		int listCount = cService.selectCommCount(cate);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 7);
		
		// 리스트
		ArrayList<Community> list = cService.selectCommList(cate, pi);
		
		model.addAttribute("cate", cate);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		//System.out.println("list" + list);
		
		return "community/commList";
		
	}
	
	// 포럼 리스트 조회
	@RequestMapping("list.fo")
	public String selectForumList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		// 페이징
		int listCount = cService.selectForumCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 7);
		
		// 리스트
		ArrayList<Forum> list = cService.selectForumList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		System.out.println("list : " + list);
		
		return "community/forumList";
		
	}
	
}
