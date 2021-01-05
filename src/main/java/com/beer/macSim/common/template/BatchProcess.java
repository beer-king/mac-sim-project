package com.beer.macSim.common.template;

import java.util.ArrayList;

import com.beer.macSim.administer.model.vo.Batch;

public class BatchProcess {
	public static Batch getBatch(ArrayList<String> list, String status, String content) {
		return new Batch(list, status, content);
	}
}
