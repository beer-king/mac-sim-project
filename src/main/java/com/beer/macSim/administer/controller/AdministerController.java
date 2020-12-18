package com.beer.macSim.administer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdministerController {
	
	@RequestMapping("callAd.ad")
	public String goCall() {
		return "administer/callAdmini";
	}
}
