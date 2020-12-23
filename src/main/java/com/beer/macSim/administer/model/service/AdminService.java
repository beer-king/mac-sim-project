package com.beer.macSim.administer.model.service;

import com.beer.macSim.data.model.vo.Beers;
import com.beer.macSim.member.model.vo.Member;

public interface AdminService {
	int insertBeer(Beers b, Member m);
}
