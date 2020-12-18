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
</head>
<body>

<!-- header -->
<header>

	<c:if test="${!empty alertMsg }">
	<script>
		alertify.alert("${alertMsg}");
	</script>
	<c:remove var="alertMsg" scope="session"/>
	</c:if>


	<div class="inner">
		<div class="header__left">
			<a class="header__logo" href="#">
				<img src="resources/images/macsimXy.png" alt="logo"
				/></a>
			<span class="div-line"></span>
			<ul class="header__nav">
				<li><a href="#">맥주검색</a></li>
				<li><a href="#">커뮤니티</a></li>
				<li><a href="list.ev">이벤트</a></li>
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
			<c:when test="${!empty loginUser}">
				<ul class="header__nav">
					<li><a href="agreeForm.me">회원가입</a></li>
					<li><a href="loginForm.me">로그인</a></li>
				</ul>
			</c:when>
			<c:when test="${empty loginUser}">
				<ul class="header__nav">
					<li><a href="mypage.me">마이페이지</a></li>
					<li><a href="logout.me">로그아웃</a></li>
				</ul>
			</c:when>
		</c:choose>
		</div>
	</div>
</header>

<!-- main -->
<main>
	<div class="inner">
		<!-- <img
          class="main__bg"
          src="./image/bottle-caps.png"
          alt="backgroundImage"
          width="300"
        /> -->
		<div class="main__top">
			<div class="main__top-left">
				<div class="logo">
					<img src="resources/images/logo_ch.png" alt="logo" width="200" />
					<span>맥주에 대한 심오한 생각</span>
				</div>
				<div class="main__search-box">
					<input type="text" placeholder="찾고있는 맥주가 있으신가요?" />
					<i><span class="material-icons"> search </span></i>
				</div>
				<div class="main__recom">
					<h2 class="main__title">Today's Recommendation</h2>
					<div class="recom__wrapper">
						<img class="recom__img" src="resources/images/heineken.png" alt="beer" />
						<div>
							<span class="recom__title">곰표맥주</span>
							<span class="recom__desc"
							>시원하고 맛있고 어떠어떠한 맥주입니다.
                    정보접ㅇ보정보정보정보접ㅇ보정보정보정보접ㅇ보정보정보</span
							>
							<a class="recom__more" href="#">이 맥주 보러가기 &Gt;</a>
						</div>
					</div>
				</div>
			</div>
			<div class="main__top-right">
				<ul class="right__nav">
					<li>
						<button>
							BEER<span class="material-icons"> chevron_right </span>
						</button>
					</li>
					<li>
						<button>
							COMMUNITY<i
						><span class="material-icons"> chevron_right </span></i
						>
						</button>
					</li>
					<li>
						<button>
							RANK<i><span class="material-icons"> expand_more </span></i>
						</button>
					</li>
				</ul>
			</div>
		</div>
		<div class="main__bottom">
			<p>맥심의 맥주 순위</p>
			<h2 class="main__title">BEER OF HONER</h2>
			<div class="bottom__middle">
				<div class="middle__left">
					<ul>
						<li>
                  <span class="rank__first-icon">1</span
				  ><span class="rank__first-name">곰표맥주</span>
						</li>
						<li><span>2</span><span>곰표맥주</span></li>
						<li><span>3</span><span>곰표맥주</span></li>
						<li><span>4</span><span>곰표맥주</span></li>
						<li><span>5</span><span>곰표맥주</span></li>
					</ul>
				</div>
				<div class="middle__right">
					<ul>
						<li>
							<img
									class="rank__beer-img"
									src="resources/images/heineken.png"
									alt="winner-beer"
							/>
						</li>
						<li class="rank__beer-desc">
							시원하고 맛있고 어떠어떠한 맥주입니다.
							정보접ㅇ보정보정보정보접ㅇ보정보정보정보접ㅇ보정보정보
						</li>
						<li class="rank__beer-score">
							<div>
								<i><span class="material-icons"> grade </span></i>
								<span>&nbsp;&nbsp;89점</span>
							</div>
							<a class="recom__more" href="#">이 맥주 보러가기 &Gt;</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="bottom__bottom">
				<div class="bottom__left">
					<ul>
						<li class="main__title">MEN's CHOICE</li>
						<li class="bottom__img">
							<img
									class="rank__beer-img"
									src="resources/images/heineken.png"
									alt="men's beer"
							/>
						</li>
						<li class="bottom__name">
							<i class="fas fa-crown"></i> 곰표맥주
						</li>
						<li>
							<a class="recom__more" href="#">이 맥주 보러가기 &Gt;</a>
						</li>
					</ul>
				</div>
				<div class="bottom__right">
					<ul>
						<li class="main__title">WOMEN's CHOICE</li>
						<li class="bottom__img">
							<img
									class="rank__beer-img"
									src="resources/images/heineken.png"
									alt="women's beer"
							/>
						</li>
						<li class="bottom__name">
							<i class="fas fa-crown"></i> 곰표맥주
						</li>
						<li>
							<a class="recom__more" href="#">이 맥주 보러가기 &Gt;</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</main>

<footer></footer>
</body>
</html>