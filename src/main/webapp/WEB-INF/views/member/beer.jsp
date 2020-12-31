<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맥주신청현황</title>
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
	
	<br>
	
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

    <h1 style="margin-left: 30px; color: rgb(236, 191, 46); font-size:30px">맥주 신청현황</h1>  
     
    <div class="myEvent">
        <table  style="height: 100px;" class="table-hover" >
              <tr>
                  <td rowspan="3">서울수제맥주시음회</td>
                  <td rowspan="3"> 
                     <textarea name="" id="" cols="100" rows="5" style="resize: none;" disabled>
                        서울수제맥주시음회 정보들
                        서울수제맥주시음회 정보들
                        서울수제맥주시음회 정보들
                        서울수제맥주시음회 정보들
                        서울수제맥주시음회 정보들
                     </textarea>
                  </td>
                  <td rowspan="3" width="100px">
                      <span>승인</span>
                  </td>

              </tr>
              
        </table>
    </div>

    <div class="myEvent">
        <table  style="height: 100px;" class="table-hover">
              <tr>
                  <td rowspan="3">서울수제맥주시음회</td>
                  <td rowspan="3"> 
                     <textarea name="" id="" cols="100" rows="5" style="resize: none;" disabled>
                        서울수제맥주시음회 정보들
                        서울수제맥주시음회 정보들
                        서울수제맥주시음회 정보들
                        서울수제맥주시음회 정보들
                        서울수제맥주시음회 정보들
                     </textarea>
                  </td>
                  <td rowspan="3" width="100px">
                      <span>검토중</span>
                  </td>

              </tr>
              
        </table>
    </div>

    <div class="myEvent">
        <table  style="height: 100px;" class="table-hover">
              <tr>
                  <td rowspan="3">서울수제맥주시음회</td>
                  <td rowspan="3"> 
                     <textarea name="" id="" cols="100" rows="5" style="resize: none;" disabled>
                        서울수제맥주시음회 정보들
                        서울수제맥주시음회 정보들
                        서울수제맥주시음회 정보들
                        서울수제맥주시음회 정보들
                        서울수제맥주시음회 정보들
                     </textarea>
                  </td>
                  <td rowspan="3" width="100px">
                      <span>제출완료</span>
                  </td>

              </tr>
              
        </table>
    </div>

    <br>

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