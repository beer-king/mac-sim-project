<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

        #groupBuy{
            color:white;
            font-size: 17px;
            font-weight: bolder;
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
	
	 <h1 style="margin-left: 30px; color: rgb(236, 191, 46); font-size:30px">공구 신청현황</h1>
      <br>
      
      <div id="groupBuy">
          <ul>
              <li>
                  <span class="pName">말표맥주뚜껑<span>(2p)</span></span>
                    <!-- Button to Openthe Modal -->
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
                        취소
                    </button>
              </li>
                <br>
              <li>
                <span class="pName">맥주거품기<span>(5p)</span></span>
                  <!-- Button to Open the Modal -->
                  <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
                      취소
                  </button>
            </li>
                <br>
            <li>
                <span class="pName">맥주캐리어<span>(10p)</span></span>
                  <!-- Button to Open the Modal -->
                  <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
                      취소
                  </button>
            </li>

              
          </ul>
      </div>
      
      <script>
          $(function(){
              $("#groupBuy li").click(function(){  
                  var pName = $("span").text();
                  console.log(pName);


                  $("#nameSpace").text(pName);
              });

             

          });
      </script>


           <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">공구 신청 취소</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    취소시 포인트반환가능 <label id="nameSpace"> </label>
                </div>
        
                <!-- Modal footer -->
                <form action="delete.ev"  class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">뒤로가기</button>
                    <button type="submit" class="btn btn-danger" data-dismiss="modal">취소</button>
                </form>
        
            </div>
            </div>
        </div>


	
	
</body>
</html>