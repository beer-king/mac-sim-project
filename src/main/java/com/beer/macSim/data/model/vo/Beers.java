package com.beer.macSim.data.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Beers {
	
	private int beerNo;				//맥주번호
	private String beerName;		//한글 맥주명
	private String beerEname;		//영어 맥주
	private String beerStyle;		//맥주스타일
	private String beerProducer;	//제조사
	private String beerLocation;	//제조지역
	private String alcohol;			//알콜도수
	private String beerContainer;	//포장용기
	private String updatedDate;		//최신날짜
	private String status;			//상태
	private int replyCount;			//댓글수
	private int scoreTotal;			//평점
	private String originName;		//사진 오리지날 파일명
	private String changeName;		//사진 업로드 파일명 

}
