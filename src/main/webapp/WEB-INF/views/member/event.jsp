<%--
  Created by IntelliJ IDEA.
  User: chois
  Date: 2020-12-16
  Time: 오전 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>이벤트 신청내역</title>
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
        #event{
            color:white;
            font-size: 18px;
        }
        .myEvent{
            color:white;
            text-align: center;
            margin:15px;
            font-size:17px;
            font-weight: bolder;

        }
        .myEvent table{
            border:2px solid rgb(236, 191, 46);
        }

        .table-hover:hover{
            background-color: rgb(236, 191, 46);
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

<h1 style="margin-left: 30px; color: rgb(236, 191, 46);">이벤트 신청현황</h1>

<br>
<div id="event" style="margin-left: 30px;">
    <ol>
  		
  		<c:when test="${empty list}">
  			<b>신청한 이벤트가 없습니다.</b>
  		</c:when>
  		<c:otherwise> 
			<c:forEach var="e" items="${list}">
			        <li id="a">
				            <span id="b">${e.evTitle }</span>
				            <!-- Button to Open the Modal -->
				           
				            <c:if test="${!empty list}">
					            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
					               	 취소
					            </button>
							</c:if>
			        </li>
			        <br>
		   	</c:forEach>     
       </c:otherwise>
    </ol>
</div>

<script type="text/javascript">
	$(function(){
		$("#c").click(function(){
		 var title = $("#b").text();
		 console.log(title);
		 location.href = "delete.ev?eventTitle="+title;
		 
		});
	});
</script>

<!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">이벤트 신청 취소하기</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                취소하시겠습니까? 취소후 포인트(-5p)<span style="color:red;">반환불가</span>입니다.
            </div>

            <!-- Modal footer -->
            <form action="delete.ev"  class="modal-footer">
            	
                <button type="button" class="btn btn-primary" data-dismiss="modal">뒤로가기</button>
                <button id="c" type="submit" class="btn btn-danger" data-dismiss="modal">취소</button>
            </form>

        </div>
    </div>
</div>

<hr style="height:2px;border-width:0;color:white;background-color:white">

<div class="myEvent">
    <table  style="height: 100px;" class="table-hover">
    <c:forEach var="e" test="${list}">
        <tr>
            <td rowspan="3" style="color:white;">${e.evTitle }</td>
            <td rowspan="3">
                         <textarea name="" id="" cols="100" rows="5" style="resize: none;" disabled>
                          ${e.evContent}
                         </textarea>
            </td>
            <td rowspan="3" width="100px">
                <span style="color:white;">${e.status}</span>
            </td>

        </tr>
	</c:forEach>
    </table>
</div>





<div style="margin-left:17px">
    <ul class="pagination">
        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">Next</a></li>
    </ul>
</div>
</body>
</html>
