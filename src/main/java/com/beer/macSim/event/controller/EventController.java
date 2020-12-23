package com.beer.macSim.event.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.beer.macSim.common.model.vo.PageInfo;
import com.beer.macSim.common.template.Pagination;
import com.beer.macSim.event.model.service.EventService;
import com.beer.macSim.event.model.vo.Event;

@Controller
public class EventController {
	
	@Autowired
	private EventService evService;
	
	@RequestMapping("list.ev") // list.ev?currentPage=xx
	public String selectEventList(@RequestParam(value="currentPage", defaultValue="1")int currentPage,
								  Model model) {
		
		int listCount = evService.selectEventCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Event> list = evService.selectEventList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "event/eventListView";
	}
	
	@RequestMapping("detail.ev")
	public String selectEvent() {
		
		return "event/eventDetailView";
	}
}
