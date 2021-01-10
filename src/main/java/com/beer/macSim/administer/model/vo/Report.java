package com.beer.macSim.administer.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class Report {

	private String reqNo;
	private String rfromNo;
	private String reqContent;
	private String reqStatus;
	private String reqNum;
	private String reqCateNo;
	private String reqCateTitle;
	private String rfromTitle;
	
	
}