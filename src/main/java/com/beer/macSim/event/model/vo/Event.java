package com.beer.macSim.event.model.vo;

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
public class Event {
	
	private int evNo;			// 이벤트번호
	private String userNo;		// 회원번호 또는 작성자아이디
	private String evTitle;		// 이벤트명
	private String evContent;	// 이벤트내용
	private String evStartTime; // 이벤트시작시간
	private String evEndTime;   // 이벤트종료시간
	private String beerNo;		// 맥주번호 또는 맥주명
	private String reqTime;		// 신청마감시간
	private int limitNo;		// 모집자제한수
	private int applyNo;		// 신청자수
	private int evPoint;		// 포인트소모량
	private int clickNo;		// 조회수
	private String status;		// 상태값
	private Date evDate;		// 작성일
	private String evThumb;		// 대표이미지
	private String evDeny;		// 반대사유
}
