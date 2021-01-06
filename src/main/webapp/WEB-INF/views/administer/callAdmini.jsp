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
            height: 700px;
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
        .outer{
        	height: 800px;
        }
        .clickDataView:hover{
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
<div class="outer">
    <div class="content">
    	<c:if test="${category ne 4}">
    	<br>
	    	<div class="search_bar" style="margin-left: 5px;">
	            <select id="status" name="status">
	            	<c:choose>
	            		<c:when test="${status eq 'A' }">
	            			<option value="A" selected>처리중</option>
	            			<option value="B">허위신고</option>
	            			<option value="C">처리완료</option>
	            		</c:when>
	            		<c:when test="${status eq 'B' }">
	            			<option value="A">처리중</option>
	            			<option value="B" selected>허위신고</option>
	            			<option value="C">처리완료</option>
	            		</c:when>
	            		<c:when test="${status eq 'C' }">
	            			<option value="A">처리중</option>
	            			<option value="B">허위신고</option>
	            			<option value="C" selected>처리완료</option>
	            		</c:when>
	            	
	            	
	            	</c:choose>
	            	
	            </select>
	        </div>
        </c:if>
        <c:if test="${category eq 4}">
    	<br>
	    	<div class="search_bar" style="margin-left: 5px;">
	            <select id="status" name="status">
	            	<c:choose>
	            		<c:when test="${status eq 'A' }">
	            			<option value="A" selected>처리중</option>
	            			<option value="B">블랙리스트유저</option>
	            		</c:when>
	            		<c:when test="${status eq 'B' }">
	            			<option value="A">처리중</option>
	            			<option value="B" selected>블랙리스트유저</option>
	            		</c:when>
	            	</c:choose>
	            	
	            </select>
	        </div>
        </c:if>
        <form action="test.do" method="POST">
        	<c:choose>
        		<c:when test="${pi.listCount eq 0}">
		        	<table class="dataview" style="width: 90%;">
		                <tr>
		                    <td><h3>게시물이 없습니다.</h3></td>
		               
		                </tr>
		                
		            </table>
        		</c:when>
        		<c:when test="${category eq 1}">
        			<c:forEach var="r" items="${ rlist }">	
		            <table class="dataview" style="width: 90%;">
		            	<c:if test="${status eq 'A' }">
			            	<tr>
			            		<td rowspan="3" style="width: 20px;"><input type="checkbox" name="number" value="${r.reqNo}"></td>
			            	</tr>
			                <tr class="clickDataView" onclick="trclick2(${r.reqNo}, `${r.reqContent }`, '${r.reqCateTitle }')">
			                    <td>신고글 번호 : ${r.reqNo}</td>
			                    <td>종류 번호 : 이벤트댓글</td>
			                </tr>
			                <tr class="clickDataView" onclick="trclick2(${r.reqNo}, `${r.reqContent }`, '${r.reqCateTitle }')">
			                	<td>신고 카테고리 : ${r.reqCateTitle }</td>
			                	<td>&nbsp</td>
			                </tr>
		                </c:if>
		                <c:if test="${status ne 'A' }">
			                <tr class="clickDataView">
			                    <td>신고글 번호 : ${r.reqNo}</td>
			                    <td>종류 번호 : 이벤트댓글</td>
			                </tr>
			                <tr class="clickDataView">
			                	<td>신고 카테고리 : ${r.reqCateTitle }</td>
			                	<td>&nbsp</td>
			                </tr>
		                </c:if>
		            </table>
		            </c:forEach>
		            
		            <c:if test="${status eq 'A' }">
			            <div style="margin-right: 20px; text-align: right;">
			            	<button type="button"  data-toggle="modal" data-target="#myModal2" >일괄 삭제</button>
			            </div>
		            </c:if>
        		</c:when>
        		<c:when test="${category eq 2}">
        			<c:forEach var="r" items="${ rlist }">	
		            <table class="dataview" style="width: 90%;">
		            	<c:if test="${status eq 'A' }">
			            	<tr>
			            		<td rowspan="3" style="width: 20px;"><input type="checkbox" name="number" value="${r.reqNo}"></td>
			            	</tr>
			                <tr class="clickDataView" onclick="trclick2(${r.reqNo}, `${r.reqContent }`, '${r.reqCateTitle }')">
			                    <td>신고글 번호 : ${r.reqNo}</td>
			                    <c:if test="${r.rfromNo eq 1}">
			                    	<td>종류 번호 :맥주리뷰</td>
			                    </c:if>
			                    <c:if test="${r.rfromNo eq 2}">
			                    	<td>종류 번호 : 맥주리뷰댓글</td>
			                    </c:if>
			                </tr>
			                <tr class="clickDataView" onclick="trclick2(${r.reqNo}, `${r.reqContent }`, '${r.reqCateTitle }')">
			                	<td>신고 카테고리 : ${r.reqCateTitle }</td>
			                	<td>&nbsp</td>
			                </tr>
		                </c:if>
		                <c:if test="${status ne 'A' }">
			                <tr class="clickDataView">
			                    <td>신고글 번호 : ${r.reqNo}</td>
			                    <c:if test="${r.rfromNo eq 1}">
			                    	<td>종류 번호 :맥주리뷰</td>
			                    </c:if>
			                    <c:if test="${r.rfromNo eq 2}">
			                    	<td>종류 번호 : 맥주리뷰댓글</td>
			                    </c:if>
			                </tr>
			                <tr class="clickDataView">
			                	<td>신고 카테고리 : ${r.reqCateTitle }</td>
			                	<td>&nbsp</td>
			                </tr>
		                </c:if>
		            </table>
		            </c:forEach>
		            <c:if test="${status eq 'A' }">
			            <div style="margin-right: 20px; text-align: right;">
			            	<button type="button"  data-toggle="modal" data-target="#myModal2" >일괄 삭제</button>
			            </div>
		            </c:if>
        		</c:when>
        		<c:when test="${category eq 3}">
        			<c:forEach var="r" items="${ rlist }">	
		            <table class="dataview" style="width: 90%;">
		            	<c:if test="${status eq 'A' }">
			            	<tr>
			            		<td rowspan="3" style="width: 20px;"><input type="checkbox" name="number" value="${r.reqNo}"></td>
			            	</tr>
			                <tr class="clickDataView" onclick="trclick2(${r.reqNo}, `${r.reqContent }`, '${r.reqCateTitle }')">
			                    <td>신고글 번호 : ${r.reqNo}</td>
			                    <c:if test="${r.rfromNo eq 3}">
			                    	<td>종류 번호 : 커뮤니티</td>
			                    </c:if>
			                    <c:if test="${r.rfromNo eq 4}">
			                    	<td>종류 번호 : 포럼댓글</td>
			                    </c:if>
			                    <c:if test="${r.rfromNo eq 5}">
			                    	<td>종류 번호 : 포럼 대댓글</td>
			                    </c:if>
			                </tr>
			                <tr class="clickDataView" onclick="trclick2(${r.reqNo}, `${r.reqContent }`, '${r.reqCateTitle }')">
			                	<td>신고 카테고리 : ${r.reqCateTitle }</td>
			                	<td>&nbsp</td>
			                </tr>
		                </c:if>
		                <c:if test="${status ne 'A' }">
			                <tr class="clickDataView">
			                    <td>신고글 번호 : ${r.reqNo}</td>
			                    <c:if test="${r.rfromNo eq 3}">
			                    	<td>종류 번호 : 커뮤니티</td>
			                    </c:if>
			                    <c:if test="${r.rfromNo eq 4}">
			                    	<td>종류 번호 : 포럼댓글</td>
			                    </c:if>
			                    <c:if test="${r.rfromNo eq 5}">
			                    	<td>종류 번호 : 포럼 대댓글</td>
			                    </c:if>
			                </tr>
			                <tr class="clickDataView">
			                	<td>신고 카테고리 : ${r.reqCateTitle }</td>
			                	<td>&nbsp</td>
			                </tr>
		                </c:if>
		            </table>
		            </c:forEach>
		            
		            <c:if test="${status eq 'A' }">
			            <div style="margin-right: 20px; text-align: right;">
			            	<button type="button"  data-toggle="modal" data-target="#myModal2" >일괄 삭제</button>
			            </div>
		            </c:if>
        		</c:when>
        		<c:when test="${category eq 4}">
        			<c:forEach var="u" items="${ ulist }">	
					<table class="dataview" style="width: 90%;">
						<c:if test="${status eq 'A' }">
							<tr>
								<td rowspan="3" style="width: 20px;"><input type="checkbox" name="number" value="${u.userNo}"></td>
							</tr>
			                <tr class="clickDataView" onclick="trclick(${u.userNo})">
			                    <td>유저 번호 : ${u.userNo}</td>
			                    <td>유저 아이디 : ${u.userId}</td>
			                </tr>
			                <tr class="clickDataView" onclick="trclick(${u.userNo})">
			                    <td>신고된 수 : ${u.report}</td>
			                    <td>&nbsp</td>
			                </tr>
		                </c:if>
		                <c:if test="${status ne 'A' }">
			                <tr class="clickDataView">
			                    <td>유저 번호 : ${u.userNo}</td>
			                    <td>유저 아이디 : ${u.userId}</td>
			                </tr>
			                <tr class="clickDataView">
			                    <td>신고된 수 : ${u.report}</td>
			                    <td>&nbsp</td>
			                </tr>
		                </c:if>
		            </table>
		            </c:forEach>
		            
		            <c:if test="${status eq 'A' }">
			            <div align=right style="margin-right: 20px;">
			            	<button type="submit">일괄처리</button>
			            </div>
		            </c:if>
        		</c:when> 
            </c:choose>
            
            
            
            <div class="paging-area" align="center">  
            	
	        	<c:if test="${ pi.currentPage ne 1}">
	        		<a href="callAd.ad?currentPage=${ pi.currentPage-1 }&category=${ category}">이전</a>
	        	</c:if>	
	        	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	        		<a href="callAd.ad?currentPage=${ p }&category=${ category}">${ p }</a>
	            </c:forEach>
	            <c:if test="${pi.maxPage > 0 and pi.maxPage ne pi.currentPage}">
	            	<a href="callAd.ad?currentPage=${ pi.currentPage+1 }&category=${ category}">다음</a>
	            </c:if>
        	</div>
			
        </form>
    </div>
    
    <div class="menu">
    	<c:choose>
    		<c:when test="${category eq 1}">
		        <div id="name1" style="background: rgb(236, 191, 46);">이벤트 신고 관리</div>
		        <br>
		        <div id="name2">맥주 리뷰 신고 관리</div>
		        <br>
		        <div id="name3">포럼 신고 관리</div>
		        <br>
		        <div id="name4">신고된 유저 관리</div>
		        <br>
        	</c:when>
        	<c:when test="${category eq 2}">
		        <div id="name1">이벤트 신고 관리</div>
		        <br>
		        <div id="name2" style="background: rgb(236, 191, 46);">맥주 리뷰 신고 관리</div>
		        <br>
		        <div id="name3">포럼 신고 관리</div>
		        <br>
		        <div id="name4">신고된 유저 관리</div>
		        <br>
        	</c:when>
        	<c:when test="${category eq 3}">
		        <div id="name1">이벤트 신고 관리</div>
		        <br>
		        <div id="name2">맥주 리뷰 신고 관리</div>
		        <br>
		        <div id="name3" style="background: rgb(236, 191, 46);">포럼 신고 관리</div>
		        <br>
		        <div id="name4">신고된 유저 관리</div>
		        <br>
        	</c:when>
        	<c:when test="${category eq 4}">
		        <div id="name1">이벤트 신고 관리</div>
		        <br>
		        <div id="name2">맥주 리뷰 신고 관리</div>
		        <br>
		        <div id="name3">포럼 신고 관리</div>
		        <br>
		        <div id="name4" style="background: rgb(236, 191, 46);">신고된 유저 관리</div>
		        <br>
        	</c:when>
        </c:choose>
    </div>
    <script>
    	var num = "";
    	var content = "";
    	var cate = "";
    	var checkArr = [];
	    function trclick(userNo){
			num = userNo;
			$("#myModal").modal("show");
		};
		function trclick2(reportNo, rcontent, rcate){
			num = reportNo;
			content = rcontent;
			cate = rcate;
			$("#mcate").html(cate);
			$("#mcontent").html(content);
			$("#myModal").modal("show");
		};
		$(function(){
	    	$("#userBan").click(function(){
	    		userBan();
	        });
	    	$("#reportB").click(function(){
	    		reportB();
	        });
	    	$("#reportC").click(function(){
	    		reportC();
	        });
	    	$("#passR").click(function(){
	    		passR();
	        });
	    	$("#deleteR").click(function(){
	    		deleteR();
	        });
	    	function userBan(){
	    		  $.ajax({
	    			  url:"userBan.ad",
	    			  type:"POST",
	    			  data:{
	    				  userNo:num},
	    			  success:function(result){
	    				  alert("블랙리스트처리 되었습니다.");
	    				  location.reload();
	    			  },error:function(){
	    				  alert("실패되었습니다.");
	    			  }
	    		  })
	    	  }
	    	function reportB(){
	    		  $.ajax({
	    			  url:"reportB.ad",
	    			  type:"POST",
	    			  data:{
	    				  reqNo:num},
	    			  success:function(result){
	    				  alert("허위 신고처리 되었습니다.");
	    				  location.reload();
	    			  },error:function(){
	    				  alert("실패되었습니다.");
	    			  }
	    		  })
	    	  }
	    	function reportC(){
	    		  $.ajax({
	    			  url:"reportC.ad",
	    			  type:"POST",
	    			  data:{
	    				  reqNo:num},
	    			  success:function(result){
	    				  alert("삭제처리 되었습니다.");
	    				  location.reload();
	    			  },error:function(){
	    				  alert("실패되었습니다.");
	    			  }
	    		  })
	    	  }
			$("#name1").click(function(){
				location.href = "callAd.ad";
			});
			$("#name2").click(function(){
				location.href = "callAd.ad?category=2";
			});
			$("#name3").click(function(){
				location.href = "callAd.ad?category=3";
			});
			$("#name4").click(function(){
				location.href = "callAd.ad?category=4";
			});
			$("#status").change(function(){
				location.href = "callAd.ad?status="+$(this).val() + "&category=${category}";
			});
			function passR(){
				$("input[name='number']:checked").each(function(i){
					checkArr.push($(this).val());
				});
				$.ajax({
					url:"processReport.ad",
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
			function deleteR(){
				$("input[name='number']:checked").each(function(i){
					checkArr.push($(this).val());
				});
				$.ajax({
					url:"processReport.ad",
	    			type:"POST",
	    			dataType: 'text',
	    			data: {
	    	            list: checkArr,
	    	            Astatus:'C'
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
	<c:if test="${category eq 4}">
		<div class="modal fade" id="myModal">
		    <div class="modal-dialog">
		      <div class="modal-content">
		      <br>
		      	<h4>&nbsp해당 유저를 블랙리스트에 등록하시겠습니까?</h4>
		        <!-- Modal body -->
		        <div class="modal-body">
		          <br><br>
		          <div align="right">
		          	<button id="userBan" type="button" class="btn btn-primary" data-dismiss="modal">삭제하기</button>
		          	<button type="button" class="btn btn-danger" data-dismiss="modal">취소하기</button>
		          </div>
		        </div>
		      </div>
		    </div>
	    </div>
    </c:if>
    <c:if test="${category ne 4}">
	    <div class="modal fade" id="myModal">
		    <div class="modal-dialog">
		      <div class="modal-content">
		      <br>
		      	<h3>&nbsp 신고 카테고리</h3>
		      	<h5 id="mcate" style="margin-left: 40px;"></h5>
		        <!-- Modal body -->
		        <div class="modal-body">
		          <h3>&nbsp 신고 이유</h3>
		          <h5 id="mcontent" style="margin-left: 40px;"></h5>
		          <br><br>
		          <div align="center">
		          	<button type="button" class="btn btn-primary" data-dismiss="modal" style="width: 150px;">해당 글 이동</button>
		          	<button id="reportB" type="button" class="btn btn-primary" data-dismiss="modal" style="width: 100px;">허위 신고</button>
		          	<button id="reportC" type="button" class="btn btn-danger" data-dismiss="modal">삭제하기</button>
		          </div>
		        </div>
		      </div>
		    </div>
	    </div>
    </c:if>
    <div class="modal fade" id="myModal2">
   			<div class="modal-dialog">
     		<div class="modal-content">
     
       		<!-- Modal body -->
       		<div class="modal-body">
         			<h3>선택한 신고를 전부 처리하시겠습니까?</h3>
         			<br><br><br>
         			<div align="right">
         			<button id="passR" type="button" class="btn btn-primary" data-dismiss="modal">허위신고</button>
         			<button id="deleteR" type="button" class="btn btn-primary" data-dismiss="modal">삭제</button>
         			<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
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