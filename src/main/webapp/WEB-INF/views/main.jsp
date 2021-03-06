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
    </style>
</head>
<body>

	<c:if test="${!empty alertMsg}">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	<script>
		<c:if test="${a eq null}">
			(() => {
				console.log("!!!!");
				location.href="main.load";
			})()
		</c:if>
	</script>
	
<!-- header -->
<header>


	<div class="inner">
		<c:if test="${loginUser.status eq 3}">
			<span class="openmenu" onclick='openNav()'>></span>
		</c:if>
		<div class="header__left">
			<a class="header__logo" href="#">
				<img src="resources/images/macsimXy.png" alt="logo"
				/></a>
			<span class="div-line"></span>
			<ul class="header__nav">
				<li><a href="beers.db">맥주검색</a></li>
				<li><a href="list.cm">커뮤니티</a></li>
				<li><a href="list.ev">이벤트</a></li>
				<li><a href="list.gb">공동구매</a></li>
				<li><a href="list.no">공지사항</a></li>
			</ul>
		</div>
		<div class="header__right">
			<div class="nav__searchbox">
				<input type="text" />
				<i><span class="material-icons"> search </span></i>
			</div>
		<c:choose>
			<c:when test="${empty loginUser && userId eq null}">
				<ul class="header__nav">
					<li><a href="agreeForm.me">회원가입</a></li>
					<li><a href="loginForm.me">로그인</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="header__nav">
					<label style="color:white;">${loginUser.userName }님 환영합니다</label>
					<li><a href="mypage.me">마이페이지</a></li>
					<li><a href="logout.me">로그아웃</a></li>
					<!-- <li><a href="kakaologout.do">카카오로그아웃</a></li>-->
				</ul>
			</c:otherwise>
		</c:choose>
		<!--  
		<c:if test="${userId ne null }">
			<label>로그인 성공입니다.</label>
			<input type="button" value="로그아웃" onclick="location.href='kakaologout.do'">
		</c:if>	
		-->	
		</div>
	</div>
	<c:if test="${loginUser.status eq 3}">
		<div id="mysidenav" class="sidenav">
			<a href="#" class="closebtn" onclick='closeNav()'><</a>
			<a href="callAd.ad">신고관리</a>
			<br>
			<a href="beerAd.ad">맥주관리</a>
			<br>
			<a href="GB.ad">공구관리</a>
			<br>
			<a href="eventAd.ad">이벤트관리</a>
			<br>
			<a href="noticeAd.ad">공지사항관리</a>
			<br>
		</div>
	
		<script>
			function openNav() {
				document.getElementById('mysidenav').style.display = 'block';
			}
			function closeNav() {
				document.getElementById('mysidenav').style.display = 'none';
			}
		</script>
	</c:if>
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
						<img class="recom__img" src="${ to.changeName }" alt="beer" />
						<div>
							<span class="recom__title">${ to.beerName }</span>
							<span class="recom__desc"
							>
							* ${ to.alcohol }<br>
							* ${ to.beerStyle }<br>
							* ${ to.beerLocation }
							</span
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
					<li onclick="location.href='list.cm?cate=0'">
						<button>
							COMMUNITY<i
						><span class="material-icons"> chevron_right </span></i
						>
						</button>
					</li>
					<li onclick="openRank();">
						<button>
							RANK<i><span class="material-icons"> expand_more </span></i>
						</button>
					</li>
				</ul>
			</div>
		</div>
		<div class="main__bottom" id="bottomRank" style="display:none;">
			<p>맥심의 맥주 순위</p>
			<h2 class="main__title">BEER OF HONER</h2>
			<div class="bottom__middle">
				<div class="middle__left">
					<ul>
						<li>
                  <span class="rank__first-icon">1</span
				  ><span class="rank__first-name">${ rList[0].beerName }</span>
						</li>
						<li><span>2</span><span>${ rList[1].beerName }</span></li>
						<li><span>3</span><span>${ rList[2].beerName }</span></li>
						<li><span>4</span><span>${ rList[3].beerName }</span></li>
						<li><span>5</span><span>${ rList[4].beerName }</span></li>
					</ul>
				</div>
				<div class="middle__right">
					<ul>
						<li>
							<img
									class="rank__beer-img"
									src="${ rList[0].changeName }"
									alt="winner-beer"
							/>
						</li>
						<li class="rank__beer-desc">
							* ${ rList[0].alcohol }<br>
							* ${ rList[0].beerStyle }<br>
							* ${ rList[0].beerLocation }
						</li>
						<li class="rank__beer-score">
							<div>
								<i><span class="material-icons"> grade </span></i>
								<span>&nbsp;&nbsp;${ rList[0].scoreTotal }점</span>
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
									src="${ mRank.changeName }"
									alt="men's beer"
							/>
						</li>
						<li class="bottom__name">
							<i class="fas fa-crown"></i> ${ mRank.beerName }
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
									src="${ fRank.changeName }"
									alt="women's beer"
							/>
						</li>
						<li class="bottom__name">
							<i class="fas fa-crown"></i> ${ fRank.beerName }
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

<script defer>
	
	const openRank = () => {
		bottomRank.style.display = "block";
	}

</script>

</body>
</html>