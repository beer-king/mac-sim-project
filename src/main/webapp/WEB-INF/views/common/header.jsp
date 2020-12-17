<%--
  Created by IntelliJ IDEA.
  User: chois
  Date: 2020-12-15
  Time: 오후 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
</head>
<body>
<!-- header -->
<header>
    <div class="inner">
        <div class="header__left">
            <a class="header__logo" href="/macSim">
                <img src="resources/images/macsimXy.png" alt="logo"
                /></a>
            <span class="div-line"></span>
            <ul class="header__nav">
                <li><a href="#">맥주검색</a></li>
                <li><a href="#">커뮤니티</a></li>
                <li><a href="#">이벤트</a></li>
                <li><a href="#">공동구매</a></li>
                <li><a href="#">공지사항</a></li>
            </ul>
        </div>
        <div class="header__right">
            <div class="nav__searchbox">
                <input type="text" />
                <i><span class="material-icons"> search </span></i>
            </div>
            <ul class="header__nav">
                <li><a href="agreeForm.me">회원가입</a></li>
                <li><a href="loginForm.me">로그인</a></li>
            </ul>
        </div>
    </div>
</header>

<!-- main -->
<main>
    <div class="inner"></div>
</main>


</body>
</html>
