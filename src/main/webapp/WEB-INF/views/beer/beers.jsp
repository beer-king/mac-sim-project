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
            <form action="list.search" method="post" novalidate="novalidate">
                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12">    
                                <input type="text" class="form-control search-slt" name="keyword" id="keyword" placeholder="키워드 검색">
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <select class="form-control search-slt" id="exampleFormControlSelect1">
                                    <option >맥주스타일별</option>
                                    <option value="goldenAle" <c:if test="${condition eq 'goldenAle' }">selected</c:if>>골든 에일</option>
                                    <option value="darkAle" <c:if test="${condition eq 'darkAle' }">selected</c:if>>다크 에일</option>
                                    <option value="dunkel" <c:if test="${condition eq 'dunkel' }">selected</c:if>>둔켈</option>
                                    <option value="lager" <c:if test="${condition eq 'lager' }">selected</c:if>>라거</option>
                                    <option value="weisen" <c:if test="${condition eq 'weisen' }">selected</c:if>>바이젠</option>
                                    <option value="berlinerWeisse" <c:if test="${condition eq 'berlinerWeisse' }">selected</c:if>>베를리너 바이세</option>
                                    <option value="belgianBlonde" <c:if test="${condition eq 'belgianBlonde' }">selected</c:if>>벨지안 블론드</option>
                                    <option value="belgianWheatbeer" <c:if test="${condition eq 'belgianWheatbeer' }">selected</c:if>>벨지안 윗비어</option>
                                    <option value="brownAle" <c:if test="${condition eq 'brownAle' }">selected</c:if>>브라운 에일</option>
                                    <option value="sourAle" <c:if test="${condition eq 'sourAle' }">selected</c:if>>사워 에일</option>
                                    <option value="sessionBeer" <c:if test="${condition eq 'sessionBeer' }">selected</c:if>>세션비어</option>
                                    <option value="sessionIndiaPaleAle" <c:if test="${condition eq 'sessionIndiaPaleAle' }">selected</c:if>>세션 인디아 페일 에일</option>
                                    <option value="sejong" <c:if test="${condition eq 'sejong' }">selected</c:if>>세종</option>
                                    <option value="sweetStout" <c:if test="${condition eq 'sweetStout' }">selected</c:if>>스위트 스타우트</option>
                                    <option value="stout" <c:if test="${condition eq 'stout' }">selected</c:if>>스타우트</option>
                                    <option value="americanBlondeAle" <c:if test="${condition eq 'americanBlondeAle' }">selected</c:if>>아메리칸 블로드 에일</option>
                                    <option value="americanIndiaPaleAle" <c:if test="${condition eq 'americanIndiaPaleAle' }">selected</c:if>>아메리칸 인디아 페일 에일</option>
                                    <option value="irishStout"<c:if test="${condition eq 'irishStout' }">selected</c:if>>아이리시 스타우트</option>
                                    <option value="ale" <c:if test="${condition eq 'ale' }">selected</c:if>>에일</option>
                                    <option value="amberLager" <c:if test="${condition eq 'amberLager' }">selected</c:if>>앰버 라거</option>
                                    <option value="wheatBeer" <c:if test="${condition eq 'wheatBeer' }">selected</c:if>>위트비어</option>
                                    <option value="indiaPaleAle" <c:if test="${condition eq 'indiaPaleAle' }">selected</c:if>>인디아 페일 에일</option>
                                    <option value="englishBitter" <c:if test="${condition eq 'englishBitter' }">selected</c:if>>잉글리쉬 비터</option>
                                    <option value="englishIndiaPaleAle" <c:if test="${condition eq 'englishIndiaPaleAle' }">selected</c:if>>잉글리쉬 인디아 페일 에일</option>
                                    <option value="paleAle" <c:if test="${condition eq 'paleAle' }">selected</c:if>>페일 에일</option>
                                    <option value="porter" <c:if test="${condition eq 'porter' }">selected</c:if>>포터</option>
                                    <option value="pilsner" <c:if test="${condition eq 'pilsner' }">selected</c:if>>필스너</option>
                                    <option value="hallesLager" <c:if test="${condition eq 'hallesLager' }">selected</c:if>>할레스 라거</option>
                                    <option value="whiteAle" <c:if test="${condition eq 'whiteAle' }">selected</c:if>>화이트 에일</option>
                                </select>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <select class="form-control search-slt" id="exampleFormControlSelect2">
                                    <option >제조사별</option>
                                    <option value="담주브로이" <c:if test="${condition eq '담주브로이' }">selected</c:if>>담주 브로이</option>
                                    <option value="브루어리304" <c:if test="${condition eq '브루어리304' }">selected</c:if>>브루어리304</option>
                                    <option value="세븐브로이맥주" <c:if test="${condition eq '세븐브로이맥주' }">selected</c:if>>세븐브로이맥주</option>
                                    <option value="스쿼즈브루어리" <c:if test="${condition eq '스쿼즈브루어리' }">selected</c:if>>스쿼즈 브루어리</option>
                                    <option value="안호이저부시인베브" <c:if test="${condition eq '안호이저부시인베브' }">selected</c:if>>안호이저 부시 인베브</option>
                                    <option value="앰비션브루어리" <c:if test="${condition eq '앰비션브루어리' }">selected</c:if>>앰비션 브루어리</option>
                                    <option value="장앤크래프트 브루어리" <c:if test="${condition eq '장앤크래프트 브루어리' }">selected</c:if>>장 앤 크래프트 브루어리</option>
                                    <option value="제주맥주" <c:if test="${condition eq '제주맥주' }">selected</c:if>>제주맥주</option>
                                    <option value="코리아크래프트브류어리" <c:if test="${condition eq '코리아크래프트브류어리' }">selected</c:if>>코리아크래프트브류어리</option>
                                    <option value="크래프트브로스" <c:if test="${condition eq '크래프트브로스' }">selected</c:if>>크래프트 브로스</option>
                                    <option value="플래티넘크래프트 비어" <c:if test="${condition eq '플래티넘크래프 비어' }">selected</c:if>>플래티넘 크래프트 비어</option>
                                    <option value="플레이그라운드브루어리" <c:if test="${condition eq '플레이그라운드브루어리' }">selected</c:if>>플레이그라운드 브루어리</option>
                                    <option value="핸드앤몰트" <c:if test="${condition eq '핸드앤몰트' }">selected</c:if>>핸드앤몰트</option>
                                    <option value="화수브루어리" <c:if test="${condition eq '화수브루어리' }">selected</c:if>>화수브루어리</option>
                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <select class="form-control search-slt" id="exampleFormControlSelect3">
                                    <option >지역별</option>
                                    <option value="강원도" <c:if test="${condition eq '강원도' }">selected</c:if>>강원도</option>
                                    <option value="고양" <c:if test="${condition eq '고양' }">selected</c:if>>고양</option>
                                    <option value="남양" <c:if test="${condition eq '남양' }">selected</c:if>>남양</option>
                                    <option value="울산" <c:if test="${condition eq '울산' }">selected</c:if>>울산</option>
                                    <option value="전라남도" <c:if test="${condition eq '전라남도' }">selected</c:if>>전라남도</option>
                                    <option value="전라북도" <c:if test="${condition eq '전라북도' }">selected</c:if>>전라북도</option>
                                    <option value="제주도" <c:if test="${condition eq '제주도' }">selected</c:if>>제주도</option>
                                    <option value="충청남도" <c:if test="${condition eq '충청남도' }">selected</c:if>>충청남도</option>
                                    <option value="충청북도" <c:if test="${condition eq '충청북도' }">selected</c:if>>충청북도</option>
                                </select>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <select class="form-control search-slt" id="exampleFormControlSelect4">
                                    <option selected>알콜도수별</option>
                                    <option value="3.9"<c:if test="${condition eq '3.9' }">selected</c:if>>0.0 ~ 3.9</option>
                                    <option value="4.9" <c:if test="${condition eq '4.9' }">selected</c:if>>4.0 ~ 4.9</option>
                                    <option value="5.9" <c:if test="${condition eq '5.9' }">selected</c:if>>5.0 ~ 5.9</option>
                                    <option value="6.9" <c:if test="${condition eq '6.9' }">selected</c:if>>6.0 ~ 6.9</option>
                                    <option value="7.9" <c:if test="${condition eq '7.9' }">selected</c:if>>7.0 ~ 7.9</option>
                                    <option value="8.0" <c:if test="${condition eq '8.' }">selected</c:if>>8.0 ~ </option>
                                </select>                            
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <select class="form-control search-slt" id="exampleFormControlSelect5">
                                    <option selected>정렬기준</option>
                                    <option value="score">평점순</option>
                                    <option value="latest">최신순</option>
                                </select>                            
                            </div>
                        </div><br>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-12"></div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <button type="submit" class="wrn-btn">Search</button>
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
    	<c:forEach var="b" items="${list}">
	        <tr>
	            <td rowspan="3"><img src='resources/images/beers/말표.png' width='90'></td>
	            <td class="bno">${b.beerNO }</td>
	            <td>${b.beerName} (${b.beerEname })</td>
	            <td rowspan="3">맥주점수<br><br>#{b.totalScore }</td>
	        </tr>
	        <tr>
	            <td>${b.beerProducer }</td>
	            <td>${b.beerLocation }</td>
	        </tr>
	        <tr>
	            <td>${b.beerStyle }</td>
	            <td>${b.beerContainer }</td>
	        </tr>
    	
    	</c:forEach>
    </table>
	<br><br><br>
	
	<!-- 세부페이지 링크 -->
	<script>
		$(function(){
			$("tr").click(function(){
				location.href = "beerDetail.db?bno=" + $(this).children(".bno").text();
			})
		})
	</script>
	
    <!-- 페이징바 -->
    <div class="container" style="width:20%">
	    <div class="pagination">
	    	<c:choose>
	    		<c:when test="${pi.currentPage eq 1 }">
	        		<a class="disabled" href="#">&laquo;</a>
	        	</c:when>
	        	<c:otherwise>
	        		<a href="beers.db?currentPage=${pi.currentPage - 1 }">&laquo;</a>
	        	</c:otherwise>
	        </c:choose>
	        
	        <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
	        		<a  href="beers.db?currentPage=${ p}">${p }</a>
	        </c:forEach>
	        
	        <c:choose>
	        	<c:when test="${pi.endPage eq pi.maxPage }">
			        <a class="disabled" href="#">&raquo;</a>
		        </c:when>
		        <c:otherwise>
		        	<a  href="beers.db?currentPage=${pi.currentPage + 1 }">&raquo;</a>
		        </c:otherwise>
	        </c:choose>
	    </div>
    </div>
    
  	<br><br><br>
</body>
</html>