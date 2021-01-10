<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>MACSIM</title>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js" integrity="sha512-bZS47S7sPOxkjU/4Bt0zrhEtWx0y0CRkhEp8IckzK+ltifIIE9EMIMTuT/mEzoIMewUINruDBIR/jJnbguonqQ==" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
	          <li class="forum__item">
	            <div class="img-wrapper" onclick="enterModalOpen(${f.forNo}, ${f.userNo}, '${f.forTitle}');">
	              <img src="resources/uploadFiles/${ f.forChangeSrc }" alt="picture" />
	            </div>
	            <div class="item-right">
	              <div class="item-info">
	                <div onclick="enterModalOpen(${f.forNo}, ${f.userNo}, '${f.forTitle}');">
	                  <strong>${ f.forTitle }</strong>
	                  <strong>${ f.userId }</strong>
	                </div>
	                <div>
	                  <c:choose>
	                    <c:when test="${ !empty loginUser && loginUser.userId eq f.userId }">
		                <!-- <span>수정</span>
		                  <span>삭제</span> -->  
		                </c:when>
		                <c:otherwise>
		                  <span><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal" data-num="${f.forNo}">신고</button></span>
		                </c:otherwise>
	                  </c:choose>
	                  <small onclick="enterModalOpen(${f.forNo}, ${f.userNo}, '${f.forTitle}');">${ f.forCreateDate }</small>
	                </div>
	              </div>
	              <div class="forum-contents" onclick="enterModalOpen(${f.forNo}, ${f.userNo}, '${f.forTitle}');">
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
    
    <!-- 입장 모달 -->
    <div id="enter-modal" class="modal__layout">
      <div id="enter-modal-box" class="modal__box">
        <h1 id="enter-modal-title"></h1>
        <span>최초 입장시 5포인트가 차감됩니다.<br>이후에는 자유롭게 이 포럼을 이용하실 수 있습니다.</span>

        <div class="modal__btn_wrapper">
          <button id="modal-enter-btn" type="button" class="btn">입장하기</button>
          <button type="button" onclick="enterModalClose();" class="btn">취소</button>
        </div>
      </div>
    </div>
    <div class="modal fade" id="myModal">
		<div class="modal-dialog">
		  <div class="modal-content">
		  
		    <!-- Modal Header -->
		  <div class="modal-header">
		    <h4 class="modal-title">신고하기</h4>
		    <button type="button" class="close" data-dismiss="modal">×</button>
		  </div>
		  
		  <div class="modal-body">
		  <form id="form1">
		    <h4>신고사유</h4>
		    <select id="reqCateNo" name="reqCateNo" style="width: 200px;">
		      <option value="1">욕설</option>
		      <option value="2">중복, 도배</option>
		      <option value="3">정치적 발언</option>
		      <option value="4">기타</option>
		    </select>
		    <br><br>
		    <h4>상세사유</h4>
		    <textarea name="reqContent" id="reqContent" cols="30" rows="10" style="width: 400px; height: 100; resize: none;"></textarea>
		  </form>
		  </div>
		  
		  <!-- Modal footer -->
		      <div class="modal-footer">
		        <button id="call" type="button" class="btn btn-primary" data-dismiss="modal">제출하기</button>
		        <button type="button" class="btn btn-danger" data-dismiss="modal">취소하기</button>
		      </div>
		      
		    </div>
		  </div>
		</div>

</body>
<script defer>
	// MODAL ------------------------
	
	// 입장모달 -----
	const enterModalOpen = (forNo, userNo, forTitle) => {
	  const enterBtn = document.querySelector("#modal-enter-btn");
	  enterBtn.onclick = () => {location.href="detail.fo?fno="+forNo+"&uno="+userNo};
	  document.querySelector("#enter-modal-title").innerText = forTitle + " 입장";
	  
	  document.querySelector("#enter-modal").classList.add("modal__active");
	};
	
	const enterModalClose = () => {
	  document.querySelector("#enter-modal").style.animation =
	    "fadeOut 0.4s ease-in-out forwards";
	  document.querySelector("#enter-modal-box").style.animation =
	    "slideDown 0.4s ease-in-out forwards";
	  setTimeout(() => {
	    document
	      .querySelector("#enter-modal")
	      .classList.remove("modal__active");
	
	    document.querySelector("#enter-modal").style.animation =
	      "fadeIn 0.4s ease-in-out forwards";
	    document.querySelector("#enter-modal-box").style.animation =
	      "slideUp 0.4s ease-in-out forwards";
	  }, 400);
	};
</script>
<script>
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
   			  url:"callInsert.ad",
   			  type:"POST",
   			  data:{reqCateNo:$("#reqCateNo").val(),
   				  reqContent:$("#reqContent").val(),
   				  reqNum:num,
   				  rfromNo:2},
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
</html>