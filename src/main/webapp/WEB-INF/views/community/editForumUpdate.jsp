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
<link rel="stylesheet" href="resources/css/community/editComm.css" />
</head>
<body>

	<!-- header -->
	<jsp:include page="../common/header.jsp"/>

    <!-- main -->
    <main>
      <div class="inner">
        <div class="editC__header">
          <h1>EDIT PAGE</h1>
          <h2>FORUM</h2>
        </div>

        <div class="editC__content editF__content">
          <form action="update.fo" method="post" enctype="multipart/form-data">
            <input type="text" value="${ loginUser.userNo }" name="userNo" hidden />
            <input type="text" value="${ f.forNo }" name="forNo" hidden />
            <input type="text" value="${ f.forOriginSrc }" name="forOriginSrc" hidden />
            <input type="text" value="${ f.forChangeSrc }" name="forChangeSrc" hidden />
            <div class="con-wrapper">
              <div>
                <p>TITLE</p>
                <div class="title-wrapper">
                  <input type="text" placeholder="포럼의 이름을 입력해주세요" value="${ f.forTitle }" name="forTitle" required />
                </div>
              </div>
              <div>
                <p>INFO</p>
                <div class="textarea-wrapper">
                  <textarea id="content-input" placeholder="포럼 소개글을 입력해주세요" name="forInfo" maxlength="40" required>${ f.forInfo }</textarea>
                  <span><b id="content-length">0</b>/40자</span>
                </div>
              </div>
              <div>
                <p>IMAGE</p>
                <div class="img-wrapper">
                  <div>
                    <input id="hiddenBtn" type="file" name="upfile" hidden />
                    <label id="fileLabel"></label>
                    <button
                      id="fileBtn"
                      class="btn btn-gray btn-small"
                      type="button"
                    >
                      FILE
                    </button>
                  </div>
                  <div class="real-img">
                    <img
                      id="fileImg"
                      src=""
                      alt="사진을 새로 선택하지 않을시, 자동으로 기존 이미지가 등록됩니다."
                    />
                  </div>
                </div>
              </div>
            </div>

            <!-- 작성 버튼 -->
            <div class="btn-wrapper">
              <button class="btn btn-lightgray btn-bold" type="button" onclick="history.back()">
                               작성취소
              </button>
              <button class="btn btn-yellow btn-bold" type="submit">
               	작성하기
              </button>
            </div>
          </form>
        </div>
      </div>
    </main>
</body>
<script defer>
	const hiddenBtn = document.querySelector("#hiddenBtn");
	const fileBtn = document.querySelector("#fileBtn");
	const fileLabel = document.querySelector("#fileLabel");
	const fileImg = document.querySelector("#fileImg");

    fileBtn.addEventListener("click", () => {
      hiddenBtn.click();
    });
    fileLabel.addEventListener("click", () => {
      hiddenBtn.click();
    });
    fileImg.addEventListener("click", () => {
      hiddenBtn.click();
    });
    hiddenBtn.addEventListener("change", (e) => {
      var startIndex =
        e.target.value.indexOf("\\") >= 0
          ? e.target.value.lastIndexOf("\\")
          : e.target.value.lastIndexOf("/");
      var filename = e.target.value.substring(startIndex);
      if (filename.indexOf("\\") === 0 || filename.indexOf("/") === 0) {
        filename = filename.substring(1);
      }

      // console.log("변화!");
      fileLabel.innerHTML = filename;

      if (e.target.files.length == 1) {
        const reader = new FileReader();

        reader.readAsDataURL(e.target.files[0]);
        reader.onload = (ee) => {
          fileImg.setAttribute("src", ee.target.result);
        };
      } else {
        fileImg.setAttribute("src", null);
      }

      fileImg.value = e.target.value;
    });
    
    // 글자수
    const onChangeContent = () => {
    	
    	const contentInput = document.querySelector("#content-input");
    	
    	contentInput.addEventListener("input", () => {
    		
    		if(contentInput.value.length >= 40){
    			alert("최대 40자 까지 입력할 수 있습니다.");
    		}
    		document.querySelector("#content-length").innerText = contentInput.value.length;
    	});
    	
    }
    onChangeContent();
    
    
    // 페이지가 로딩된 직후 상태 설정해두기
    const pageSetting = () => {
    	
    	// 글자수 파악
    	document.querySelector("#content-length").innerText = 
    		document.querySelector("#content-input").value.length;
    	
    	// 사진 상태 설정
        fileLabel.innerHTML = "${ f.forChangeSrc }";
        fileImg.src = "resources/uploadFiles/${ f.forChangeSrc }";
    	
    }
    pageSetting();
    
</script>
</html>