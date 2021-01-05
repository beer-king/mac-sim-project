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
public class SubReply {

	private int coNo;			// 댓글번호
	private int recoNo;			// 대댓글번호
	private String recoContent;	// 대댓글내용
	private Date recoCreateDate;// 댓글 생성일
	private Date recoUpdateDate;// 수정일
	private int recoStatus;		// 대댓글상태
	private int userNo;			// 유저넘버
	private String userId;		// 유저아이디
	
}
