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
          <ul id="comm__nav">
            <li>
              <img src="resources/images/beer-chat-icon-yellow.png" alt="selectedImg" /><a
                class="nav-active"
                href="list.cm"
                >맥심의 일상</a
              >
            </li>
            <li>
              <!--<img src="resources/images/beer-chat-icon-yellow.png" alt="selectedImg" />--><a
                class=""
                href="list.cm?cate=1"
                >오늘의 맥주</a
              >
            </li>
            <li><a href="list.fo">포럼</a></li>
          </ul>
        </div>
        <div class="comm__write-btn">
          <button>글쓰기<span class="material-icons"> edit </span></button>
        </div>
        
        <ul class="comm__items">
          <c:forEach var="c" items="${ list }" >
	        <li>
	          <div class="img-wrapper">
	            <img src="resources/uploadFiles/${ c.commSrc }" alt="picture" />
	          </div>
	          <div class="item-right">
	            <div class="item-info">
	              <p>${ c.userId }</p>
	              <div>
	              	<c:choose>
	              	  <c:when test="${ !empty loginUser && loginUser.userId eq c.userId }">
		                <span>수정</span>
		                <span>삭제</span>
		              </c:when>
		              <c:otherwise>
		                <span>신고</span>
		              </c:otherwise>
	                </c:choose>
	                <small>${ c.commCreateDate }</small>
	                <b class="material-icons">favorite_border</b>
	                <!-- <i class="material-icons">favorite</i> -->
	              </div>
	            </div>
	            <div class="item-contents">
	              ${ c.commContent }
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
			    <li class="page-item"><a class="page-link" href="list.cm?cate=${ cate }&currentPage=${ pi.currentPage-1 }">&lt;</a></li>
			  </c:otherwise>
		    </c:choose>
		
		    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		      <li class="page-item"><a class="page-link" href="list.cm?cate=${ cate }&currentPage=${ p }">${ p }</a></li>
			</c:forEach>
		
			<c:choose>
			  <c:when test="${ pi.currentPage eq pi.maxPage }">
				<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
			  </c:when>
			  <c:otherwise>
				<li class="page-item"><a class="page-link" href="list.cm?cate=${ cate }&currentPage=${ pi.currentPage+1 }">&gt;</a></li>
			  </c:otherwise>
			</c:choose>
		  </ul>
		</div>
        
      </div>
    </main>
    
    <script defer>
      // 탭  /  active된 탭에 클래스 부여 -> nav-active
      
      // 페이징  /  active된 페이지 숫자에 클래스 부여 -> paging-active
    
    </script>

</body>
</html>

</body>
</html>