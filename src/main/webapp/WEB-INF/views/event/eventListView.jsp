<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>이벤트리스트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
    .evList{
        width:800px;
        height:200px;
        position:relative; 
        background-color:aqua;
        }
    .content{
        height:100px;
        box-sizing: border-box;
        width:70%;
        position: absolute;
        top:20px;
        left:250px;
        }
    .photo{
        height:100%;
        width:30%;
        position: absolute;
        top:30px;
        left:30px;
        float:left;
    }
    #pagingArea{width:fit-content; margin-top: 20px;}    
</style>
</head>
<body>


  
    <jsp:include page="../common/header.jsp"/>    
    
    <br>
    
    <div class="outer" align="center">
        
        <form action="" class="search">
            <h2>Event</h2>
            <select id="searchCategory">
                <option>제목으로 검색</option>
                <option>내용으로 검색</option>
            </select>

            <input id="searchWord" spaceholder="검색어를 입력하세요.">

            <button type="submit">검색</button>
        </form>

        <br><br>
        <div class="evList">
            <div class="photo">
                <img src="resources/images/beer online tasting1.jpg" alt="" width="200px">
            </div>

            <div class="content">
                <table style="height: 100%;" align="center">
                    <thead>
                        <th>3차 온라인 시음회</th>
                        <th>No.12</th>
                        <th>D-Day = 8</th>
                        <th>2020-12-07 PM 8</th>
                    </thead>
                    <tbody>
                        <td colspan="4">안녕하세요 3차 온라인 시음회를 2주뒤에 개최합니다!!</td>
                    </tbody>
                    <tfoot>
                        <td>조회수 : 145</td>
                        <td>댓글수 : 12</td>
                        <td>작성자 : admin</td>
                        <td>2020-11-09</td>
                    </tfoot>
                </table>
            </div>

        </div>

        <br>
        <div class="evList">
            <div class="photo">
                <img src="resources/images/beer online tasting2.png" alt="" width="200px">
            </div>

            <div class="content">
                <table style="height: 100%;" align="center">
                    <thead>
                        <th>4차 온라인 맥주파티</th>
                        <th>No.12</th>
                        <th>D-Day = 8</th>
                        <th>2020-12-07 PM 8</th>
                    </thead>
                    <tbody>
                        <td colspan="4">안녕하세요 3차 온라인 시음회를 2주뒤에 개최합니다!!</td>
                    </tbody>
                    <tfoot>
                        <td>조회수 : 145</td>
                        <td>댓글수 : 12</td>
                        <td>작성자 : admin</td>
                        <td>2020-11-09</td>
                    </tfoot>
                </table>
            </div>

            

        </div>
            <div id="pagingArea">
                <ul class="pagination">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </div>
        </div>

    </div>


</body>
</html>