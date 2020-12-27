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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/header.css" />
	<link rel="stylesheet" href="resources/css/mainPage.css" />
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
        .table{
            margin-left: 30px;
            width: 90%;
        }
        .enrollForm {
            margin-right: 20px;
        }
        .table tbody tr:hover{
            background: gray;
            cursor: pointer;
        }
    	.table{
            border: 1px solid black;
            width: 800px;
            height: 300px;
        }
        .data{
            border-collapse: separate;
            border-spacing: 20px;
            width: 100%;
           
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
    	<br><br>
        <form action="updateNotice.ad" method="POST">
        	<input type="hidden" name ="userNo" value="${loginUser.userNo}">
        	<input type="hidden" name ="noticeNo" value="${n.noticeNo}">
            <table class="data" style="text-align: center;">
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="noticeTitle" style="width: 90%;" value="${n.noticeTitle }"required></td>
                </tr>
                <tr>
                    <th style="vertical-align: middle;">내용</th>
                    <td><textarea name="noticeContent" cols="30" rows="10" style="resize: none; width: 90%; height: 300px;" required>${n.noticeContent }</textarea></td>
                </tr>
            </table>
            <div align="right">
                <button type="submit">수정하기</button>
                <button type="reset">되돌리기</button>
            </div>
        </form>
    </div>
</div>
</main>

<footer></footer>
</body>
</html>