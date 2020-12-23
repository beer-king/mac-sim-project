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
			rel="stylesheet"
			href="https://fonts.googleapis.com/icon?family=Material+Icons"
	/>
	<link
			rel="stylesheet"
			href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	/>
	<link rel="stylesheet" href="resources/css/header.css" />
	<link rel="stylesheet" href="resources/css/mainPage.css" />
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
        .dataview{
            background: white;
            width: 90%;
            height: px;
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
        
    </style>
</head>
<body>

<!-- header -->
<header>
	<jsp:include page="sideBar.jsp"/>

</header>

<!-- main -->
<main>
<div class="outer">
    <div class="content">
        <form id="enrollForm" method="post" action="insert.bo" enctype="multipart/form-data">
            <img id="titleImg" width="350" height="350">
            <br>
            <table align="center">
                <tr>
                    <th><label for="title">맥주 이름</label></th>
                    <td><input type="text" id="title" class="form-control" name="boardTitle" required></td>
                </tr>
                <tr>
                    <th><label for="writer">맥주 영어 이름</label></th>
                    <td><input type="text" id="writer" class="form-control" name="boardWriter" required></td>
                </tr>
                <tr>
                    <th><label for="writer">맥주 분류</label></th>
                    <td><input type="text" id="writer" class="form-control" name="boardWriter" required></td>
                </tr>
                <tr>
                    <th><label for="writer">맥주 생산지</label></th>
                    <td><input type="text" id="writer" class="form-control" name="boardWriter" required></td>
                </tr>
                <tr>
                    <th><label for="writer">맥주 생산자</label></th>
                    <td><input type="text" id="writer" class="form-control" name="boardWriter" required></td>
                </tr>
                <tr>
                    <th><label for="writer">도수</label></th>
                    <td><input type="text" id="writer" class="form-control" name="boardWriter" required></td>
                </tr>
                <tr>
                    <th><label for="writer">병/캔 분류</label></th>
                    <td><input type="text" id="writer" class="form-control" name="boardWriter" required></td>
                </tr>
            </table>
            <br>
            <div align="center">
                <div>유저명 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 부여포인트</div>
                <div><input type="text" id="writer" class="form-control" name="boardWriter" required>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" id="writer" class="form-control" name="boardWriter" required></div>
            </div>

            <div align="right">
                <button type="submit" class="btn btn-primary">등록하기</button>
                <button type="reset" class="btn btn-danger">취소하기</button>
            </div>
        </form>
    </div>
    
    <div class="menu">
        <div id="name1">맥주 등록 관리</div>
        <br>
        <div id="name2">맥주 수정 관리</div>
        <br>
    </div>
</div>
</main>

<footer></footer>
</body>
</html>