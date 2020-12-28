<%--
  Created by IntelliJ IDEA.
  User: chois
  Date: 2020-12-15
  Time: 오후 4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>마이페이지</title>
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

        #userTable{
            color:white;
            text-align: left;
            font-size: 20px;
            border:2px solid white;

        }

        #userTable a{
            color:white;
            text-decoration: none;
        }

        #userTable a:hover{
            color: rgb(236, 191, 46);
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

<body style="background-color: #191919;">

<jsp:include page="../common/header.jsp"/>
<br>
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


<table id="userTable">
    <tr>
        <td rowspan="2">
            <img src="resources/images/logo.png" alt="회원등록이미지" width="200">
        </td>
        <th>
            <p>${loginUser.userId}</p>
        </th>

    </tr>
    <tr>
        <th width="650">
            <p>${loginUser.userId} 님은 <a href="review.me">(${reviewCount})건의 리뷰</a>를 남겼고, <a href="event.me">(${eventCount})건의 이벤트신청</a>,<a href="group.me">(${groupCount})건의 공구신청</a> 중입니다.</p>
        </th>
    </tr>
</table>
</body>
</html>
