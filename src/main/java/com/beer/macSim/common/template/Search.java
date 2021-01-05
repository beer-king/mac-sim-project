package com.beer.macSim.common.template;

import com.beer.macSim.administer.model.vo.BeerSearch;

public class Search {
	public static BeerSearch getBeerSearch(String category, String content) {
		return new BeerSearch(category, content);
	}
}
