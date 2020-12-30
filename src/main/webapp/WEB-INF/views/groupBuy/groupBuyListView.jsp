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
        background-color:aqua;
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
</style>
</head>
<body>
    
   <jsp:include page="../common/header.jsp"/>    
   
   <br>
   
   <div class="outer" align="center">
       
       <form action="" class="search">
           <h2>Group Buying</h2>
           <select id="searchCategory">
               <option>제목으로 검색</option>
               <option>내용으로 검색</option>
           </select>

           <input id="searchWord" spaceholder="검색어를 입력하세요.">

           <button type="submit">검색</button>
       </form>
	
		<a class="btn btn-primary" style="float:right"  href="enrollForm.gb">글쓰기</a>
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
	                       <th>${ g.gbName }</th>
	                       <th>공구 No.${ g.pno }</th>
	                       <th>D-Day = 10</th>
	                       <th>${ g.gbStart }</th>
	                   </thead>
	                   <tbody>
	                       <td colspan="4">${ g.content }</td>
	                   </tbody>
	                   <tfoot>
	                       <td>조회수 : 245</td>
	                       <td>댓글수 : 32</td>
	                       <td>작성자 : ${ g.userNo }</td>
	                       <td>2020-11-09</td>
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
		 -->
		 
		 
          <script>
           	$(function(){
           		$(".gbList").click(function(){
           			location.href="detail.gb"
           		})
           		
           	})
          </script>

       </div>
           <div id="pagingArea">
               <ul class="pagination">
                   <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                   <li class="page-item"><a class="page-link" href="#">1</a></li>
                   <li class="page-item"><a class="page-link" href="#">2</a></li>
                   <li class="page-item"><a class="page-link" href="#">3</a></li>
                   <li class="page-item"><a class="page-link" href="#">4</a></li>
                   <li class="page-item"><a class="page-link" href="#">5</a></li>
                   <li class="page-item"><a class="page-link" href="#">Next</a></li>
               </ul>
           </div>
       </div>

   </div>    
</body>
</html>