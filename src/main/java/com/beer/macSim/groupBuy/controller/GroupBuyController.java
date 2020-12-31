package com.beer.macSim.groupBuy.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.common.template.Pagination;
import com.beer.macSim.event.model.vo.Attachment;
import com.beer.macSim.groupBuy.model.service.GroupBuyService;
import com.beer.macSim.groupBuy.model.vo.GroupBuy;

@Controller
public class GroupBuyController {
	
	@Autowired
	private GroupBuyService gbService;
	
	@RequestMapping("list.gb") // list.gb?currentPage=xx
	public String selectGroupBuyList(@RequestParam(value="currentPage", defaultValue="1")int currentPage,
									 Model model) {
		
		int listCount = gbService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 3);
		
		ArrayList<GroupBuy> list = gbService.selectGroupBuyList(pi);
		System.out.println(list);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "groupBuy/groupBuyListView";
	}
	
	@RequestMapping("detail.gb")
	public String selectGroupBuy(int gno, Model model) {
		
		int result = gbService.increaseCount(gno);
		
		if(result > 0 ) {
			GroupBuy gb = gbService.selectGroupBuy(gno);
			ArrayList<Attachment> atList = gbService.selectGbAttachment(gno);
			System.out.println(gb);
			System.out.println(atList);
			
			model.addAttribute("gb", gb);
			model.addAttribute("atList", atList);
			
			return "groupBuy/groupBuyDetailView";
		}else {
			model.addAttribute("errorMsg", "존재하지 않는 게시글입니다.");
			return "common/errorPage";
		}
		
		
	}
}
