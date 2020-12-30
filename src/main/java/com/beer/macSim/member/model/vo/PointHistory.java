package com.beer.macSim.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class PointHistory {

	 private int pointNo;
	 private Date pointDate;
	 private int point;
	 private int userNo;
	 private String category;
	 private String pointHistory;
	
	
	
}
