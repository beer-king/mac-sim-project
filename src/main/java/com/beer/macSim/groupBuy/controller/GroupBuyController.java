package com.beer.macSim.groupBuy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupBuyController {
	
	@RequestMapping("list.gb")
	public String selectGroupBuyList() {
		
		return "groupBuy/groupBuyListView";
	}
	
	@RequestMapping("detail.gb")
	public String selectGroupBuy() {
		
		return "groupBuy/groupBuyDetailView";
	}
}
