<%--
  Created by IntelliJ IDEA.
  User: chois
  Date: 2020-12-16
  Time: 오전 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>포인트내역</title>
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

        }

        #mypageMenu a:hover{
            color: rgb(236, 191, 46);
        }

        #pointHistory{
            color:white;
        }
        #point{
            font-size: 18px;
            margin-left: 30px;
        }
    </style>

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
<jsp:include page="../common/header.jsp"/>

<hr style="height:2px;border-width:0;color:white;background-color:white">

<div id="header">
    <ul id="mypageMenu">
        <li><a href="update.me">정보수정</a></li>
        <li><a href="review.me">나의리뷰</a></li>
        <li><a href="point.me">포인트내역</a></li>
        <li><a href="event.me">이벤트신청현황</a></li>
        <li><a href="group.me">공구신청현황</a></li>
        <li><a href="beer.me">맥주신청현황</a></li>
        <li><a href="category.me">나만의카테고리</a></li>
    </ul>
</div>

<hr style="height:2px;border-width:0;color:white;background-color:white">

<br><br>

<div id="pointHistory">
    <h1 style="margin-left: 30px; color: rgb(236, 191, 46); font-size:30px">포인트 내역</h1>
    <h3 style="margin-left: 30px; font-size:20px">현재 보유 포인트 : <span id="nowPoint">${loginUser.point}</span></h3>
    <br>
    <ul id="point">
        <li>
            <span>2020-12-12</span>
            <span>적립</span>
            <span>회원가입</span>
            <span>100p</span>
        </li>
        <br>
        <li>
            <span>2020-12-12</span>
            <span>적립</span>
            <span>회원가입</span>
            <span>100p</span>
        </li>
        <br>
        <li>
            <span>2020-12-13</span>
            <span>차감</span>
            <span>이벤트신청</span>
            <span>-5p</span>
        </li>
        <br>
        <li>
            <span>2020-12-12</span>
            <span>적립</span>
            <span>회원가입</span>
            <span>100p</span>
        </li>
        <br>

    </ul>
</div>
</body>
</html>
