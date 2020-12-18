<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국내맥주검색</title>
<!-- Bootstrap4 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
<style>

    /* 검색필터 */
    .search-sec{
        /* background:rgb(255, 204, 0); */
        padding: 1rem;
    }
    .search-slt{
        display: block;
        width: 100%;
        font-size: 0.875rem;
        line-height: 1.5;
        color: #55595c;
        height: calc(3rem + 2px);
        border-radius:0;
    }
    .wrn-btn{
        width: 100%;
        background-color:rgb(255, 204, 0);
        font-size: 16px;
        font-weight: 400;
        height: calc(3rem + 2px); 
        border-radius:0;
    }
    

    /* 테이블 */
    .table{
        color: white;
        text-align:center;
        width: 70%;
        margin:auto;
    }

    /* 페이징바 */
    .pagination a {
        color: white;
        padding: 8px 16px;
        text-decoration: none;
        transition: background-color .3s;
        text-align:center;
    }

    .pagination a.active {
        background-color:rgb(255, 204, 0);
        color: white;
    }

    .pagination a:hover:not(.active) {
        background-color: #ddd;
    }
</style>
</head>
<body>

<jsp:include page="../common/header.jsp"/>
<br><br><br><br><br><br>

    <section class="search-sec">
        <div class="container">
            <form action="#" method="post" novalidate="novalidate">
                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12">    
                                <input type="text" class="form-control search-slt" placeholder="키워드 검색">
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <select class="form-control search-slt" id="exampleFormControlSelect1">
                                    <option selected>맥주스타일별</option>
                                    <option value="">골든 에일</option>
                                    <option value="">다크 에일</option>
                                    <option value="">둔켈</option>
                                    <option value="">라거</option>
                                    <option value="">바이젠</option>
                                    <option value="">베를리너 바이세</option>
                                    <option value="">벨지안 블론드</option>
                                    <option value="">벨지안 윗비어</option>
                                    <option value="">브라운 에일</option>
                                    <option value="">사워 에일</option>
                                    <option value="">세션비어</option>
                                    <option value="">세션 인디아 페일 에일</option>
                                    <option value="">세종</option>
                                    <option value="">스위트 스타우트</option>
                                    <option value="">스타우트</option>
                                    <option value="">아메리칸 블로드 에일</option>
                                    <option value="">아메리칸 인디아 페일 에일</option>
                                    <option value="">아이리시 스타우트</option>
                                    <option value="">에일</option>
                                    <option value="">앰버 라거</option>
                                    <option value="">위트비어</option>
                                    <option value="">인디아 페일 에일</option>
                                    <option value="">잉글리쉬 비터</option>
                                    <option value="">잉글리쉬 인디아 페일 에일</option>
                                    <option value="">페일 에일</option>
                                    <option value="">포터</option>
                                    <option value="">필스너</option>
                                    <option value="">할레스 라거</option>
                                    <option value="">화이트 에일</option>
                                </select>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <select class="form-control search-slt" id="exampleFormControlSelect2">
                                    <option selected>제조사별</option>
                                    <option value="">담주 브로이</option>
                                    <option value="">브루어리304</option>
                                    <option value="">세븐브로이맥주</option>
                                    <option value="">스쿼즈 브루어리</option>
                                    <option value="">안호이저 부시 인베브</option>
                                    <option value="">앰비션 브루어리</option>
                                    <option value="">장 앤 크래프트 브루어리</option>
                                    <option value="">제주맥주</option>
                                    <option value="">코리아크래프트브류어리</option>
                                    <option value="">크래프트 브로스</option>
                                    <option value="">플래티넘 크래프트 비어</option>
                                    <option value="">플레이그라운드 브루어리</option>
                                    <option value="">핸드앤몰트</option>
                                    <option value="">화수브루어리</option>
                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <select class="form-control search-slt" id="exampleFormControlSelect3">
                                    <option selected>지역별</option>
                                    <option value="">강원도</option>
                                    <option value="">강원도 횡성군</option>
                                    <option value="">고양시 일산서구</option>
                                    <option value="">남양주 화도읍 창현리</option>
                                    <option value="">대한민국</option>
                                    <option value="">울산시 남구</option>
                                    <option value="">전라남도 담양군</option>
                                    <option value="">전라북도</option>
                                    <option value="">전라남도 순창군</option>
                                    <option value="">제주도</option>
                                    <option value="">제주도 한림읍</option>
                                    <option value="">충청남도 아산시 음봉면</option>
                                    <option value="">충청북도 음성군</option>
                                    <option value="">충청북도 증평군</option>
                                </select>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <select class="form-control search-slt" id="exampleFormControlSelect4">
                                    <option selected>알콜도수별</option>
                                    <option value="">0.0 ~ 3.9</option>
                                    <option value="">4.0 ~ 4.9</option>
                                    <option value="">5.0 ~ 5.9</option>
                                    <option value="">6.0 ~ 6.9</option>
                                    <option value="">7.0 ~ 7.9</option>
                                    <option value="">8.0 ~ </option>
                                </select>                            
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <select class="form-control search-slt" id="exampleFormControlSelect5">
                                    <option selected>정렬기준</option>
                                    <option value="">평점순</option>
                                    <option value="">최신순</option>
                                </select>                            
                            </div>
                        </div><br>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12"></div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <button type="button" class="wrn-btn">Search</button>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12"></div>
                        </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <br><br><br><br>

	<h4>맥주리스트</h4>
    <!-- 맥주전체테이블 -->
    <table class="table">
        <tr>
            <td rowspan="3"><img src='resources/images/beers/말표.png' width='90'></td>
            <td>말표맥주</td>
            <td>Malpyo Dark Beer</td>
            <td rowspan="3">맥주점수</td>
        </tr>
        <tr>
            <td>스퀴즈 브루어어리</td>
            <td>강원도</td>
        </tr>
        <tr>
            <td>다크 에일</td>
            <td>캔</td>
        </tr>
        <tr>
            <td rowspan="3"><img src='resources/images/beers/파리의꿈.png' width='90'></td>
            <td>파리의 꿈</td>
            <td>Dreams of Paris</td>
            <td rowspan="3">맥주점수</td>
        </tr>
        <tr>
            <td>스퀴즈 브루어어리</td>
            <td>강원도</td>
        </tr>
        <tr>
            <td>세종</td>
            <td>케그</td>
        </tr>
        <tr>
            <td rowspan="3"><img src='resources/images/beers/말표.png' width='90'></td>
            <td>말표맥주</td>
            <td>Malpyo Dark Beer</td>
            <td rowspan="3">92</td>
        </tr>
        <tr>
            <td>스퀴즈 브루어어리</td>
            <td>강원도</td>
        </tr>
        <tr>
            <td>다크 에일</td>
            <td>캔</td>
        </tr>
        <tr>
            <td rowspan="3"><img src='resources/images/beers/파리의꿈.png' width='90'></td>
            <td>파리의 꿈</td>
            <td>Dreams of Paris</td>
            <td rowspan="3">맥주점수</td>
        </tr>
        <tr>
            <td>스퀴즈 브루어어리</td>
            <td>강원도</td>
        </tr>
        <tr>
            <td>세종</td>
            <td>케그</td>
        </tr>
    </table>
	<br><br><br>
	
    <!-- 페이징바 -->
    <div class="container" style="width:20%">
	    <div class="pagination">
	        <a href="#">&laquo;</a>
	        <a href="#">1</a>
	        <a class="active" href="#">2</a>
	        <a href="#">3</a>
	        <a href="#">4</a>
	        <a href="#">5</a>
	        <a href="#">6</a>
	        <a href="#">&raquo;</a>
	    </div>
    </div>
    
  	<br><br><br>
</body>
</html>