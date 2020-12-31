package com.beer.macSim.groupBuy.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class GroupBuy {
	
	private int pno;  		// 공구번호
	private String userNo;	// 작성자
	private String gbName; 	// 상품
	private int price;		// 상품가격
	private String content;	 // 상품설명	
	private String gbStart; // 시작시간
	private String gbEnd;	// 마감시간
	private int gbPoint;	// 포인트소모
	private String gbThumb; // 대표이미지
	private String status; 	// 상태값
	private int limitNo;	// 모집자제한수
	private int applyNo;	// 신청자수
	private int clickNo;	// 조회수
	private Date gbDate;	// 작성일자
}
