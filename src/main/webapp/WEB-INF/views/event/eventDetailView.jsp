<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트상세페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <style>
        .head{
            background-color: #151515;
            height: 250px;
            width: 1200px;
            margin: auto;
            color:white;
        }
        #back{
        	width: 120px;	
        }
        .photo{
            float: left;
        }
        .profile{
            width: 800px;
            height: 200px;
            float: left;
            padding-left: 30px;
            background-color: #151515;
        }
        #proTable{
            width: 700px;
            height: 100%;
        }
        .body{
            background-color: #151515;
            height: 1050px;
            width: 1200px;
            margin: auto;
        }
        .body *{
            color:white;
        }
        .table{width: 100%;}
    </style>
</head>
<body>
    
   
   	<jsp:include page="../common/header.jsp"/>   
		
		<br>

        <div class="head" align="center">
        
        <button id="back" type="button" class="btn btn-primary" onclick="history.back();">&lt;뒤로가기</button>
        <br><br>
        
            <div class="photo">
                <img src="${ ev.evThumb }" width="350px">
            </div>
            <div class="profile">
                <table id="proTable">
                    <tr>
                        <td colspan="2"><h2>Event No. ${ ev.evNo }</h2></td>
                    </tr>
                    <tr>
                        <th><h1>${ ev.evTitle }</h1></th>
                        <th><h4>작성자 : ${ ev.userNo }</h4></th>
                    </tr>
                    <tr>
                        <th>시음일 : ${ ev.evStartTime } </th>
                        <th>신청마감일 : ${ ev.reqTime }</th>
                    </tr>
                    <tr>
                        <th><button class="btn btn-danger" data-toggle="modal" data-target="#appModal">신청하기</button></th>
                        <th><a href="" data-toggle="modal" data-target="#catModal">카테고리에 담기</a></th>
                    </tr>
                </table>
            </div>
            
        </div>
        <div class="body" align="center">
             <table class="table" align="center">
                <tr>
                    <td colspan="2">
                        <h3>${ ev.evContent }</h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h2>모집자 현황 :  ${ ev.limitNo }명 중  ${ ev.applyNo }명  마감됨 !!</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h3>제공되는 맥주 : ${ ev.beerNo } <br>
                        제주 위트 에일은 뉴욕 맥주 판매 1위 브랜드 <br>
                        ‘브루클린 브루어리’와 손잡고 만든 밀맥주로, 제주맥주의 주력 상품
                        </h3>
                    </td>
                    <td>
                        <img src="${ atList[0].changeName }" width="200px">
                    </td>
                </tr>
                <tr>
                    <td>
                        <h3>
                            2차 온라인 맥주 시음회도 성공리에 막을 내렸습니다. <br>
                            2020-08-20 사진
                        </h3>
                    </td>
                    <td>
                        <img src="${ atList[1].changeName }" width="300px">
                    </td>
                </tr>
             </table>
        
            <table class="table" align="center">
                <thead>
                    <tr>
                        <th colspan="2">
                            <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%"></textarea>
                        </th>
                        <th style="vertical-align: middle"><button class="btn btn-secondary">등록하기</button></th>
                    </tr>
                    <tr>
                       <td colspan="3">댓글 (<span id="rcount">3</span>) </td> 
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>BeerQueen</th>
                        <td>저번 시음회 신청하신분 어떠셨나요? ㅎㅎ</td>
                        <td>2020-11-10</td>
                    </tr>
                    <tr>
                        <th>BeerKing</th>
                        <td>꼭 신청해야지 ㅎㅎ</td>
                        <td>2020-11-08</td>
                    </tr>
                    <tr>
                        <th>admin</th>
                        <td>댓글입니다ㅋㅋㅋ</td>
                        <td>2020-11-02</td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <div class="modal fade" id="appModal">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">이벤트 신청하기</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button> 
                    </div>
    
                    <form action="신청받아주는서버" method="post">
                        <!-- Modal Body -->
                        <div class="modal-body">
                            <label >포인트 차감  <h3>-2</h3></label>
                            <br>
                            <label >차감후 포인트 <h3>35</h3></label>
                            <h5>이벤트를 신청하시겠습니까?</h5>
                        </div>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">신청</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="catModal">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    
    
                    <form action="카테고리받아주는서버" method="post">
                        <!-- Modal Body -->
                        <div class="modal-body">
                            <label>
                                3차 온라인 맥주 시음회를<br> 
                                [이벤트] 카테고리에 담으시겠습니까?
                            </label>
                        </div>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">신청</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</body>
</html>