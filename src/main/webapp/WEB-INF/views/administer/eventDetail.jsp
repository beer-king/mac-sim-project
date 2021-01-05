<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MACSIM</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	<link
			rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
			integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
			crossorigin="anonymous"
	/>
	<link
			rel="stylesheet"
			href="https://fonts.googleapis.com/icon?family=Material+Icons"
	/>
	<link
			rel="stylesheet"
			href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	/>
	<link rel="stylesheet" href="resources/css/header.css" />
	<link rel="stylesheet" href="resources/css/mainPage.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
		.sidenav {
			height:100%;
			width: 250px;
			position: fixed;
			z-index:1;
			top: 0;
			left: 0;
			background-color:  rgb(43,39,36);
			overflow-x: hidden;
			transition:0.5s ease-in-out;
			padding-top: 60px;
            display: none;
		}
		.sidenav a {
			padding: 8px 8px 8px 32px;
			text-decoration: none;
			font-size: 25px;
			color: white;
			display: block;
			transition: 0.2s ease-in-out;
		}
		.sidenav a:hover, .offcanvas a:focus {
			color: rgb(236, 191, 46);
		}
		.closebtn {
			position: absolute;
			top: 0;
			right: 25px;
			font-size: 36px !important;
			margin-left: 50px;
		}
		.openmenu:hover {
			transition:0.5s ease-in-out;
			color: rgb(236, 191, 46);
		}
		.openmenu {
			font-size: 30px;
			cursor:pointer;
			transition:0.5s ease-in-out;
			color: white;
		}
		.openmenu > i {
			font-size: 30px;
		}
		.content{
			margin-top: 50px;
			margin-left: 200px;
            width: 60%;
            height: 500px;
            background: rgb(236, 191, 46);
            float: left;
        }
        .menu{
            margin-top: 50px;
            width: 20%;
            height: 200px;
            float: left;
        }
        .menu div{
            width: 150px;
            height: 40px;
            text-align: center;
            display:table-cell;
            vertical-align: middle;
            background: gray;
        }
        .menu div:hover{
            background: rgb(236, 191, 46);
            cursor: pointer;
        }
        .outer{
        	height: 600px;
            box-sizing: border-box;
        }
        
        #updateForm img{
            float: left;
            margin: 20px;
            margin-left: 40px;
        }
        #updateForm table{
            width: 50%;
            height: 360px;
        }
        #updateForm table *{
        	vertical-align: middle;
        }
        
    </style>
</head>
<body>

<!-- header -->
<header>
	<jsp:include page="sideBar.jsp"/>

</header>

<!-- main -->
<main>
<c:if test="${ !empty alertMsg }">
	<script>
		alertify.alert("${alertMsg}");
	</script>
	<c:remove var="alertMsg" scope="session"/>
</c:if>

<div class="outer">
    <div class="content">
        <form id="updateForm" method="post" action="updateEvent.ad" enctype="multipart/form-data">
            <img id="titleImg" src="${e.evThumb }" width="350" height="350">
            <br>
            <input type="hidden" name="evNo" value="${e.evNo }">
            <table align="center">
                <tr>
                    <th>제목</th>
                    <td>${e.evTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${e.userNo }</td>
                </tr>
                <tr>
                    <th>시음일</th>
                    <td>${e.evStartTime }</td>
                </tr>
                <tr>
                    <th>종료일</th>
                    <td>${e.evEndTime }</td>
                </tr>
                <tr>
                    <th>이벤트 내용</th>
                    <td><textarea cols="30" rows="10" style="width: 400px; height: 100; resize: none;" readonly>${e.evContent }</textarea></td>
                </tr>
            </table>
            <br>
           	<div class="modal fade" id="myModal2">
    			<div class="modal-dialog">
      			<div class="modal-content">
      
        		<!-- Modal body -->
        		<div class="modal-body">
          			<h3>해당 이유를 전송하겠습니까?</h3>
          			<br>
          			<textarea name="content" id="content" cols="30" rows="10" style="width: 400px; height: 100; resize: none;"></textarea>
          			<br><br>
          			<div align="right">
          			<button name="Astatus" type="submit" class="btn btn-primary" value="C">확인</button>
          			<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
          			<br>
          		</div>
        		</div>
      			</div>
    			</div>
  			</div>
            <div align="right">
                <button name="Astatus" type="submit" class="btn btn-primary" value="B">승인</button>
                <button type="button" data-toggle="modal" data-target="#myModal2" class="btn btn-primary" data-dismiss="modal">미승인</button>
                <button name="Astatus" type="submit"class="btn btn-danger" value="D">삭제</button>
            </div>
        </form>
   </div>
   
   

</div>
</main>

<footer></footer>
</body>
</html>