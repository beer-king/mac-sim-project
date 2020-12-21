package com.beer.macSim.groupBuy.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class GbReply {
	
	private int gbRpno;			// 공구댓글번호
	private int pno;			// 공구번호
	private String userNo;		// 작성자
	private String gbRpContent;	// 댓글내용
}
