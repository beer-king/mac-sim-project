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
            height: 620px;
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
        
        #enrollForm img{
            float: left;
            margin: 20px;
            margin-left: 40px;
        }
        #enrollForm table{
        	margin-left: 100px;
        	margin-top: 50px;
            width: 80%;
            height: 360px;
        }
        .data{
            border-collapse: separate;
            border-spacing: 20px;
            width: 100%;
        }
        .dataview {
            margin: 20px;
            background: white;
            text-align: center;
            
        }
        .dataview td{
            height: 40px;
            width: 200px;
            vertical-align: middle;
        }
       	.dataSheet *{
       		vertical-align: middle;
       	}
        .clickDataView:hover{
		    cursor: pointer;
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
<c:if test="${ !empty alertMsg }">
	<script>
		alertify.alert("${alertMsg}");
	</script>
	<c:remove var="alertMsg" scope="session"/>
</c:if>

<div class="outer">
    <div class="content">
	    <form id="enrollForm" method="post" action="updateGB.ad" enctype="multipart/form-data">
	            <img id="titleImg" width="200" height="200" style="margin-left:100px;" src="${g.gbThumb }">
	            <img id="titleImg2" width="200" height="200" src="${upfile1 }">
	             <img id="titleImg3" width="200" height="200" src="${upfile2 }">
	           
	            <input type="file" name="FImg" id="FImg" onchange="loadImg(this,1);">
	            <input type="file" name="upfile1" id="upfile1" onchange="loadImg(this,2);">
	            <input type="file" name="upfile2" id="upfile2" onchange="loadImg(this,3);">
	            <br>
	            <table class="dataSheet" align="center">
	                <tr>
	                	<input type="hidden" name="pno" value="${pNo }">
	                	<input type="hidden" name="pNo" value="${pNo }">
	                	<input type="hidden" name="userNo" value="${loginUser.userNo }">
	                    <th><label for="title">상품명</label></th>
	                    <td><input type="text" class="form-control" name="gbName" value="${g.gbName }" required></td>
	                    <td>&nbsp</td>
	                    <th><label for="eTitle">상품가격</label></th>
	                    <td><input type="number" class="form-control" name="price" value="${g.price }" required></td>
	                </tr>
	                <tr>
	                    <th><label for="title">시작시간</label></th>
	                    <td><input type="datetime-local" class="form-control" name="gbStart" value="${g.gbStart }" required></td>
	                    <td>&nbsp</td>
	                    <th><label for="eTitle">마감시간</label></th>
	                    <td><input type="datetime-local" class="form-control" name="gbEnd" value="${g.gbEnd }" required></td>
	                </tr>
	                <tr>
	                    <th><label for="title">포인트 소모</label></th>
	                    <td><input type="number" class="form-control" name="gbPoint" value="${g.gbPoint }" required></td>
	                    <td>&nbsp</td>
	                    <th><label for="eTitle">모집자 제한수</label></th>
	                    <td><input type="number" class="form-control" name="limitNo" value="${g.limitNo }" required></td>
	                </tr>
	                <tr>
	                    <th><label for="title">상세 설명</label></th>
	                    <td colspan="4"><textarea name="content" cols="30" rows="10" style="width: 100%; height: 100; resize: none;">${g.content }</textarea></td>
	                    
	                </tr>
	            </table>
	            <br>
				
	            <div align="right">
	                <button type="submit" class="btn btn-primary">수정하기</button>
	                <button type="reset" class="btn btn-danger">취소하기</button>
	            </div>
	        </form>
    </div>
</div>
<script>
	$(function(){
		$("#upfile1").hide();
		$("#upfile2").hide();
		$("#FImg").hide();
		$("#titleImg").click(function(){
			$("#FImg").click();
		});
		$("#titleImg2").click(function(){
			$("#upfile1").click();
		});
		$("#titleImg3").click(function(){
			$("#upfile2").click();
		});
	});
	function loadImg(inputFile, number){
			if(inputFile.files.length){
				var reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function(e){
					switch(number){
	                    case 1:
	                        $("#titleImg").attr("src", e.target.result);
	                        break;
	                    case 2:
	                        $("#titleImg2").attr("src", e.target.result);
	                        break;
	                    case 3:
	                        $("#titleImg3").attr("src", e.target.result);
	                        break;
                	}
				}
			}else{
					switch(number){
	                case 1:
	                    $("#titleImg").attr("src", null);
	                    break;
	                case 3:
	                    $("#titleImg2").attr("src", null);
	                    break;
	                case 4:
	                    $("#titleImg3").attr("src", null);
	                    break;
	            }
			}
		}
</script>
</main>

<footer></footer>
</body>
</html>