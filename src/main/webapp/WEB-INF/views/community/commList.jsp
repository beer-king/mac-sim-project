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
            <li class="nav-active nav-list">
              <img src="resources/images/beer-chat-icon-yellow.png" alt="selectedImg" /><a
                href="list.cm?cate=0"
                >맥심의 일상</a
              >
            </li>
            <li class="nav-list">
              <img src="resources/images/beer-chat-icon-yellow.png" alt="selectedImg" /><a
                href="list.cm?cate=1"
                >오늘의 맥주</a
              >
            </li>
            <li><a href="list.fo">포럼</a></li>
          </ul>
        </div>
        
        <div class="comm__write-btn">
          <c:if  test="${ !empty loginUser }">
            <button onclick="location.href='enrollForm.cm'">글쓰기<span class="material-icons"> edit </span></button>
          </c:if>
        </div>
        
        <ul class="comm__items">
          <c:forEach var="c" items="${ list }" >
	        <li>
	          <div class="img-wrapper">
	            <img src="resources/uploadFiles/${ c.commChangeSrc }" alt="picture" />
	          </div>
	          <div class="item-right">
	            <div class="item-info">
	              <p>${ c.userId }</p>
	              <div>
	              	<c:choose>
	              	  <c:when test="${ !empty loginUser && loginUser.userId eq c.userId }">
		                <span onclick="location.href='updateForm.cm?commNo=${c.commNo}'">수정</span>
		                <span onclick="location.href='delete.cm?commNo=${c.commNo}'">삭제</span>
		              </c:when>
		              <c:otherwise>
		                <span><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal" data-num="${c.commNo }">신고</button></span>
		              </c:otherwise>
	                </c:choose>
	                <small>${ c.commCreateDate }</small>
	                <small class="like-length${c.commNo}" id="like-length${c.commNo}">${ c.likeLength }</small>
	                <c:choose>
	                  <c:when test ="${ c.isLike eq 0 }" >
	                    <b class="material-icons" id="likeBtnBorder${c.commNo}" onclick="likeOn(${loginUser.userNo}, ${c.commNo});">favorite_border</b>
	                  </c:when>
	                  <c:when test ="${ c.isLike eq 9999999 }" >
	                    <b class="material-icons" onclick="location.href='like.xx?cate=${cate}'">favorite_border</b>
	                  </c:when>
	                  <c:otherwise>
	                    <b class="material-icons" id="likeBtnFull${c.commNo}" onclick="likeOff(${loginUser.userNo}, ${c.commNo});">favorite</b>
	                  </c:otherwise>
	                </c:choose>
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
      const urlSearchParams = new URLSearchParams(window.location.href);
      const navList = document.querySelectorAll(".nav-list");
      
      function getUrlParams() {
    	    var params = {};
    	    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
    	    return params;
      }
      
      const onChange = () => {
    	  
    	  let qParams = getUrlParams();
    	  
          if(qParams.cate === "0"){
        	  navList[0].classList.add("nav-active");
        	  navList[1].classList.remove("nav-active");
          }else if(qParams.cate === "1"){
        	  navList[0].classList.remove("nav-active");
        	  navList[1].classList.add("nav-active");
          }
        	  
      }
      
      onChange();
      /*
      navList.forEach(v => {
	      v.addEventListener("click", onChange);
      });
      */
      
      
      // 페이징  /  active된 페이지 숫자에 클래스 부여 -> paging-active
      
      
      // 좋아요
      const likeOn = (userNo, commNo) => {
    	  console.log("좋아요 클릭");
    	  axios.get("like.on", {
    		  params:{
    			  uno:userNo,
    			  cno:commNo
    		  }
    	  }).then((res) => {
    		  console.log("좋아요됨");
    		  console.log(res.data);
    		  
    		  const likeLength = document.querySelector("#like-length"+commNo); 
    		  likeLength.innerText = res.data;
    		  
    		  const likeBtnB = document.querySelector("#likeBtnBorder"+commNo);
    		  likeBtnB.innerText = "favorite";
    		  likeBtnB.onclick = () => {likeOff(userNo, commNo)};
    		  likeBtnB.id = "likeBtnFull"+commNo;
    		  
    	  })
    	  
      }
      
      // 좋아요 취소
      const likeOff = (userNo, commNo) => {
    	  console.log("좋아요취소");
    	  axios.get("like.off", {
    		  params:{
    			  uno:userNo,
    			  cno:commNo
    		  }
    	  }).then((res) => {
    		  console.log("취소됨");
    		  console.log(res.data);
    		  
    		  const likeLength = document.querySelector("#like-length"+commNo); 
    		  likeLength.innerText = res.data;
    		  
    		  const likeBtnB = document.querySelector("#likeBtnFull"+commNo);
    		  likeBtnB.innerText = "favorite_border";
    		  likeBtnB.onclick = () => {likeOn(userNo, commNo)};
    		  likeBtnB.id = "likeBtnBorder"+commNo;
    		  
    	  })
      }
    </script>
    <script>
    $(function(){
		var num = "";
		$(document).ready(function() {
    		$('#myModal').on('show.bs.modal', function(event){
    			num = $(event.relatedTarget).data('num');
    			no = $(event.relatedTarget).data('no');
    			
    		});
    	});
    	$("#call").click(function(){
        	call();
        });
   	  	function call(){
   		  $.ajax({
   			  url:"callInsert.ad",
   			  type:"POST",
   			  data:{reqCateNo:$("#reqCateNo").val(),
   				  reqContent:$("#reqContent").val(),
   				  reqNum:num,
   				  rfromNo:3},
   			  success:function(result){
   				  alert("신고가 완료 되었습니다.");
   				  location.reload();
   			  },error:function(){
   				  alert("신고가 실패 되었습니다.");
   			  }
   		  })
   	  }
          
    });
    </script>

</body>
</html>

</body>
</html>