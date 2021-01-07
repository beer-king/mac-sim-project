package com.beer.macSim.data.model.service;

import java.util.ArrayList;

import com.beer.macSim.data.model.vo.Beers;

public interface LoadMainService {

	int selectCountBeer();

	Beers selectOneBeer(int bno);

	ArrayList<Beers> selectRankList();

	Beers selectGenderRank(String gender);

}
