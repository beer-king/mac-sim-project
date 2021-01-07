package com.beer.macSim.groupBuy.model.vo;

import java.sql.Date;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class GbRequest {
	
	private int requestNo; // 공구신청번호
	private int pno;		// 공구번호
	private int userNo;		// 회원번호
	private String reqStatus; // 신청상태
	private String address;	  // 배송주소
	private int gbPoint;
}
