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
          <h2>COMMUNITY</h2>
        </div>

        <div class="editC__content">
          <form action="update.cm" method="post" enctype="multipart/form-data">          
            <input type="text" value="${ loginUser.userNo }" name="userNo" hidden />
            <input type="text" value="${ c.commNo }" name="commNo" hidden />
            <input type="text" value="${ c.commOriginSrc }" name="commOriginSrc" hidden />
            <input type="text" value="${ c.commChangeSrc }" name="commChangeSrc" hidden />
            <div class="con-wrapper">
              <div>
                <p>CATEGORY</p>
                <div class="cate-btn">
                  <ul>
                    <li>
                      <button
                        type="button"
                        onclick="cateSelect(1);"
                        id="cate-1"
                        class="btn btn-gray"
                      >
                       	맥심의 일상
                      </button>
                    </li>
                    <li>
                      <button
                        type="button"
                        onclick="cateSelect(2);"
                        id="cate-2"
                        class="btn"
                      >
                       	오늘의 맥주
                      </button>
                    </li>
                  </ul>
                  <input id="cate-label" type="text" name="commCate" value="0" hidden required/>
                </div>
              </div>
              <div>
                <p>CONTENT</p>
                <div class="textarea-wrapper">
                  <textarea id="content-input" placeholder="내용을 입력해주세요" name="commContent" maxlength="180" required>${ c.commContent }</textarea>
                  <span><b id="content-length">0</b>/180자</span>
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
    const btn1 = document.querySelector("#cate-1");
    const btn2 = document.querySelector("#cate-2");
    const selectedBtn = document.querySelector("#cate-label");

    const hiddenBtn = document.querySelector("#hiddenBtn");
    const fileBtn = document.querySelector("#fileBtn");
    const fileLabel = document.querySelector("#fileLabel");
    const fileImg = document.querySelector("#fileImg");
    
    const cateSelect = (num) => {
      if (num === 1) {
        btn2.classList.remove("btn-gray");
        btn1.classList.add("btn-gray");
        selectedBtn.value = "0";
      } else {
        btn1.classList.remove("btn-gray");
        btn2.classList.add("btn-gray");
        selectedBtn.value = "1";
      }
    };

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
    		
    		if(contentInput.value.length >= 180){
    			alert("최대 180자 까지 입력할 수 있습니다.");
    		}
    		document.querySelector("#content-length").innerText = contentInput.value.length;
    	});
    	
    }
    onChangeContent();
    
    
    // 페이지가 로딩된 직후 상태 설정해두기
    const pageSetting = () => {
    	
    	// 카테고리 상태 설정
    	if(${c.commCate} === 0){
            btn2.classList.remove("btn-gray");
            btn1.classList.add("btn-gray");
            selectedBtn.value = "0";
    	}else if(${c.commCate} === 1){
            btn1.classList.remove("btn-gray");
            btn2.classList.add("btn-gray");
            selectedBtn.value = "1";
    	}
    	
    	// 글자수 파악
    	document.querySelector("#content-length").innerText = 
    		document.querySelector("#content-input").value.length;
    	
    	// 사진 상태 설정
        fileLabel.innerHTML = "${ c.commChangeSrc }";
        fileImg.src = "resources/uploadFiles/${ c.commChangeSrc }";
    	
    }
    pageSetting();
    
</script>

</html>