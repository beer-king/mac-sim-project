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
public class CommLikes {

	private int userNo;				// 좋아요한 유저 넘버
	private int commNo;				// 좋아요당한 커뮤게시글 넘버
	private Date clikeCreatedate;	// 좋아요한 날짜
	
}
