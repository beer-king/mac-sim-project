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
public class Community {

	private int commNo;				// 커뮤니티 게시글번호
	private String commOriginSrc;	// 원본사진 이름
	private String commChangeSrc;	// 바뀐 이름
	private String commContent; 	// 게시글 내용
	private Date commCreateDate;	// 작성일
	private int commCate;			// 탭 -- 0:맥심의일상 / 1:오늘의맥주
	private int commStatus;			// 게시글상태 -- 0:정상 / 1:신고접수중 / 2:블랙리스트 / 3:삭제
	private int userNo;				// 작성자 회원번호
	private String userId;			// 작성자 아이디
	private String like;			// 좋아요여부 -- 'N'/'Y'
	
}
