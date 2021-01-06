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
public class GbRequest {
	private int requestNo;
	private int pNo;
	private String userId;
	private String reqStatus;
	private String address;
	private String pname;
	private String thumb;
	private String statusName;
}
