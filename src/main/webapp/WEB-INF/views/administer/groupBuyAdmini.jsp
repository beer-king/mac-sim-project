<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MACSIM</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	<link
			rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
			integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
			crossorigin="anonymous"
	/>
	<link
			rel="stylesheet"
			href="https://fonts.googleapis.com/icon?family=Material+Icons"
	/>
	<link
			rel="stylesheet"
			href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	/>
	<link rel="stylesheet" href="resources/css/header.css" />
	<link rel="stylesheet" href="resources/css/mainPage.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
		.sidenav {
			height:100%;
			width: 250px;
			position: fixed;
			z-index:1;
			top: 0;
			left: 0;
			background-color:  rgb(43,39,36);
			overflow-x: hidden;
			transition:0.5s ease-in-out;
			padding-top: 60px;
            display: none;
		}
		.sidenav a {
			padding: 8px 8px 8px 32px;
			text-decoration: none;
			font-size: 25px;
			color: white;
			display: block;
			transition: 0.2s ease-in-out;
		}
		.sidenav a:hover, .offcanvas a:focus {
			color: rgb(236, 191, 46);
		}
		.closebtn {
			position: absolute;
			top: 0;
			right: 25px;
			font-size: 36px !important;
			margin-left: 50px;
		}
		.openmenu:hover {
			transition:0.5s ease-in-out;
			color: rgb(236, 191, 46);
		}
		.openmenu {
			font-size: 30px;
			cursor:pointer;
			transition:0.5s ease-in-out;
			color: white;
		}
		.openmenu > i {
			font-size: 30px;
		}
		.content{
			margin-top: 50px;
			margin-left: 200px;
            width: 60%;
            height: 600px;
            background: rgb(236, 191, 46);
            float: left;
        }
        .menu{
            margin-top: 50px;
            width: 20%;
            height: 200px;
            float: left;
        }
        .menu div{
            width: 150px;
            height: 40px;
            text-align: center;
            display:table-cell;
            vertical-align: middle;
            background: gray;
        }
        .menu div:hover{
            background: rgb(236, 191, 46);
            cursor: pointer;
        }
        .outer{
        	height: 600px;
            box-sizing: border-box;
        }
        
        #enrollForm img{
            float: left;
            margin: 20px;
            margin-left: 40px;
        }
        #enrollForm table{
        	margin-left: 100px;
        	margin-top: 50px;
            width: 80%;
            height: 360px;
        }
        .data{
            border-collapse: separate;
            border-spacing: 20px;
            width: 100%;
        }
        .dataview {
            margin: 20px;
            background: white;
            text-align: center;
            
        }
        .dataview td{
            height: 40px;
            width: 200px;
            vertical-align: middle;
        }
       	.dataSheet *{
       		vertical-align: middle;
       	}
        .dataview:hover{
		    cursor: pointer;
		}
    </style>
</head>
<body>

<!-- header -->
<header>
	<jsp:include page="sideBar.jsp"/>

</header>

<!-- main -->
<main>
<c:if test="${ !empty alertMsg }">
	<script>
		alertify.alert("${alertMsg}");
	</script>
	<c:remove var="alertMsg" scope="session"/>
</c:if>

<div class="outer">
    <div class="content">
    	<c:if test="${category eq 1}">
        <form id="enrollForm" method="post" action="enrollGB.ad" enctype="multipart/form-data">
            <img id="titleImg" width="200" height="200" style="margin-left:100px;">
            <img id="titleImg2" width="200" height="200">
            <img id="titleImg3" width="200" height="200">
            <input type="file" name="upfile1" id="upfile1" onchange="loadImg(this,1);" required oninvalid="checkAlert();">
            <input type="file" name="upfile2" id="upfile2" onchange="loadImg(this,2);">
            <input type="file" name="upfile3" id="upfile3" onchange="loadImg(this,3);">
            <br>
            <table class="dataSheet" align="center">
                <tr>
                	<input type="hidden" name="userNo" value="${loginUser.userNo }">
                    <th><label for="title">상품명</label></th>
                    <td><input type="text" class="form-control" name="gbName" required></td>
                    <td>&nbsp</td>
                    <th><label for="eTitle">상품가격</label></th>
                    <td><input type="number" class="form-control" name="price" required></td>
                </tr>
                <tr>
                    <th><label for="title">시작시간</label></th>
                    <td><input type="datetime-local" class="form-control" name="gbStart" required></td>
                    <td>&nbsp</td>
                    <th><label for="eTitle">마감시간</label></th>
                    <td><input type="datetime-local" class="form-control" name="gbEnd" required></td>
                </tr>
                <tr>
                    <th><label for="title">포인트 소모</label></th>
                    <td><input type="number" class="form-control" name="gbPoint" required></td>
                    <td>&nbsp</td>
                    <th><label for="eTitle">모집자 제한수</label></th>
                    <td><input type="number" class="form-control" name="limitNo" required></td>
                </tr>
                <tr>
                    <th><label for="title">상세 설명</label></th>
                    <td colspan="4"><textarea name="content" cols="30" rows="10" style="width: 100%; height: 100; resize: none;"></textarea></td>
                    
                </tr>
            </table>
            <br>
			
            <div align="right">
                <button type="submit" class="btn btn-primary">등록하기</button>
                <button type="reset" class="btn btn-danger">취소하기</button>
            </div>
        </form>
        </c:if>
        <c:if test="${category eq 2}">
        		<br>
      			<form class="enrollForm" action="" method="post" align="right">
		            <select name="sort" id="sort">
		                <option value="name" selected>맥주 이름</option>
		                <option value="no">맥주 번호</option>
		            </select>
		            <input type="text" id="searchbox" placeholder="검색어를 입력하세요" name="search">
		            <button type="submit" id="sbtn" style="margin-right: 20px;">검색</button>
		        </form>
       
		        
		        <br>
		        <table class="dataview" style="width: 90%;" onclick="clickB(${b.beerNo})">
			            	<tr>
			            		<td rowspan="2" style="width: 20px;"><img src="${b.changeName }" width="100" height="100"></td>
			            	</tr>
			                <tr class="clickDataView">
			                    <td>맥주 번호 : ${b.beerNo }</td>
			                    <td>맥주 이름 : ${b.beerName }</td>
			                </tr>
			    </table>
		     	<div class="paging-area" align="center">     
		        	<c:if test="${ pi.currentPage ne 1}">
		        		<a href="GB.ad?category=${category }&currentPage=${ pi.currentPage-1 }">이전</a>
		        	</c:if>	
		        	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		        		<a href="GB.ad?category=${category }&currentPage=${ p }">${ p }</a>
		            </c:forEach>
		            <c:if test="${pi.maxPage > 0 and pi.maxPage ne pi.currentPage}">
		            	<a href="GB.ad?category=${category }&currentPage=${ pi.currentPage+1 }">다음</a>
		            </c:if>
        		</div>
        </c:if>
        <c:if test="${category eq 3}">
        		<br>
      			<form class="enrollForm" action="" method="post" align="right">
		            <select name="sort" id="sort">
		                <option value="name" selected>맥주 이름</option>
		                <option value="no">맥주 번호</option>
		            </select>
		            <input type="text" id="searchbox" placeholder="검색어를 입력하세요" name="search">
		            <button type="submit" id="sbtn" style="margin-right: 20px;">검색</button>
		        </form>
       
		        
		        <br>
		        <table class="dataview" style="width: 90%;" onclick="clickB(${b.beerNo})">
			            	<tr>
			            		<td rowspan="2" style="width: 20px;"><img src="${b.changeName }" width="100" height="100"></td>
			            	</tr>
			                <tr class="clickDataView">
			                    <td>맥주 번호 : ${b.beerNo }</td>
			                    <td>맥주 이름 : ${b.beerName }</td>
			                </tr>
			    </table>
		     	<div class="paging-area" align="center">     
		        	<c:if test="${ pi.currentPage ne 1}">
		        		<a href="GB.ad?category=${category }&currentPage=${ pi.currentPage-1 }">이전</a>
		        	</c:if>	
		        	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		        		<a href="GB.ad?category=${category }&currentPage=${ p }">${ p }</a>
		            </c:forEach>
		            <c:if test="${pi.maxPage > 0 and pi.maxPage ne pi.currentPage}">
		            	<a href="GB.ad?category=${category }&currentPage=${ pi.currentPage+1 }">다음</a>
		            </c:if>
        		</div>
        </c:if>
        
        
    </div>
    
    <div class="menu">
    	<c:if test="${category eq 1}">
        <div id="name1" style="background: rgb(236, 191, 46);">공구 등록 관리</div>
        <br>
        <div id="name2">공구 요청 관리</div>
        <br>
        <div id="name3">공구 게시판</div>
        <br>
        </c:if>
        <c:if test="${category eq 2}">
        <div id="name1">공구 등록 관리</div>
        <br>
        <div id="name2" style="background: rgb(236, 191, 46);">공구 요청 관리</div>
        <br>
        <div id="name3">공구 게시판</div>
        <br>
        </c:if>
        <c:if test="${category eq 3}">
        <div id="name1">공구 등록 관리</div>
        <br>
        <div id="name2">공구 요청 관리</div>
        <br>
        <div id="name3" style="background: rgb(236, 191, 46);">공구 게시판</div>
        <br>
        </c:if>
    </div>
    <script>
	    function clickB(bNo){
			var bNo = bNo;
			location.href = "beerUpdate.ad?beerNo=" + bNo;
		}
		$(function(){
			$(document).ready(function() {
	    		if (${category} != 1) {
					$(".content").height('800');
					$(".outer").height('1000');
				}
	    		if('${sort}' == 'no'){
	    			$('#sort option:eq(1)').prop('selected', true);
	    		}else{
	    			$('#sort option:eq(2)').prop('selected', true);
	    		}
	    		
	    	});
			$("#upfile1").hide();
			$("#upfile2").hide();
			$("#upfile3").hide();
			$("#titleImg").click(function(){
				$("#upfile1").click();
			});
			$("#titleImg2").click(function(){
				$("#upfile2").click();
			});
			$("#titleImg3").click(function(){
				$("#upfile3").click();
			});
			$("#name1").click(function(){
				location.href = "GB.ad";
			});
			$("#name2").click(function(){
				location.href = "GB.ad?category=2";
			});
			$("#name3").click(function(){
				location.href = "GB.ad?category=3";
			});
		});
		
		function loadImg(inputFile, number){
			if(inputFile.files.length){
				var reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function(e){
					switch(number){
	                    case 1:
	                        $("#titleImg").attr("src", e.target.result);
	                        break;
	                    case 2:
	                        $("#titleImg2").attr("src", e.target.result);
	                        break;
	                    case 3:
	                        $("#titleImg3").attr("src", e.target.result);
	                        break;
                	}
				}
			}else{
				switch(number){
	                case 1:
	                    $("#titleImg").attr("src", null);
	                    break;
	                case 3:
	                    $("#titleImg2").attr("src", null);
	                    break;
	                case 4:
	                    $("#titleImg3").attr("src", null);
	                    break;
	            }
			}
		}
		function checkAlert(){
			alert("이미지를 넣어주세요.");
		}
	</script>
	
</div>
</main>

<footer></footer>
</body>
</html>