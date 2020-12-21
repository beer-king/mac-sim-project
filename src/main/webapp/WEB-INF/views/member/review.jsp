<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: chois
  Date: 2020-12-16
  Time: 오전 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>나의 리뷰</title>
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

        }

        #mypageMenu a:hover{
            color: rgb(236, 191, 46);
        }

        #reviewTable{color:white;}

        #reviewForm div{
            display: inline-block;
            margin:10px;
            font-size: 20px;
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
        <li><a href="update.me"><span>정보수정</span></a></li>
        <li><a href="review.me"><span>나의리뷰</span></a></li>
        <li><a href="point.me"><span>포인트내역</span></a></li>
        <li><a href="event.me"><span>이벤트신청현황</span></a></li>
        <li><a href="group.me"><span>공구신청현황</span></a></li>
        <li><a href="beer.me"><span>맥주신청현황</span></a></li>
        <li><a href="category.me"><span>나만의카테고리</span></a></li>
    </ul>
</div>

<hr style="height:2px;border-width:0;color:white;background-color:white">

<br><br>

<form action="" method="post" id="reviewForm">

    <div align="left" >
        <c:forEach var="beerReview" items="${list}">
            <table border="1" id="reviewTable" class="table-bordered">


                <tr>
                    <th width="100">${beerReview.beerName}</th>
                    <td>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                            수정
                        </button>



                        |<button type="button" class="btn btn-danger" onclick="deleteBeer();">삭제</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        (${beerReview.score})점 <span>${beerReview.updatedDate}</span>
                    </td>

                </tr>
                <tr>
                    <td colspan="2" height="100">
                        <textarea name="rContent" class="form-control" cols="30" rows="5" style="resize:none;" readonly>${beerReview.comments}</textarea>
                    </td>

                </tr>
            </table>
        </c:forEach>

        <script>
            function deleteBeer(){
                var message = confirm("삭제를 원하신다면 확인을 눌러주세요");
                //console.log(message); => 확인누르면 true
                if(message){
                    location.href="deleteReview?scoreNo=${list.scoreNo}";
                }

            }

        </script>
    </div>

</form>



<!-- Modal -->
<div
        class="modal fade"
        id="myModal"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
>
    <div class="modal-dialog">
        <form action="updateBeerReview" method="get" class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">리뷰 수정</h5>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                ></button>
            </div>
            <div class="modal-body">

                점수(10~100)
                <br>
                <input type="number" min="10" max="100" name="score">
                <br><br>
                리뷰
                <div>
                    <textarea name="myReview" id="" cols="50" rows="10" style="resize: none;"></textarea>
                </div>

            </div>
            <div class="modal-footer">
                <button
                        type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal">

                    취소
                </button>
                <button type="submit" class="btn btn-primary">수정</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
