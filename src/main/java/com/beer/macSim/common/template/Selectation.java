package com.beer.macSim.common.template;

import java.util.ArrayList;

import com.beer.macSim.administer.model.vo.SelectData;

public class Selectation {
	public static SelectData getSelectData(int category, String status) {
		ArrayList<String> data = new ArrayList<String>();
		if(category == 1) {
			data.add("6");
		}else if(category == 2){
			data.add("1");
			data.add("2");
		}else {
			data.add("3");
			data.add("4");
			data.add("5");
		}
		return new SelectData(category, status,data);
	}
}
