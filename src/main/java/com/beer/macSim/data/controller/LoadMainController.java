package com.beer.macSim.data.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beer.macSim.data.model.service.LoadMainService;
import com.beer.macSim.data.model.vo.Beers;

@Controller
public class LoadMainController {

	@Autowired
	private LoadMainService mService;
	
	@RequestMapping("main.load")
	public String selectRankList(Model model) {
		
		int bCnt = mService.selectCountBeer();		// 맥주 디비 총 개수
		int bno = (int)(Math.random() * bCnt + 1);	// 랜덤한 맥주
		
		// today's recommendation
		Beers to = mService.selectOneBeer(bno);
		model.addAttribute("to", to);
		
		// Beer of Honer
		ArrayList<Beers> rList = mService.selectRankList();
		model.addAttribute("rList", rList);
		
		// men/women's choice
		Beers mRank = mService.selectGenderRank("M");
		Beers fRank = mService.selectGenderRank("F");
		model.addAttribute("mRank", mRank);
		model.addAttribute("fRank", fRank);

		System.out.println("랜덤맥주번호 : " + bno);
		System.out.println("to : " + to);
		System.out.println("rList : " + rList);
		System.out.println("mRank : " + mRank);
		System.out.println("fRank : " + fRank);
		
		model.addAttribute("a", "a");
		return "main";
		
	}
	
	
}
