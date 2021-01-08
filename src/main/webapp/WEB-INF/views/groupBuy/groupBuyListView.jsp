<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>공구리스트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
	.outer{
		width:1000px;
		margin:auto;
		}
    .gbList{
        width:800px;
        height:200px;
        position:relative; 
        background-color:#151515;
        color:white;
        }
    .gbList:hover{cursor:pointer}
    .content{
        height:100px;
        box-sizing: border-box;
        width:70%;
        position: absolute;
        top:20px;
        left:250px;
        }
    .photo{
        height:100%;
        width:30%;
        position: absolute;
        top:30px;
        left:30px;
        float:left;
    	}
    #pagingArea{
    	width:fit-content;
     	margin:auto;
     	}  
    #title{color:#ecbf2e;}  
</style>
</head>
<body>
    
   <jsp:include page="../common/header.jsp"/>    
   
   <br>
   
   <div class="outer" align="center">
       
       <div id="search-area" align="center">
	       <form action="search.gb" class="search">
	       	   <input type="hidden" name="currentPage" value="1">
	           <h2>Group Buying</h2>
	           <select name="category">
	               <option value="catTitle">제목으로 검색</option>
	               <option value="catContent">내용으로 검색</option>
	           </select>
	
	           <input type="text" name="searchWord" spaceholder="검색어를 입력하세요.">
	
	           <button type="submit">검색</button>
	       </form>
		</div>
		
		<c:if test="${ !empty category }">
			<script>
				$(function(){
					$("#search-area option[value=${category}]").attr("selected", true);
				})
			</script>
		</c:if>
		
       <br><br>
       
       <c:forEach var="g" items="${ list }">
       		<br>
	       <div class="gbList">
	       		<input class="gno" type="text" hidden value="${ g.pno }">
	           <div class="photo">
	               <img src="${ g.gbThumb }" alt="" width="160px">
	           </div>
	
	           <div class="content">
	               <table style="height: 100%;" align="center">
	                   <thead>
	                       <th id="title">${ g.gbName }</th>
	                       <th>공구 No.${ g.pno }</th>
	                       <th>D-Day = 10</th>
	                       <th>${ g.gbStart }</th>
	                   </thead>
	                   <tbody>
	                       <td colspan="4">${ g.content }</td>
	                   </tbody>
	                   <tfoot>
	                       <td>조회수 : ${ g.clickNo }</td>
	                       <td>댓글수 : 32</td>
	                       <td>작성자 : ${ g.userNo }</td>
	                       <td>${ g.gbDate }</td>
	                   </tfoot>
	               </table>
	           </div>
	
	       </div>
	   </c:forEach>
	   
	   <!-- 
       <br>
       <div class="gbList">
           <div class="photo">
               <img src="resources/images/기네스 맥주잔.jpg" alt="" width="160px">
           </div>

           <div class="content">
               <table style="height: 100%;" align="center">
                   <thead>
                       <th>기네스 맥주잔</th>
                       <th>공구 No.22</th>
                       <th>D-Day = 11</th>
                       <th>2020-12-10 PM 8</th>
                   </thead>
                   <tbody>
                       <td colspan="4">안녕하세요 기네스 맥주잔 공구합니다!!</td>
                   </tbody>
                   <tfoot>
                       <td>조회수 : 145</td>
                       <td>댓글수 : 12</td>
                       <td>작성자 : admin</td>
                       <td>2020-11-09</td>
                   </tfoot>
               </table>
           </div>
        </div>  
	 	-->
		 
		 
         <c:choose>
         	<c:when test="${ !empty loginUser }">
         		<script>
		           	$(function(){
		           		$(".gbList").click(function(){
		           			location.href="detail.gb?gno=" + $(this).children(".gno").val() + "&userNo=" + ${loginUser.userNo};
		           		})
		           		
		           	})
		        </script>
         	</c:when>
         	<c:otherwise>
         		<script>
		           	$(function(){
		           		$(".gbList").click(function(){
		           			location.href="detail.gb?gno=" + $(this).children(".gno").val();
		           		})
		           		
		           	})
		        </script>
         	</c:otherwise>
         </c:choose>

       	<br><br>
       	
       	<c:choose>	
       	   <c:when test="${ empty category }">
       	   	<!-- 검색 요청전 페이징바 -->
	           <div id="pagingArea">
	               <ul class="pagination">
	               	   
	               	   <c:choose>
	                   		<c:when test="${ pi.currentPage eq 1 }">
	                   			<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                   		</c:when>
	                   		<c:otherwise>
	                   			<li class="page-item"><a class="page-link" href="list.gb?currentPage=${ pi.currentPage -1 }">Previous</a></li>
	                   		</c:otherwise>
	                   </c:choose>
	                   
	                   <c:forEach var="p" begin="${pi.startPage }" end="${ pi.endPage }">
	                   		<li class="page-item"><a class="page-link" href="list.gb?currentPage=${ p }">${ p }</a></li>
	                   </c:forEach>
	                   
	                   <c:choose>
	                   		<c:when test="${ pi.currentPage eq pi.maxPage }">
	                   			<li class="page-item"><a class="page-link" href="#">Next</a></li>
	              	   		</c:when>
	              	   		<c:otherwise>
	              	   			<li class="page-item"><a class="page-link" href="list.gb?currentPage=${ pi.currentPage +1 }">Next</a></li>
	              	   		</c:otherwise>
	              	   </c:choose>
	               </ul>
	           </div>
	        </c:when> 
	        <c:otherwise>
	        	<!-- 검색 요청후 페이징바 -->
	        	<div id="pagingArea">
	               <ul class="pagination">
	               	   
	               	   <c:choose>
	                   		<c:when test="${ pi.currentPage eq 1 }">
	                   			<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                   		</c:when>
	                   		<c:otherwise>
	                   			<li class="page-item"><a class="page-link" href="search.gb?currentPage=${ pi.currentPage -1 }&category=${category}&searchWord=${searchWord}">Previous</a></li>
	                   		</c:otherwise>
	                   </c:choose>
	                   
	                   <c:forEach var="p" begin="${pi.startPage }" end="${ pi.endPage }">
	                   		<li class="page-item"><a class="page-link" href="search.gb?currentPage=${ p }&category=${category}&searchWord=${searchWord}">${ p }</a></li>
	                   </c:forEach>
	                   
	                   <c:choose>
	                   		<c:when test="${ pi.currentPage eq pi.maxPage }">
	                   			<li class="page-item"><a class="page-link" href="#">Next</a></li>
	              	   		</c:when>
	              	   		<c:otherwise>
	              	   			<li class="page-item"><a class="page-link" href="search.gb?currentPage=${ pi.currentPage +1 }&category=${category}&searchWord=${searchWord}">Next</a></li>
	              	   		</c:otherwise>
	              	   </c:choose>
	               </ul>
	           </div>
	        </c:otherwise>
       </c:choose>

   </div>    
</body>
</html>