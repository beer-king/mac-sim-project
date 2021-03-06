<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>이벤트리스트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
	.outer{
		width:1000px;
		margin:auto;
		}
    .evList{
        width:800px;
        height:200px;
        position:relative; 
        background-color:#151515;
        color:white;
        }
    .evList:hover{cursor:pointer;}
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
     	margin:auto;}
	#title{color:#ecbf2e;}   
</style>
</head>
<body>


  
    <jsp:include page="../common/header.jsp"/>    
    
    <br>
    
    <div class="outer" align="center">
        
        <div id="search-area" align="center">
	        <form action="search.ev" class="search">
	        	<input type="hidden" name="currentPage" value="1">
	            <h2>Event</h2>
	            <select name="category">
	                <option value="catTitle">제목으로 검색</option>
	                <option value="catContent">내용으로 검색</option>
	            </select>
	
	            <input type="text" name="searchWord" spaceholder="검색어를 입력하세요.">
	
	            <button type="submit">검색</button>
	        </form>
		</div>
		
		<c:if test="${ !empty es.category }">
			<script>
				$(function(){
					$("#search-area option[value=${es.category}]").attr("selected", true);
				})
			</script>
		</c:if>
		
		<a class="btn btn-primary" style="float:right"  href="enrollForm.ev">글쓰기</a>
		
        <br><br>
        <c:forEach var="e" items="${ list }">
	        <br>
	        <div class="evList">
	        	<input name="userNo" type="number" hidden value="${loginUser.userNo }">
	        	<input class="eno" type="text" hidden value="${ e.evNo }">
	            <div class="photo">
	                <img src="${ e.evThumb }" alt="" width="200px">
	            </div>
	
	            <div class="content">
	                <table id="eventList" style="height: 100%;" align="center">
	                    <thead>
	                        <th id="title">${ e.evTitle }</th>
	                        <th>No.${ e.evNo }</th>
	                        <th>D-Day = 8</th>
	                        <th>${ e.evStartTime }</th>
	                    </thead>
	                    <tbody>
	                        <td colspan="4">${ e.evContent }</td>
	                    </tbody>
	                    <tfoot>
	                        <td>조회수 : ${ e.clickNo }</td>
	                        <td>댓글수 : 12</td>
	                        <td>작성자 : ${ e.userNo }</td>
	                        <td>${e.evDate }</td>
	                    </tfoot>
	                </table>
	            </div>
	
	        </div>
        </c:forEach>
		
		<!-- 
        <br>
        <div class="evList">
            <div class="photo">
                <img src="resources/images/beer online tasting2.png" alt="" width="200px">
            </div>

            <div class="content">
                <table id="eventList" style="height: 100%;" align="center">
                    <thead>
                        <th>4차 온라인 맥주파티</th>
                        <th>No.12</th>
                        <th>D-Day = 8</th>
                        <th>2020-12-07 PM 8</th>
                    </thead>
                    <tbody>
                        <td colspan="4">안녕하세요 3차 온라인 시음회를 2주뒤에 개최합니다!!</td>
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
		            		$(".evList").click(function(){
		            			location.href = "detail.ev?eno=" + $(this).children(".eno").val() + "&userNo=" + ${loginUser.userNo};
		            		});
		            	});
		            </script>
	            </c:when>
	            <c:otherwise>
	            	<script>
		            	$(function(){
		            		$(".evList").click(function(){
		            			location.href = "detail.ev?eno=" + $(this).children(".eno").val();
		            		});
		            	});
		            </script>
	            </c:otherwise>
			</c:choose>
			
		<br><br>
		
		<c:choose>
			<c:when test="${ empty es.category }">
				<!-- 검색 요청전 페이징바 -->
		            <div id="pagingArea">
		                <ul class="pagination">
		                	
		                	<c:choose>
		                		<c:when test="${ pi.currentPage eq 1 }">
		                   			<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="list.ev?currentPage=${ pi.currentPage -1 }">Previous</a></li> 
		                    	</c:otherwise>
		                    </c:choose>
		                    
		                    <c:forEach var="p" begin="${pi.startPage }" end="${ pi.endPage }">
		                    	<li class="page-item"><a class="page-link" href="list.ev?currentPage=${ p }">${ p }</a></li>
		                    </c:forEach>
		                    
		                    <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    		<li class="page-item"><a class="page-link" href="#">Next</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="list.ev?currentPage=${ pi.currentPage +1 }">Next</a></li>
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
		                    		<li class="page-item"><a class="page-link" href="search.ev?currentPage=${ pi.currentPage -1 }&category=${ es.category}&searchWord=${ es.searchWord}">Previous</a></li> 
		                    	</c:otherwise>
		                    </c:choose>
		                    
		                    <c:forEach var="p" begin="${pi.startPage }" end="${ pi.endPage }">
		                    	<li class="page-item"><a class="page-link" href="search.ev?currentPage=${ p }&category=${ es.category}&searchWord=${ es.searchWord}">${ p }</a></li>
		                    </c:forEach>
		                    
		                    <c:choose>
		                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    		<li class="page-item"><a class="page-link" href="#">Next</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="search.ev?currentPage=${ pi.currentPage +1 }&category=${ es.category}&searchWord=${ es.searchWord}">Next</a></li>
		                    	</c:otherwise>
		                    </c:choose>
		                </ul>
		            </div>
	        </c:otherwise>
        </c:choose>

    </div>


</body>
</html>