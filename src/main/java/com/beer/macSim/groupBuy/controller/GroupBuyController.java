package com.beer.macSim.groupBuy.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.common.template.Pagination;
import com.beer.macSim.event.model.vo.Attachment;
import com.beer.macSim.groupBuy.model.service.GroupBuyService;
import com.beer.macSim.groupBuy.model.vo.GbRequest;
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
	
	@RequestMapping("apply.gb")
	public String applyGroupBuy(@RequestParam(value="myAddress1", defaultValue=" ")String myAddress1,
								@RequestParam(value="inputAddress", defaultValue=" ")String inputAddress,
								GbRequest gbr,
								HttpSession session, Model model) {
		
		if(gbr.getAddress().equals("myAddress")) {
			gbr.setAddress(myAddress1);
		}else {
			gbr.setAddress(inputAddress);
		}
		
		int result1 = 0;
		result1 = gbService.increaseApplyNo(gbr);
		
		if(result1 > 0) {
			int result2 = 0;
			result2 = gbService.decreasePoint(gbr);
			
			if(result2 >0) {
				int result3 =0;
				result3 = gbService.applyGroupBuy(gbr);
				
				if(result3 > 0) {
					
					session.setAttribute("alertMsg", "성공적으로 공동구매가 신청되었습니다.");
					return "redirect:group.me";
				}else {
					session.setAttribute("alertMsg", "공동구매 신청이 실패하였습니다.");
					return "redirect:list.gb";
				}
			}else {
				session.setAttribute("alertMsg", "공동구매 신청할 포인트가 부족합니다.");
				return "redirect:point.me";	
			}
			
		}else {
			session.setAttribute("alertMsg", "해당 공동구매 참여가 마감되었습니다.");
			return "redirect:list.gb";
		}
	}
}
