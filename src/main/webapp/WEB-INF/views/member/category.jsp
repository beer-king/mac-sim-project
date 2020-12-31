<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나만의 카테고리</title>
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
        #myCategory{
            color:white;
            font-size: 16px;
            
            margin-left: 20px;
          
        }
        #myCategory>div{
            display: inline-block;
            margin-right: 20px;
        }
        
        #myCategory>div table{
          !important  border-color:white; 
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
    
   <h3 style="margin-left: 30px; color: rgb(236, 191, 46);">나만의 카테고리</h3>
   <br>

  <div id="myCategory" >
    
    <div>
        <table border="1">
            <tr>
                <td colspan="2" width="200" style="background-color:rgb(236, 191, 46);"><h1>라거</h1></td>
               
            </tr>
            <tr>
                <td colspan="2" style="height:150px;">
                    <ul>
                        <li>카스</li>
                        <li>홉하우스13</li>
                        <li>기네스</li>
                    </ul>
                </td>
                
            </tr>
            <tr>
                <td>
                    <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">수정</button>
                </td>
                <td>
                    <button class="btn btn-danger" data-toggle="modal" data-target="#myModal1">삭제</button>
                </td>
            </tr>
         </table>
    </div>

    <div>
        <table border="1" id="myCategory">
            <tr>
                <td colspan="2" width="200" style="background-color:rgb(236, 191, 46);"><h1>라거</h1></td>
               
            </tr>
            <tbody class="beerList">
                <tr>
                  <td colspan="2" style="height:150px;">
                      <ul>
                          <li>카스</li>
                          <li>홉하우스13</li>
                          <li>기네스</li>
                      </ul>
                  </td>
                </tr>
            </tbody>
            <tr>
                <td>
                    <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">수정</button>
                </td>
                <td>
                    <button class="btn btn-danger" data-toggle="modal" data-target="#myModal1">삭제</button>
                </td>
            </tr>
         </table>
    </div>
         
    </div>

    <script>
      $(function(){
          $("#myCategory button").click(function(){
             var listName = $(".beerList ul").text();
             ///console.log(listName);


             //$(".modal-body").text(listName);
          });
      });
    </script>

     
  </div>    
   
  <!-- 수정Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
      
      <form action="update.me" method="POST" class="modal-content">
        <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">카테고리 수정</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
    
          <!-- Modal body -->
          <div class="modal-body">
            카스 <input type="checkbox" name="beer" value="cass">
            홉하우스13 <input type="checkbox" name="beer" value="hop13">
            기네스 <input type="checkbox" name="beer" value="기네스">
          </div>
    
          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
            <button type="submit" class="btn btn-danger" data-dismiss="modal">수정</button>
          </div>
      </form>
    
    </div>
  </div>




   <!-- 삭제Modal -->
   <div class="modal" id="myModal1">
    <div class="modal-dialog">
      <div class="modal-content">
  
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">카테고리 삭제</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
  
        <!-- Modal body -->
        <div class="modal-body">
          해당 카테고리를 삭제하시겠습니까?
        </div>
  
        <!-- Modal footer -->
        <form action="category.ca" method="GET" class="modal-footer">
            <input type="hidden" name="" value="">
            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
            <button type="submit" class="btn btn-danger" data-dismiss="modal">삭제</button>
        </form>
  
      </div>
    </div>
  </div>

	
	
	
</body>
</html>