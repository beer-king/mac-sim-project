<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MACSIM</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- JavaScript -->
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
	integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" />
<link rel="stylesheet" href="resources/css/header.css" />
<link rel="stylesheet" href="resources/css/mainPage.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.sidenav {
	height: 100%;
	width: 250px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: rgb(43, 39, 36);
	overflow-x: hidden;
	transition: 0.5s ease-in-out;
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
	transition: 0.5s ease-in-out;
	color: rgb(236, 191, 46);
}

.openmenu {
	font-size: 30px;
	cursor: pointer;
	transition: 0.5s ease-in-out;
	color: white;
}

.openmenu>i {
	font-size: 30px;
}

.content {
	margin-top: 50px;
	margin-left: 200px;
	width: 60%;
	height: 900px;
	background: rgb(236, 191, 46);
	float: left;
}

.menu {
	margin-top: 50px;
	width: 20%;
	height: 200px;
	float: left;
}

.menu div {
	width: 150px;
	height: 40px;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	background: gray;
}

.menu div:hover {
	background: rgb(236, 191, 46);
	cursor: pointer;
}

.outer {
	height: 1100px;
	box-sizing: border-box;
}

#enrollForm img {
	float: left;
	margin: 20px;
	margin-left: 40px;
}

#enrollForm table {
	width: 40%;
	height: 360px;
}

.data {
	border-collapse: separate;
	border-spacing: 20px;
	width: 100%;
}

.dataview {
	margin: 20px;
	background: white;
	text-align: center;
}

.dataview td {
	height: 40px;
	width: 200px;
	vertical-align: middle;
}
</style>
</head>
<body>

	<!-- header -->
	<header>
		<jsp:include page="sideBar.jsp" />

	</header>

	<!-- main -->
	<main>
		<c:if test="${ !empty alertMsg }">
			<script>
				alertify.alert("${alertMsg}");
			</script>
			<c:remove var="alertMsg" scope="session" />
		</c:if>

		<div class="outer">
			<div class="content">
				
			    <br>
				<div class="search_bar" style="margin-left: 5px;">
					<form class="enrollForm" action="" method="post" align="right" >
						 <input type="text" id="search" placeholder="제목를 입력하세요" name="search">
						<button type="submit" id="sbtn" style="margin-right: 20px;">검색</button>
					</form>
					<select id="status" name="status" style="margin-left: 5px;">
				        <c:choose>
				            <c:when test="${status eq 'A' }">
				            	<option value="A" selected>처리중</option>
				            	<option value="B">승인</option>
				            	<option value="C">미승인</option>
				            	<option value="D">삭제</option>
				            </c:when>
				            <c:when test="${status eq 'B' }">
				            	<option value="A">처리중</option>
				            	<option value="B" selected>승인</option>
				            	<option value="C">미승인</option>
				            	<option value="D">삭제</option>
				            </c:when>
				            <c:when test="${status eq 'C'}">
				            	<option value="A">처리중</option>
				            	<option value="B">승인</option>
				            	<option value="C" selected>미승인</option>
				            	<option value="D">삭제</option>
				            </c:when>
				            <c:when test="${status eq 'D' }">
				            	<option value="A">처리중</option>
				            	<option value="B">승인</option>
				            	<option value="C">미승인</option>
				            	<option value="D" selected>삭제</option>
				            </c:when>
				           </c:choose>
					</select>
				</div>
				<br>
				<c:choose>
	        		<c:when test="${pi.listCount eq 0}">
			        	<table class="dataview" style="width: 90%;">
			                <tr>
			                    <td><h3>게시물이 없습니다.</h3></td>
			               
			                </tr>
			                
			            </table>
	        		</c:when>
	        		<c:otherwise>
	        		<c:choose>
	        			<c:when test="${status eq 'A'}">
		        			<c:forEach var="e" items="${ elist }">
								<table class="dataview" style="width: 90%;">
									<tr>
										<td rowspan="5" style="width: 5px;"><input type="checkbox" class="number" name="number" value="${e.evNo}"></td>
									</tr>
									<tr class="clickDataView">
										<td rowspan="5" style="width: 20px;"><img
											src="${e.evThumb }" width="100" height="100"></td>
									</tr>
									<tr class="clickDataView">
										<td colspan="2">이벤트 제목 : ${e.evTitle }</td>
									</tr>
									<tr class="clickDataView">
										<td>포인트 : ${e.evPoint }</td>
										<td>모집자 수 : ${e.limitNo}</td>
									</tr>
									<tr class="clickDataView">
										<td>시작 날짜: ${e.evStartTime }</td>
										<td>종료 날짜 : ${e.evEndTime}</td>
									</tr>
								</table>
							</c:forEach>
							<div style="margin-right: 20px; text-align: right;">
								<button type="button"  data-toggle="modal" data-target="#myModal" >일괄 삭제</button>
							</div>
	        			</c:when>
	        			<c:otherwise>
	        				<c:forEach var="e" items="${ elist }">
								<table class="dataview" style="width: 90%;">
									<tr class="clickDataView">
										<td rowspan="4" style="width: 20px;"><img
											src="${e.evThumb }" width="100" height="100"></td>
									</tr>
									<tr class="clickDataView">
										<td colspan="2">이벤트 제목 : ${e.evTitle }</td>
									</tr>
									<tr class="clickDataView">
										<td>포인트 : ${e.evPoint }</td>
										<td>모집자 수 : ${e.limitNo}</td>
									</tr>
									<tr class="clickDataView">
										<td>시작 날짜: ${e.evStartTime }</td>
										<td>종료 날짜 : ${e.evEndTime}</td>
									</tr>
								</table>
							</c:forEach>
	        			</c:otherwise>
	        		</c:choose>
						
						<div class="paging-area" align="center">
							<c:if test="${ pi.currentPage ne 1}">
								<a href="beerAd.ad?category=2&currentPage=${ pi.currentPage-1 }">이전</a>
							</c:if>
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<a href="beerAd.ad?category=2&currentPage=${ p }">${ p }</a>
							</c:forEach>
							<c:if test="${pi.maxPage > 0 and pi.maxPage ne pi.currentPage}">
								<a href="beerAd.ad?category=2&currentPage=${ pi.currentPage+1 }">다음</a>
							</c:if>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="modal fade" id="myModal">
    			<div class="modal-dialog">
      			<div class="modal-content">
      
        		<!-- Modal body -->
        		<div class="modal-body">
          			<h3>선택한 이벤트를 전부 처리하시겠습니까?</h3>
          			<br><br><br>
          			<div align="right">
          			<button id="agree" type="button" class="btn btn-primary" data-dismiss="modal">승인</button>
          			<button type="button" data-toggle="modal" data-target="#myModal2" class="btn btn-primary" data-dismiss="modal">미승인</button>
          			<button id="deleteE" type="button" class="btn btn-primary" data-dismiss="modal">삭제</button>
          			<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
          			</div>
        		</div>
      			</div>
    			</div>
  			</div>
  			<div class="modal fade" id="myModal2">
    			<div class="modal-dialog">
      			<div class="modal-content">
      
        		<!-- Modal body -->
        		<div class="modal-body">
          			<h3>해당 이유를 전송하겠습니까?</h3>
          			<br>
          			<textarea name="call_reason_detail" id="content" cols="30" rows="10" style="width: 400px; height: 100; resize: none;"></textarea>
          			<br><br>
          			<div align="right">
          			<button id="disagree" type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
          			<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
          			<br>
          			</div>
        		</div>
      			</div>
    			</div>
  			</div>
			<script>
		$(function(){
			var checkArr = [];
			var content = "";
			$(document).ready(function() {
	    		
	    	});
			$("#status").change(function(){
				location.href = "eventAd.ad?status="+$(this).val();
			});
			$("#agree").click(function(){
				agree();
			});
			$("#disagree").click(function(){
				disagree();
			});
			$("#deleteE").click(function(){
				deleteE();
			});			
			function agree(){
				$("input[name='number']:checked").each(function(i){
					checkArr.push($(this).val());
				});
				$.ajax({
					url:"processEvent.ad",
	    			type:"POST",
	    			dataType: 'text',
	    			data: {
	    	            list: checkArr,
	    	            Astatus:'B'
	    	        },
	    	        success:function(result){
	    				  alert("처리되었습니다.");
	    				  location.reload();
	    			  },error:function(){
	    				  alert("실패되었습니다.");
	    				  location.reload();
	    			  }
				});
			}
			function disagree(){
				$("input[name='number']:checked").each(function(i){
					checkArr.push($(this).val());
				});
				$.ajax({
					url:"processEvent.ad",
	    			type:"POST",
	    			dataType: 'text',
	    			data: {
	    	            list: checkArr,
	    	            Astatus:'C',
	    	            content:$("#content").val()
	    	        },
	    	        success:function(result){
	    				  alert("처리되었습니다.");
	    				  location.reload();
	    			  },error:function(){
	    				  alert("실패되었습니다.");
	    				  location.reload();
	    			  }
				});
			}
			function deleteE(){
				$("input[name='number']:checked").each(function(i){
					checkArr.push($(this).val());
				});
				$.ajax({
					url:"processEvent.ad",
	    			type:"POST",
	    			dataType: 'text',
	    			data: {
	    	            list: checkArr,
	    	            Astatus:'D'
	    	        },
	    	        success:function(result){
	    				  alert("처리되었습니다.");
	    				  location.reload();
	    			  },error:function(){
	    				  alert("실패되었습니다.");
	    				  location.reload();
	    			  }
				});
			}
		});
		
		
	</script>

		</div>
	</main>

	<footer></footer>
</body>
</html>