<%--
  Created by IntelliJ IDEA.
  User: chois
  Date: 2020-12-16
  Time: 오후 8:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>에러페이지</title>
    <style>

        #mypageMenu{
            list-style: none;
            color:white;
            display:flex;
            font-size: 20px;
            justify-content: space-around;
            align-items: center;
        }


        #mypageMenu a {
            text-decoration: none;
            color:white;
            padding:5px 10px;
        }

        #mypageMenu a:hover{
            color: rgb(236, 191, 46);
        }
    </style>
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
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<br>
<hr style="height:2px;border-width:0;color:white;background-color:white">

<div id="header">
    <ul id="mypageMenu">
        <li><a href="">정보수정</a></li>
        <li><a href="">나의리뷰</a></li>
        <li><a href="">포인트내역</a></li>
        <li><a href="">이벤트신청현황</a></li>
        <li><a href="">공구신청현황</a></li>
        <li><a href="">맥주신청현황</a></li>
        <li><a href="">나만의카테고리</a></li>
    </ul>
</div>

<hr style="height:2px;border-width:0;color:white;background-color:white">
<h1 align="center">${ errorMsg }</h1>
</body>
</html>
