package com.beer.macSim.community.model.vo;

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
public class Forum {

	private int forNo;		 	// 포럼 게시글 번호
	private String forSrc;		// 대표 이미지 경로
	private String forTitle;	// 포럼 게시글 제목
	private String forInfo;		// 게시글 내용
	private Date forCreateDate;	// 생성일
	private int forCount;		// 조회수
	private int forComment;		// 댓글수
	private int forStatus;		// 게시글상태 -- 0:정상 / 1:신고접수중 / 2:블랙리스트 / 3:삭제
	private int userNo;			// 작성자 회원번호
	private String userId;		// 작성자 아이디
	
}
