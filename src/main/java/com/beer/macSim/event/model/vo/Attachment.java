package com.beer.macSim.event.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class Attachment {
	
	private int attNo;  		//첨부번호(pk)
	private String originName;  // 변경전 파일명
	private String changeName;  // 변경후 파일명(저장경로 + 변경후 파일명)
	private int evNo;			// 이벤트번호
	private int pNo;			// 공구번호
	
	
	public Attachment(String originName, String changeName, int pNo) {
		super();
		this.originName = originName;
		this.changeName = changeName;
		this.pNo = pNo;
	}
	
	
	
}
