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
public class NoComment {

	
	 private int ncoNo;
	 private int noticeNo;
	 private String userNo;
	 private String ncoComment;
	 private String ncoDate;
	 private int status;
}
