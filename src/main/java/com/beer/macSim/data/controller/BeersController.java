package com.beer.macSim.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BeersController {
	
	@RequestMapping("beers.db")
	public String selectBeersList() {
		return "beer/beers";
	}

}
