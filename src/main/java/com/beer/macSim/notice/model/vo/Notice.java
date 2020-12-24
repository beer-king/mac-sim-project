package com.beer.macSim.notice.model.vo;

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
public class Notice {

	private int noticeNo; //공지사항번호
	private String userNo; // 작성자
	private String userId;
	private String noticeTitle; // 공지사항제목
	private String noticeContent; // 공지사항내용
	private Date noticeDate; //작성일
	private int count; //조회수
	
}








