package com.beer.macSim.community.model.vo;

import java.sql.Date;
import java.util.ArrayList;

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
public class Reply {
	
	private int forNo;			// 포럼번호
	private int coNo;			// 댓글번호
	private String coContent;	// 댓글내용
	private Date coCreateDate;	// 댓글 생성일
	private Date coUpdateDate;	// 수정일
	private int coStatus;		// 댓글상태
	private int recoCount;		// 대댓글 개수
	private int userNo;			// 유저넘버
	private String userId;		// 유저아이디
	private ArrayList<SubReply> subReply;	// 대댓글들
}
