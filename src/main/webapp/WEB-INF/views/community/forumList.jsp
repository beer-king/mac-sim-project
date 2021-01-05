<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>MACSIM</title>
	<link
	  rel="stylesheet"
	  href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
	  integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
	  crossorigin="anonymous"
	/>
	<link
	  href="https://fonts.googleapis.com/icon?family=Material+Icons"
	  rel="stylesheet"
	/>
	<link rel="stylesheet" href="resources/css/header.css" />
	<link rel="stylesheet" href="resources/css/community/community.css" />
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
	<!-- main -->
    <main>
      <div class="inner">
        <h1 class="comm__h1">COMMUNITY</h1>
        <div class="comm__nav">
          <ul>
            <li>
              <a href="list.cm?cate=0">맥심의 일상</a>
            </li>
            <li><a href="list.cm?cate=1">오늘의 맥주</a></li>
            <li class="nav-active">
              <img src="resources/images/beer-chat-icon-yellow.png" alt="selectedImg" /><a
                href="#"
                >포럼</a
              >
            </li>
          </ul>
        </div>
        <div class="comm__write-btn">
          <c:if test="${ !empty loginUser }">
            <button onclick="location.href='enrollForm.fo'">새포럼<span class="material-icons"> edit </span></button>
          </c:if>
        </div>
        
        <ul class="comm__items">
          <c:forEach var="f" items="${ list }" >
	          <li class="forum__item" onclick="location.href='detail.fo?fno=${ f.forNo }'">
	            <div class="img-wrapper">
	              <img src="resources/uploadFiles/${ f.forChangeSrc }" alt="picture" />
	            </div>
	            <div class="item-right">
	              <div class="item-info">
	                <div>
	                  <strong>${ f.forTitle }</strong>
	                  <strong>${ f.userId }</strong>
	                </div>
	                <div>
	                  <c:choose>
	                    <c:when test="${ !empty loginUser && loginUser.userId eq f.userId }">
		                  <span>수정</span>
		                  <span>삭제</span>
		                </c:when>
		                <c:otherwise>
		                  <span>신고</span>
		                </c:otherwise>
	                  </c:choose>
	                  <small>${ f.forCreateDate }</small>
	                </div>
	              </div>
	              <div class="forum-contents">
	                ${ f.forInfo }
	                <div>
	                  <span>${ f.forCount } views</span>
	                  <span>${ f.forComment } comments</span>
	                </div>
	              </div>
	            </div>
	          </li>
          </c:forEach>
        </ul>
        
        <div id="pagingArea">
		  <ul class="pagination comm__paging">
		    
		    <c:choose>
			  <c:when test="${ pi.currentPage eq 1 }">
				<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
			  </c:when>
			  <c:otherwise>
			    <li class="page-item"><a class="page-link" href="list.fo?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
			  </c:otherwise>
		    </c:choose>
		
		    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		      <li class="page-item"><a class="page-link" href="list.fo?currentPage=${ p }">${ p }</a></li>
			</c:forEach>
		
			<c:choose>
			  <c:when test="${ pi.currentPage eq pi.maxPage }">
				<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
			  </c:when>
			  <c:otherwise>
				<li class="page-item"><a class="page-link" href="list.fo?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
			  </c:otherwise>
			</c:choose>
		  </ul>
		</div>
        
        
      </div>
    </main>

</body>
</html>