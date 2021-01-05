package com.beer.macSim.event.model.vo;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class EventAttendee {
	
	private int evatNo;				 // 이벤트신청순번
	private int evNo;				 // 이벤트번호
	private int userNo;				 // 신청한 회원번호
	private String eventEntryStatus; // 이벤트 참가상태
	private String eventEntryDate;	 // 이벤트 n상태로 7일후 자동삭제
	private int evPoint;			 // 이벤트 신청시 소모포인트
}
