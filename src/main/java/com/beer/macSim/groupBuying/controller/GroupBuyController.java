package com.beer.macSim.groupBuying.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupBuyController {
	
	@RequestMapping("list.gb")
	public String selectGroupBuyList() {
		
		return "groupBuying.groupBuyingListView";
	}
}
