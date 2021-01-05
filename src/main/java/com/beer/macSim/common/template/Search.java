package com.beer.macSim.common.template;

import com.beer.macSim.administer.model.vo.BeerSearch;
import com.beer.macSim.event.model.vo.EventSearch;

public class Search {
	public static BeerSearch getBeerSearch(String category, String content) {
		return new BeerSearch(category, content);
	}
	
	public static EventSearch getEventSearch(String category, String searchWord) {
		return new EventSearch(category, searchWord);
	}
}
