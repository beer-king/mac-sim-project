package com.beer.macSim.data.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;


@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Score {

    private int scoreNo;

    private int score;

    private String comments;

    private Date updateDate;

    private String status;

    private int userNo;

    private int beerNo;

}
