<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>공구상세페이지</title>
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
        #applyTable{
        	box-sizing: border-box;
        	width:100%;
        	text-align:center;
        }
        #applyTable th{
        	height:50;
        }
    </style>
</head>
<body>
    
    <jsp:include page="../common/header.jsp"/> 
    
        <div class="head" align="center">
        
        <button id="back" type="button" class="btn btn-primary" onclick="history.back();" >&lt;뒤로가기</button>
        <br><br>
        
            <div class="photo">
                <img src="${ gb.gbThumb }" width="300px">
            </div>
            <div class="profile">
                <table id="proTable">
                    <tr>
                        <td colspan="2"><h2>공구 No.${ gb.pno }</h2></td>
                    </tr>
                    <tr>
                        <th><h1>${ gb.gbName }</h1></th>
                        <th><h4>작성자 : ${ gb.userNo }</h4></th>
                    </tr>
                    <tr>
                        <th>신청마감일 : ${ gb.gbEnd }</th>
                        <th>D- Day = 10일 5시 35분 남음</th>
                    </tr>
                    <tr>
                        <c:choose>
                        	<c:when test="${ chApp eq 0 }">
                        		<th><button class="btn btn-danger" data-toggle="modal" data-target="#appModal1">신청하기</button></th>
                        	</c:when>
                        	<c:otherwise>
                        		<th>이미 신청하신 공동구매입니다.</th>
                        	</c:otherwise>
                        </c:choose>
                        <th><a href="" data-toggle="modal" data-target="#catModal">카테고리에 담기</a></th>
                    </tr>
                </table>
            </div>
            
        </div>
        <div class="body" align="center">
             <table class="table" align="center">
                <tr>
                    <td colspan="2">
                        <h3>${ gb.content }</h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h2>모집자 현황 :  ${ gb.limitNo }명 중  ${ gb.applyNo }명  마감됨 !!</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h3>기존 거래 가격: ${ gb.price }원(1세트: 2잔)</h3>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="${ atList[0].changeName }" width="500px">
                    </td>
                    <td>
                        <img src="${ atList[1].changeName }" width="500px">
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
        
		<!-- 신청하기 모달창 -->
        <div class="modal fade" id="appModal1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">공구 신청하기</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button> 
                    </div>
    
                    <form action="apply.gb" method="post">
                        <!-- Modal Body -->
                        <div class="modal-body">
                        	<input type="number" name="pno" value="${ gb.pno }" hidden>
                        	<input type="number" name="userNo" value="${ loginUser.userNo }" hidden>
                            <input type="number" name="gbPoint" value="${ gb.gbPoint }" hidden>
                            <table id="applyTable">
                               <thead>
	                               <tr>
	                                   <th colspan="2">배송지 선택하기</th>
	                               </tr>
                               </thead>
                               <tbody>
	                               <tr>
	                                   <th><input type="radio" name="address" value="myAddress" required></th>
	                                   <th><h4>나의 주소 : <input size="50px" type="text" name="myAddress1" readOnly value="${loginUser.address} ${loginUser.extraAddress } ${loginUser.detailAddress }"></h4></th>
	                               </tr>
	                               <tr>
	                                   <th><input type="radio" name="address" value="newAddress" required></th>
	                                   <th>직접 입력하기<label><input  size="50px" name="inputAddress" type="text"></label></th>
	                               </tr>
	                               <tr>
	                               		<th colspan="2">포인트 차감 :  ${ gb.gbPoint }  차감후 포인트 : ${ loginUser.point - gb.gbPoint }</th>
	                               </tr>
	                               <tr>
	                               		<th colspan="2"><h5>공동구매를 신청하시겠습니까?</h5></th>
	                               </tr>
                               </tbody>
                           </table>
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
		
		<!-- 공구 카테고리 담기 모달창 -->
        <div class="modal fade" id="catModal">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    
    
                    <form action="카테고리받아주는서버" method="post">
                        <!-- Modal Body -->
                        <div class="modal-body">
                            <label>
                                ${ gb.gbName }공구  No.${ gb.pno }을<br> 
                                [관심 공구] 카테고리에 담으시겠습니까?
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