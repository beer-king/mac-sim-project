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
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js" integrity="sha512-bZS47S7sPOxkjU/4Bt0zrhEtWx0y0CRkhEp8IckzK+ltifIIE9EMIMTuT/mEzoIMewUINruDBIR/jJnbguonqQ==" crossorigin="anonymous"></script>
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
	                  <span onclick="location.href='updateForm.fo?forNo=${fo.forNo}'">수정</span>
	                  <span onclick="location.href='delete.fo?forNo=${fo.forNo}'">삭제</span>
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
                <button type="button" onclick="replyInsert(${fo.forNo});">등록</button>
              </div>
            </div>
            
            <!-- 댓글 -->
            <ul class="fode__co-items" id="comment-top-wrapper">
              
              <c:forEach var="r" items="${ rpList }">
	              <li class="co-contents comment-box${r.coNo}">
	                <div class="fode__co-info">
	                  <p onclick="replyTo('${ r.userId }', ${ r.coNo });">${ r.userId }</p>
	                  <div>
	                    <c:choose>
	                      <c:when test="${ loginUser.userNo eq r.userNo }">
		                    <span onclick="updateModalOpen('${ r.coNo }', 0, '${ r.coContent }');">수정</span>
		                    <span onclick="deleteModalOpen('${ r.coNo }', 0);">삭제</span>
	                      </c:when>
	                      <c:otherwise>
	                    	<span>신고</span>
	                      </c:otherwise>
	                    </c:choose>
	                    <small>${ r.coCreateDate }</small>
	                  </div>
	                </div>
	                <div class="fode__co-con comment-content${r.coNo}">${ r.coContent }</div>
	                
	                
	                <!-- 대댓글 -->
	                <ul class="fode__re-items" id="re-comment-top-wrapper${r.coNo}">
	                
	                  <c:forEach var="sr" items="${ r.subReply }">
		                  <li class="co-contents recomment-box${sr.recoNo}">
		                    <div class="fode__co-info">
		                      <p>${ sr.userId }</p>
		                      <div>
		                        <c:choose>
		                          <c:when test="${ loginUser.userNo eq sr.userNo }">
			                        <span onclick="updateModalOpen('${ sr.recoNo }', 1, '${ sr.recoContent }');">수정</span>
			                        <span onclick="deleteModalOpen('${ sr.recoNo }', 1);">삭제</span>
			                      </c:when>
			                      <c:otherwise>
			                        <span>신고</span>
			                      </c:otherwise>
		                        </c:choose>
		                        <small>${ sr.recoCreateDate }</small>
		                      </div>
		                    </div>
		                    <div class="fode__co-con recomment-content${sr.recoNo}">${ sr.recoContent }</div>
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

    <!-- 삭제 모달 -->
    <div id="delete-modal" class="modal__layout">
      <div id="delete-modal-box" class="modal__box">
        <h1>삭제</h1>
        <span>정말로 삭제하시겠습니까?</span>

        <div class="modal__btn_wrapper">
          <button type="button" onclick="deleteComment();" class="btn">확인</button>
          <button type="button" onclick="deleteModalClose();" class="btn">취소</button>
        </div>
      </div>
    </div>
    
    <!-- 수정 모달 -->
    <div id="update-modal" class="modal__layout">
      <div id="update-modal-box" class="modal__box">
        <h1>수정</h1>
        <span>내용</span>
        <textarea id="update-content" value="" name="coContent" ></textarea>

        <div class="modal__btn_wrapper">
          <button type="button" onclick="updateComment();" class="btn">확인</button>
          <button type="button" onclick="updateModalClose();" class="btn">취소</button>
        </div>
      </div>
    </div>

</body>

<script defer>
  // MODAL ------------------------
  let modalCoNo = 0;
  let isComm = 0;

  // 삭제모달 -----
  const deleteModalOpen = (coNo, isComs) => {
	modalCoNo = coNo;
	isComm = isComs;
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

  const deleteComment = () => {
	  console.log(isComm, "삭제시작");
	  if(isComm === 0){
		  axios.get("replyDelete.fo", {
			  params:{
				  coNo:modalCoNo,
			  }
		  }).then((res) => {
			  document.querySelector(".comment-box"+modalCoNo).remove();
			  deleteModalClose();
		  })
	  }else if(isComm === 1){
		  axios.get("subReplyDelete.fo", {
			  params:{
				  coNo:modalCoNo,
			  }
		  }).then((res) => {
			  document.querySelector(".recomment-box"+modalCoNo).remove();
			  deleteModalClose();
		  })
	  }
  }
  
  // 수정모달 -----
  const updateContent = document.querySelector("#update-content");
  
  const updateModalOpen = (coNo, isComs, coContent) => {
	isComm = isComs;
	modalCoNo = coNo; 
	updateContent.value = coContent;
	document.querySelector("#update-modal").classList.add("modal__active");
  };
  const updateModalClose = () => {
	    document.querySelector("#update-modal").style.animation =
	      "fadeOut 0.4s ease-in-out forwards";
	    document.querySelector("#update-modal-box").style.animation =
	      "slideDown 0.4s ease-in-out forwards";
	    setTimeout(() => {
	      document
	        .querySelector("#update-modal")
	        .classList.remove("modal__active");

	      document.querySelector("#update-modal").style.animation =
	        "fadeIn 0.4s ease-in-out forwards";
	      document.querySelector("#update-modal-box").style.animation =
	        "slideUp 0.4s ease-in-out forwards";
	    }, 400);
	  };

  const updateComment = () => {
	  console.log(isComm, "업데이트시작");
	  if(isComm === 0){
		  axios.get("replyUpdate.fo", {
			  params:{
				  coNo:modalCoNo,
				  coContent:updateContent.value,
			  }
		  }).then((res) => {
			  //console.log(res.data);
			  document.querySelector(".comment-content"+modalCoNo).innerText = updateContent.value;
			  updateModalClose();
		  })
	  }else if(isComm === 1){
		  axios.get("subReplyUpdate.fo", {
			  params:{
				  coNo:modalCoNo,
				  coContent:updateContent.value				  
			  }
		  }).then((res) => {
			  document.querySelector(".recomment-content"+modalCoNo).innerText = updateContent.value;
			  updateModalClose();
		  })
	  }
  }
  
  
  // 대댓글 작성 하려고 막 클릭 막 그랬어 --------------
  const coTitle = document.querySelector("#comment-box");
  const replyTo = (userId, coNo) => {
    //   console.log(userId);
    coTitle.innerHTML =
      "대댓글 작성 <b>@</b><b id='sub-reply-id'>" +
      userId +
      "</b><b id='sub-reply-cono' hidden>" +
      coNo + 
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
  
  
  // 포럼 댓글 추가된거 화면에 뿌려주기
  const createReplyTag = (v) => {
	console.log(v);
	  
    const commentBox = document.createElement('li');
      commentBox.classList.add('co-contents');
      commentBox.classList.add('comment-box'+v.coNo);
	    
	const commentInfo = document.createElement('div');
	  commentInfo.className = 'fode__co-info';
	  
	const userIdTag = document.createElement('p');
      userIdTag.onclick = () => {replyTo(v.userId, v.coNo)};
      userIdTag.innerText = v.userId;
    
    const selectBtn = document.createElement('div');
      if('${loginUser.userNo}' === v.userNo+''){
        const updateBtn = document.createElement('span');
          updateBtn.onclick = () => {updateModalOpen(v.coNo, 0, v.coContent)};
          updateBtn.innerText = "수정";
          selectBtn.appendChild(updateBtn);
        const deleteBtn = document.createElement('span');
          deleteBtn.onclick = () => {deleteModalOpen(v.coNo, 0)};
          deleteBtn.innerText = "삭제";
          selectBtn.appendChild(deleteBtn);
      }else{
        const reportBtn = document.createElement('span');
          reportBtn.innerText = "신고";
          selectBtn.appendChild(reportBtn);
      }
    
    const dateTag = document.createElement('small');
      dateTag.innerText = v.coCreateDate;
    
    const contentBox = document.createElement('div');
      contentBox.classList.add('fode__co-con');
      contentBox.classList.add('comment-content'+v.coNo);
      contentBox.innerText = v.coContent;
      
    const recommentBox = document.createElement('ul');
      recommentBox.classList.add('fode__re-items');
      recommentBox.id = "re-comment-top-wrapper"+v.coNo;
      
    // 추가추가
    commentInfo.appendChild(userIdTag);
    commentInfo.appendChild(selectBtn);

    commentBox.appendChild(commentInfo);
    commentBox.appendChild(contentBox);
    commentBox.appendChild(recommentBox);

    const commentWrapper = document.querySelector("#comment-top-wrapper");
      commentWrapper.prepend(commentBox);
  }
  
  // 포럼 대댓글 추가된거 화면에 뿌려주기
  const createSubReplyTag = (v) => {
	console.log(v);
	  
    const commentBox = document.createElement('li');
      commentBox.classList.add('co-contents');
      commentBox.classList.add('recomment-box'+v.recoNo);
	    
	const commentInfo = document.createElement('div');
	  commentInfo.className = 'fode__co-info';
	  
	const userIdTag = document.createElement('p');
      userIdTag.innerText = v.userId;
    
    const selectBtn = document.createElement('div');
      if('${loginUser.userNo}' === v.userNo+''){
        const updateBtn = document.createElement('span');
          updateBtn.onclick = () => {updateModalOpen(v.recoNo, 1, v.recoContent)};
          updateBtn.innerText = "수정";
          selectBtn.appendChild(updateBtn);
        const deleteBtn = document.createElement('span');
          deleteBtn.onclick = () => {deleteModalOpen(v.recoNo, 1)};
          deleteBtn.innerText = "삭제";
          selectBtn.appendChild(deleteBtn);
      }else{
        const reportBtn = document.createElement('span');
          reportBtn.innerText = "신고";
          selectBtn.appendChild(reportBtn);
      }
    
    const dateTag = document.createElement('small');
      dateTag.innerText = v.recoCreateDate;
    
    const contentBox = document.createElement('div');
      contentBox.classList.add('fode__co-con');
      contentBox.classList.add('recomment-content'+v.recoNo);
      contentBox.innerText = v.recoContent;
      
    // 추가추가
    selectBtn.appendChild(dateTag);

    commentInfo.appendChild(userIdTag);
    commentInfo.appendChild(selectBtn);

    commentBox.appendChild(commentInfo);
    commentBox.appendChild(contentBox);

    const commentWrapper = document.querySelector("#re-comment-top-wrapper"+v.coNo);
      commentWrapper.prepend(commentBox);
  }
  
  // 댓글/대댓글 작성
  const replyInsert = (forNo) => {
	  
	  const inputContent = document.querySelector("#co-input-box");
	  const supId = document.querySelector("#sub-reply-id");
	  //console.log(supId.innerText);
	  
	  console.log(supId, "추가시작");
	  if(supId === null){ // 댓글 추가
		  
		  axios.get("replyInsert.fo", {
			  params:{
				  fno:forNo,
				  coContent:inputContent.value,
			  }
		  }).then((res) => {
			  console.log("추가됨");
			  if(res.data){
				  const data = res.data[0];
				  //alert('댓글등록 성공!');
				  
				  // 본격적으로 추가를 해보자!!
				  createReplyTag(data);
				  inputContent.value = "";
				  
			  }else{
				  alert('댓글 등록 실패');
			  }
			  
		  })
		  
	  }else if(supId !== null){ // 대댓글 추가
		  
		  const subReplyCoNo = document.querySelector("#sub-reply-cono");
		  
		  axios.get("subReplyInsert.fo", {
			  params:{
				  fno:forNo,
				  cno:subReplyCoNo.innerText,
				  sId:supId.innerText,
				  coContent:inputContent.value,			  
			  }
		  }).then((res) => {
			  console.log("추가됨");
			  
			  if(res.data){
				  const data = res.data[0];
	
				  // 아아으아 또해보자!!
				  createSubReplyTag(data);
				  inputContent.value = "";
				  
			  }else{
				  alert('댓글 등록 실패');
			  }
			  
		  })
		  
	  }
	  
  }
  
</script>

</html>