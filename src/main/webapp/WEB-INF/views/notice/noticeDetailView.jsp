<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .outer{
        width: 800px;
        height: 600px;
        margin: auto;
        margin-top: 50px;
        background-color: #2a2725;
        color: white;
    }
    
    .paging-area a{
        text-decoration: none;
        color: black;
        margin: 5px;
    }
    .search_bar select{
        float: left;
        margin-left: 100px;
        margin-right: 330px;
    }
    .paging-area a:hover{
        text-decoration: none;
        color: gray;
    }
   
 
</style>
</head>
<body style="background-color:  #2a2725;">

	<jsp:include page="../common/header.jsp"/> 
	
	<div class="outer">

        <br>
        <!-- <h1 align="left">공지사항</h1>-->


         <!--<hr style="border:solid 0.7px #ecbf2e">-->
            <table style= "width: 80%;">
                <thead>
                    <tr>
                        <th colspan="3" style="width: 400px; font-size: 1.5em;" value="제목제목">${ n.noticeTitle }</th>
                    </tr>
                </thead> 
                <tbody >
                    <tr>
                        <td colspan="3"> </td>
                        <td>${n.noticeDate }</td>  
                    </tr>
                    <tr>
                        <td colspan="4"><hr style="border:solid 0.3px white;"></td>
                    </tr>
                    <tr align="center">
                        <td colspan="4" >
                        	<br>
                            <p style="height:180px;color:#ecbf2e;">${n.noticeContent }</p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4"><hr></td>
                    </tr>
                </tbody>
                

            </table>
            <br>
            
       <br><br>

       <table id="replyArea" class="table" style="color: white; width: 80%;">
        <thead>
            <tr>
                <th colspan="3">
                    <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:90%; margin-left: 60px;"></textarea>
                </th>
                <th style="vertical-align: middle; width: 20%;" ><button class="btn btn-secondary">댓글</button></th>
            </tr>
            
            <tr>
               <td colspan="4">댓글 (<span id="rcount">3</span>) </td> 
            </tr>
        </thead>
        <tbody align="center">
            <tr>
                <td>user02</td>
                <td>댓글입니다.</td>
                <td>2020-04-10</td>
                <td><a href="">신고</a></td>
            </tr>
            <tr>
                <td>user01</td>
                <td>많이봐주세요</td>
                <td>2020-04-08</td>
                <td><a href="">신고</a></td>
            </tr>
            <tr>
                <td>admin</td>
                <td>댓글입니다ㅋㅋㅋ</td>
                <td>2020-04-02</td>
                <td><a href="">신고</a></td>
            </tr>
        </tbody>
    </table>
</div>
<br><br>
	
</body>
</html>