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
        
        #enrollForm img{
            float: left;
            margin: 20px;
            margin-left: 40px;
        }
        #enrollForm table{
            width: 40%;
            height: 360px;
        }
        .data{
            border-collapse: separate;
            border-spacing: 20px;
            width: 100%;
        }
        .dataview {
            margin: 20px;
            background: white;
            text-align: center;
            
        }
        .dataview td{
            height: 40px;
            width: 200px;
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
       <form id="enrollForm" method="post" action="updateBeer.ad" enctype="multipart/form-data">
           <img id="titleImg" width="350" height="350" src="${b.changeName }">
           <input type="file" name="upfile" id="upfile" onchange="loadImg(this);">
           <br>
           <table align="center">
           	   <input type="hidden" value="${b.beerNo }" name="beerNo">
               <tr>
                   <th><label for="title">맥주 이름</label></th>
                   <td><input type="text" id="name" class="form-control" name="beerName" value="${b.beerName }" required></td>
               </tr>
               <tr>
                   <th><label for="eTitle">맥주 영어 이름</label></th>
                   <td><input type="text" id="eName" class="form-control" name="beerEname" value="${b.beerEname }" required></td>
               </tr>
               <tr>
                   <th><label for="style">맥주 분류</label></th>
                   <td><input type="text" id="style" class="form-control" name="beerStyle" value="${b.beerStyle }" required></td>
               </tr>
               <tr>
                   <th><label for="location">맥주 생산지</label></th>
                   <td><input type="text" id="location" class="form-control" name="beerLocation" value="${b.beerLocation }" required></td>
               </tr>
               <tr>
                   <th><label for="producer">맥주 생산자</label></th>
                   <td><input type="text" id="producer" class="form-control" name="beerProducer" value="${b.beerProducer }" required></td>
               </tr>
               <tr>
                   <th><label for="alcohol">도수</label></th>
                   <td><input type="text" id="alcohol" class="form-control" name="alcohol" value="${b.alcohol }" required></td>
               </tr>
               <tr>
                   <th><label for="container">병/캔 분류</label></th>
                   <td><input type="text" id="container" class="form-control" name="beerContainer" value="${b.beerContainer }" required></td>
               </tr>
               <tr>
                   <th><label for="container">유저 아이디</label></th>
                   <td><input type="text" id="userId" class="form-control" name="userId" required></td>
               </tr>
           </table>
           <br>
           <div align="right">
               <button type="submit" class="btn btn-primary">등록하기</button>
               <button type="reset" class="btn btn-danger">취소하기</button>
           </div>
       </form>
	</div>
	
    <script>
		$(function(){
			$("#upfile").hide();
			$("#titleImg").click(function(){
				$("#upfile").click();
			});
		});
		
		function loadImg(inputFile){
			if(inputFile.files.length){
				var reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function(e){
					$("#titleImg").attr("src", e.target.result);
				}
			}
		}
		function checkAlert(){
			alert("이미지를 넣어주세요.");
		}
	</script>
</div>
</main>

<footer></footer>
</body>
</html>