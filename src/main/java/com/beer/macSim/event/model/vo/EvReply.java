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
public class EvReply {
	
	private int evRpno;			// 이벤트댓글번호
	private int evNo;			// 이벤트번호
	private String userNo;		// 작성자
	private String evRpContent;	// 댓글내용
	private Date rpDate;		// 댓글작성일
	private String status;		// 상태값
}
