package com.beer.macSim.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {
	
	@RequestMapping("list.ev")
	public String selectEventList() {
		
		return "event/eventListView";
	}
	
	@RequestMapping("detail.ev")
	public String selectEvent() {
		
		return "event/eventDetailView";
	}
}
