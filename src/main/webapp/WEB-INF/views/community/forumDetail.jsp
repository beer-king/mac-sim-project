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
<link
  rel="stylesheet"
  href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
/>
<!-- 
<link rel="stylesheet" href="./header.css" />
 -->
<link rel="stylesheet" href="resources/css/community/community.css" />
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

    <!-- main -->
    <main>
      <div class="inner">
        <div class="fode__header">
          <div>
            <h1>COMMUNITY</h1>
            <h2>FORUM</h2>
          </div>
          <a href="#">&lt; prev</a>
        </div>

        <!-- FORUM DETAIL BOX -->
        <ul class="comm__items">
          <li class="fode__info-wrapper">
            <div class="img-wrapper">
              <img src="resources/uploadFiles/${ fo.forChangeSrc }" alt="picture" />
            </div>
            <div class="fode__info-right">
              <div class="item-top">
                <p>${ fo.forTitle }</p>
                <div>
                  <c:choose>
                    <c:when test="${ !empty loginUser && loginUser.userId eq fo.userId }">
	                  <span>수정</span>
	                  <span>삭제</span>
	                </c:when>
	                <c:otherwise>
	                  <span>신고</span>
	                </c:otherwise>
                  </c:choose>
                  <small>${ fo.forCreateDate }</small>
                </div>
              </div>
              <div class="forum-contents">
                ${ fo.forInfo }
              </div>
              <div class="item-bottom">
                <div>
                  <span class="fas fa-crown"></span>
                  <span>${ fo.userId }</span>
                </div>
                <div>
                  <span>${ fo.forCount } views</span>
                  <span>${ fo.forComment } comments</span>
                </div>
              </div>
            </div>
          </li>
        </ul>

        <!-- FORUM DETAIL COMMENTS -->
        <div class="fode__comments">
          <h3 id="comment-top">COMMENTS</h3>
          <div>
            <div class="fode__addco-wrapper">
              <p id="comment-box">댓글 작성</p>
              <div class="fode__input-box">
                <input
                  id="co-input-box"
                  type="text"
                  placeholder="내용을 입력해주세요"
                />
                <button>등록</button>
              </div>
            </div>
            
            <!-- 댓글 -->
            <ul class="fode__co-items">
              
              <c:forEach var="r" items="${ rpList }">
	              <li class="co-contents">
	                <div class="fode__co-info">
	                  <p onclick="replayTo('${ r.userId }');">${ r.userId }</p>
	                  <div>
	                    <c:choose>
	                      <c:when test="${ loginUser.userNo eq r.userNo }">
		                    <span>수정</span>
		                    <span onclick="deleteModalOpen();">삭제</span>
	                      </c:when>
	                      <c:otherwise>
	                    	<span>신고</span>
	                      </c:otherwise>
	                    </c:choose>
	                    <small>${ r.coCreateDate }</small>
	                  </div>
	                </div>
	                <div class="fode__co-con">${ r.coContent }</div>
	                
	                
	                <!-- 대댓글 -->
	                <ul class="fode__re-items">
	                
	                  <c:forEach var="sr" items="${ r.subReply }">
		                  <li class="co-contents">
		                    <div class="fode__co-info">
		                      <p>${ sr.userId }</p>
		                      <div>
		                        <c:choose>
		                          <c:when test="${ loginUser.userNo eq sr.userNo }">
			                        <span>수정</span>
			                        <span>삭제</span>
			                      </c:when>
			                      <c:otherwise>
			                        <span>신고</span>
			                      </c:otherwise>
		                        </c:choose>
		                        <small>${ sr.recoCreateDate }</small>
		                      </div>
		                    </div>
		                    <div class="fode__co-con">${ sr.recoContent }</div>
		                  </li>
	                  </c:forEach>
	                  
	                </ul>
	                
	                
	              </li>
              </c:forEach>
              
            </ul>
          </div>
        </div>

        <!-- COMMENT PAGING -->
        <!-- <ul class="comm__paging">
          <li>&lt;</li>
          <li>1</li>
          <li class="paging-active">2</li>
          <li>3</li>
          <li>4</li>
          <li>&gt;</li>
        </ul> -->
      </div>
    </main>

    <!-- 모달 -->
    <div id="delete-modal" class="modal__layout">
      <div id="delete-modal-box" class="modal__box">
        <h1>삭제</h1>
        <span>정말로 삭제하시겠습니까?</span>
        <!-- <input type="text" /> -->
        <!-- <span>내용</span> -->
        <!-- <textarea name="" id=""></textarea> -->

        <div class="modal__btn_wrapper">
          <button class="btn">확인</button>
          <button onclick="deleteModalClose();" class="btn">취소</button>
        </div>
      </div>
    </div>

</body>

<script defer>
  // MODAL

  // const deleteModalToggle = () => {
  //   document.querySelector("#delete-modal").classList.toggle("modal__active");
  // };
  const deleteModalOpen = () => {
    document.querySelector("#delete-modal").classList.add("modal__active");
  };
  const deleteModalClose = () => {
    document.querySelector("#delete-modal").style.animation =
      "fadeOut 0.4s ease-in-out forwards";
    document.querySelector("#delete-modal-box").style.animation =
      "slideDown 0.4s ease-in-out forwards";
    setTimeout(() => {
      document
        .querySelector("#delete-modal")
        .classList.remove("modal__active");

      document.querySelector("#delete-modal").style.animation =
        "fadeIn 0.4s ease-in-out forwards";
      document.querySelector("#delete-modal-box").style.animation =
        "slideUp 0.4s ease-in-out forwards";
    }, 400);
  };
</script>

<script defer>
  const coTitle = document.querySelector("#comment-box");
  const replayTo = (userId) => {
    //   console.log(userId);
    coTitle.innerHTML =
      "대댓글 작성 <b>@" +
      userId +
      "</b><button class='cancle-reply-btn' onclick='cancleReply();'>x</button>";
    window.scrollTo(0, 420);
    // window.scrollTo("#comment-top");
    // window.scroll({ top: 420, left: 0, behavior: "smooth" });
    // location.href = "#comment-top";
    document.querySelector("#co-input-box").focus();
  };
  const cancleReply = () => {
    coTitle.innerHTML = "댓글작성";
  };
</script>

</html>