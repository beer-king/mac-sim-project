<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
    </style>
</head>
<body>
	<div class="inner">
		<c:if test="${loginUser.status eq 3}">
			<span class="openmenu" onclick='openNav()'>></span>
		</c:if>
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
		<c:choose>
			<c:when test="${empty loginUser}">
				<ul class="header__nav">
					<li><a href="agreeForm.me">회원가입</a></li>
					<li><a href="loginForm.me">로그인</a></li>
				</ul>
			</c:when>
			<c:when test="${!empty loginUser}">
				<ul class="header__nav">
					<li><a href="mypage.me">마이페이지</a></li>
					<li><a href="logout.me">로그아웃</a></li>
				</ul>
			</c:when>
		</c:choose>
		</div>
	</div>
	<c:if test="${loginUser.status eq 3}">
		<div id="mysidenav" class="sidenav">
			<a href="#" class="closebtn" onclick='closeNav()'><</a>
			<a href="callAd.ad">신고관리</a>
			<br>
			<a href="beerAd.ad">맥주관리</a>
			<br>
			<a href="#">공구관리</a>
			<br>
			<a href="#">이벤트관리</a>
			<br>
			<a href="noticeAd.ad">공지사항관리</a>
			<br>
		</div>
		<script>
			function openNav() {
				console.log(${loginUser.status})
				document.getElementById('mysidenav').style.display = 'block';
			}
			function closeNav() {
				document.getElementById('mysidenav').style.display = 'none';
			}
		</script>
	</c:if>
</body>
</html>