<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MACSIM</title>
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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/header.css" />
	<link rel="stylesheet" href="resources/css/mainPage.css" />
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
            height: 500px;
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
        .table{
            margin-left: 30px;
            width: 90%;
        }
        .enrollForm {
            margin-right: 20px;
        }
        .table tbody tr:hover{
            background: gray;
            cursor: pointer;
        }
    	.table{
            border: 1px solid black;
            width: 800px;
            height: 300px;
        }
        .data{
            border-collapse: separate;
            border-spacing: 20px;
            width: 100%;
           
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
<div class="outer">
    <div class="content">
    	<c:if test="${category eq 1}">
        <br>
        <form class="enrollForm" action="" method="" align="right">
            <select name="" id="">
                <option value="title">제목</option>
                <option value="content">내용</option>
            </select>
            <input type="text" id="searchbox" placeholder="검색어를 입력하세요" name="search">
            <button type="submit" id="sbtn">검색</button>
        </form>
        <br>
        <div class="dataview">
            <table class="table" style="text-align: center;">
                <br>
                <thead>
                    <tr style=" text-align: center;">
                        <th style=" text-align: center;">번호</th>
                        <th style=" text-align: center;" width="300">제목</th>
                        <th style=" text-align: center;">글쓴이</th>
                        <th style=" text-align: center;" width="150">작성일</th>
                        <th style=" text-align: center;">조회수</th>
                        <th style=" text-align: center;">버튼</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="n" items="${ list }">	
                    <tr>
                        <td style="vertical-align: middle;">${n.noticeNo }</td>
                        <td style="vertical-align: middle;">${n.noticeTitle }</td>
                        <td style="vertical-align: middle;">${n.userId }</td>
                        <td style="vertical-align: middle;">${n.noticeDate }</td>
                        <td style="vertical-align: middle;">${n.count }</td>
                        <td style="vertical-align: middle;"><button type="button" id="name3" onclick="goUpdatePage('${n.noticeNo}');">수정</button>&nbsp&nbsp
                        <button type="button" data-toggle="modal" data-target="#myModal" data-num="${n.noticeNo }">삭제</button></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <br>
        <div class="paging-area" align="center">     
        	<c:if test="${ pi.currentPage ne 1}">
        		<a href="noticeAd.ad?currentPage=${ pi.currentPage-1 }">이전</a>
        	</c:if>	
        	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
        		<a href="noticeAd.ad?currentPage=${ p }">${ p }</a>
            </c:forEach>
            <c:if test="${pi.maxPage > 0 and pi.maxPage ne pi.currentPage}">
            	<a href="noticeAd.ad?currentPage=${ pi.currentPage+1 }">다음</a>
            </c:if>
        </div>
        </c:if>
   
    <c:if test="${category eq 2}">
   		<br><br>
        <form action="enrollNotice.ad" method="POST">
        	<input type="hidden" name ="userNo" value="${loginUser.userNo}">
            <table class="data" style="text-align: center;">
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="noticeTitle" style="width: 90%;" required></td>
                </tr>
                <tr>
                    <th style="vertical-align: middle;">내용</th>
                    <td><textarea name="noticeContent" cols="30" rows="10" style="resize: none; width: 90%; height: 300px;" required></textarea></td>
                </tr>
                
            </table>
            <div align="right">
                <button type="submit">등록</button>
                <button type="reset">취소</button>
            </div>
        </form>
    </c:if>
    
    </div>
    <div class="menu">
        <c:if test="${category eq 1}">
			<div id="name1" style="background: rgb(236, 191, 46);">공지사항 목록</div>
	        <br>
	        <div id="name2">공지사항 등록 관리</div>
	        <br>
        </c:if>
        <c:if test="${category eq 2}">
	        <div id="name1">공지사항 목록</div>
	        <br>
	        <div id="name2" style="background: rgb(236, 191, 46);">공지사항 등록 관리</div>
	        <br>
        </c:if>
    </div>
    <script>
	    function goUpdatePage(noticeNo)
	    {
			location.href="goUpdateNotice.ad?noticeNo="+noticeNo;
	    }
		$(function(){
			var num = "";
			$(document).ready(function() {
	    		$('#myModal').on('show.bs.modal', function(event){
	    			num = $(event.relatedTarget).data('num');
	    		});
	    	});
	    	$("#call").click(function(){
	     
	        	call();
	        	
	        });
	    	function call(){
	    		  $.ajax({
	    			  url:"noticeDelete.ad",
	    			  type:"POST",
	    			  data:{
	    				  noticeNo:num},
	    			  success:function(result){
	    				  alert("삭제되었습니다.");
	    				  location.reload();
	    			  },error:function(){
	    				  alert("실패되었습니다.");
	    			  }
	    		  })
	    	  }
			$("#name1").click(function(){
				location.href = "noticeAd.ad";
			});
			$("#name2").click(function(){
				location.href = "noticeAd.ad?category=2";
			});
			
			
		});
	</script>
	<div class="modal fade" id="myModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      <br>
	      	<h3>&nbsp&nbsp해당 공지사항을 삭제하시겠습니까?</h3>
	        <!-- Modal body -->
	        <div class="modal-body">

	          <br><br>
	          <div align="right">
	          	<button id="call" type="button" class="btn btn-primary" data-dismiss="modal">삭제하기</button>
	          	<button type="button" class="btn btn-danger" data-dismiss="modal">취소하기</button>
	          </div>
	        </div>
	      </div>
	    </div>
    </div>
</div>
</main>

<footer></footer>
</body>
</html>