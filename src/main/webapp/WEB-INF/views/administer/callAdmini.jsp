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
            height: 700px;
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
        #name1{
            background: rgb(236, 191, 46);
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
        .outer{
        	height: 800px;
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
        <form action="test.do" method="POST">
            <table class="dataview">
                <tr>
                    <td rowspan="2" style="width: 40px;"><input type="checkbox" name="number" value="1"></td>
                    <td>이벤트 글 번호 : </td>
                    <td>번호값</td>
                    <td>이벤트 제목 : </td>
                    <td>제목값</td>
                </tr>
                <tr>
                    <td>신고 카테고리 : </td>
                    <td>신고값</td>
                </tr>
            </table>
            <table class="dataview">
                <tr>
                    <td rowspan="2" style="width: 40px;"><input type="checkbox" name="number" value="2"></td>
                    <td>이벤트 글 번호 : </td>
                    <td>번호값</td>
                    <td>이벤트 제목 : </td>
                    <td>제목값</td>
                </tr>
                <tr>
                    <td>신고 카테고리 : </td>
                    <td>신고값</td>
                </tr>
            </table>
            <div align=right>
            	<button type="submit">일괄처리</button>
            </div>
            
			
        </form>
    </div>
    
    <div class="menu">
        <div id="name1">이벤트 신고 관리</div>
        <br>
        <div id="name2">맥주 리뷰 신고 관리</div>
        <br>
        <div id="name3">포럼 신고 관리</div>
        <br>
        <div id="name4">신고된 유저 관리</div>
        <br>
    </div>
</div>
</main>

<footer></footer>
</body>
</html>