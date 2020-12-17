package com.beer.macSim.member.model.vo;

import lombok.*;

import java.sql.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Member {

    private int userNo;
    private String userId;
    private String userPwd;
    private String userName;
    private String gender;
    private String email;
    private String address;
    private String extraAddress;
    private String detailAddress;
    private String postCode;
    private String birth;
    private String phone;
    private int point;
    private int status;
    private Date loginTime;
    private int report;


}
