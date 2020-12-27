<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트수정하기</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <style>
    .content{
        width:80%;
        margin:auto;
    }
    .innerOuter{
        border:1px solid lightgray;
        width:90%;
        margin:auto;
        padding:5% 15%;
        background:white;
    }
    
    #updateForm>table{width:100%;}
    #updateForm>table *{ margin:7px;}
</style>
</head>
<body>
        <!-- 이쪽에 메뉴바 포함  -->
        <jsp:include page="../common/header.jsp"/>  

        <div class="content">
            <button type="button" class="btn btn-primary" >&lt;뒤로가기</button>
            <br><br>
            <br><br>
            <div class="innerOuter">
                <h2>이벤트 수정하기</h2>
                <br>
                ** 회원이 작성하는 이벤트는 <br> &nbsp; &nbsp; 맥심관리자의 최종 승인을 받아야 등록됩니다.
                <hr>
                <form id="updateForm" method="post" action="" enctype="">
                    <table align="center">
                        <tr>
                            <th>이벤트 번호 :</th>
                            <td colspan="2">13</td>
                        </tr>
                        <tr>
                            <th><label for="title">* 이벤트 제목 :</label></th>
                            <td><input type="text" id="title" class="form-control" name="" placeholder="3차 온라인 맥주 시음회" required></td>
                        </tr>
                        <tr>
                            <th><label for="writer">작성자 : </label></th>
                            <td><input type="text" id="writer" class="form-control" value="작성자아이디" name="" readonly></td>
                        </tr>
                        <tr>
                            <th><label for="content">* 이벤트 내용 : </label></th>
                            <th><textarea class="form-control" required name="" id="content" rows="10" placeholder="기존 작성된 내용들" style="resize:none;"></textarea></th>
                        </tr>
                        <tr>
                            <th><label for="evDate">* 이벤트 날짜/시간 : </label></th>
                            <td><input type="date" id="evDate" required class="form-control"></td>
                            <td><input type="time" id="evTime" required class="form-control"></td>
                        </tr>
                        <tr>
                            <th><label for="appDate">* 신청마감일 : </label></th>
                            <td><input type="date" id="appDate" required class="form-control"></td>
                            <td><input type="time" id="appTime" required class="form-control"></td>
                        </tr>
                        <tr>
                            <th><label for="evBeer">이벤트용 맥주 : </label></th>
                            <td><input type="text" id="evBeer" class="form-control" placeholder="제주 펠롱에일 500ml 3캔"></td>
                        </tr>
                        <tr>
                            <th><label for="evPoint">포인트 소모량 : </label></th>
                            <td><input type="text" id="evPoint" class="form-control" placeholder="-5"></td>
                        </tr>
                        <tr>
                            <th><label for="evPeople">총 모집자수 : </label></th>
                            <td><input type="text" id="evPeople" class="form-control" placeholder="100명"></td>
                        </tr>
                        <tr>
                            <th><label for="upfile">이벤트 사진</label></th>
                            <td><input type="file" id="upfile" class="form-control-file border" name=""></td>
                        </tr>
   
                    </table>
                    <br>
    
                    <div align="center">
                        <button type="submit" class="btn btn-primary">등록</button>
                        <button type="reset" class="btn btn-danger">취소</button>
                    </div>
                </form>
            </div>
            <br><br>
        </div>
    
    
</body>
</html>