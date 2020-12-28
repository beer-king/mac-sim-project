<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .outer{
            width: 800px;
            height: 600px;
            margin: auto;
            margin-top: 50px;
            color: white;
        }
        .table tbody>tr:hover{
            background:  #ecbf2e;
            cursor: pointer;
        }
        .paging-area a{
            text-decoration: none;
			 color: black;
            margin: 5px;
            
        }
        .paging-area a:hover{
            text-decoration: none;
            color: gray;
        }
        .paging-area{
           text-align: center;
           margin-left: 300px;
       }
       #sbtn{
           border:none;
           width:50px;
           height:25px;
           background:#ecbf2e;
       }
       #searchbox{
           border-radius: 0;
           outline-style: none;
           line-height: normal;
           border: 1px solid #999;
       }
        
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #2a2725;;">

	  <jsp:include page="../common/header.jsp"/> 

    <br><br>
    <div class="outer">
		<br><br>
        <span align="left" style= "font-size: 2em;">공지사항</span>


        <hr style="border: solid 0.7px #ecbf2e;">
        
        <br><br>
        <div>
            <form class="example" action="" method="" align="right">
                <select name="" id="">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" id="searchbox" placeholder="검색어를 입력하세요" name="search">
                <button type="submit" id="sbtn">검색</button>
            </form>
        </div>
		<br>
		
            <table id="noticeList" class="table" style="text-align: center; border: 1px solid #dddddd;">
                <br>
                <thead>
                    <tr style=" text-align: center;color: white;">

                        <th style=" text-align: center;">번호</th>
                        <th style=" text-align: center;" width="300">제목</th>
                        <th style=" text-align: center;">글쓴이</th>
                        <th style=" text-align: center;" width="150">작성일</th>
                        <th style=" text-align: center;">조회수</th>
                    </tr>
                </thead> 
                <tbody style="color: white;">
                
                	<c:forEach var="n" items="${ list }">	
	                    <tr>
	                        <td class="nno">${n.noticeNo }</td>
	                        <td>${n.noticeTitle }</td>
	                        <td>${n.userId }</td>
	                        <td>${n.noticeDate }</td>
	                        <td>${n.count }</td>
	                    </tr>
                   </c:forEach>
                   
                </tbody>
            </table>
            
			<script>
				$(function(){
					$("#noticeList tbody tr").click(function(){
						location.href = "detail.no?nno=" + $(this).children(".nno").text();
					});
				})
			</script>

            
       <br><br>

        <div class="paging-area">
			 <ul class="pagination pagination-sm">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="list.no?currentPage=${ pi.currentPage-1 }">이전</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="list.no?currentPage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    
                    <c:choose>
						<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="list.no?currentPage=${ pi.currentPage+1 }">다음</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                </ul>
                	
        </div>


    </div>
</body>
</html>