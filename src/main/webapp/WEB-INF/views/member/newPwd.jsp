<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="resources/css/button.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .outer{
           width: 400px;
           height: 400px;
           margin: auto;
           margin-top: 100px;
           background-color:  rgb(24, 22, 22);
           color: white;
           border-radius: 10px;
        }

        .content{margin-left:10px;}

        button {
          width: 300px;
          height: 45px;
          background-color: #ecbf2e;;
        }
        img{
          width: 100px;
          height: 100px;
          margin: auto;
          margin-top: 40px;
        }
        input{
          width: 250px;
          height: 40px;
        }

    </style>
</head>
<body style="background-color:  #2a2725;">
	
	<div class="outer">
            <br>
            <div id="image" align="center">
              <img src="resources/images/macsimXy.png" alt="" style="width: 180px; height: 40px;"><br><br>
            </div>
            <div align="center">
              <h5>비밀번호 등록</h5>
            </div>
            <br>
            <div id="findIdForm">
              <form action="" method="">
                  <table align="center">
                    <tr>
                      <td colspan="2"><input type="password" name="userId" placeholder="새로운 비밀번호를 입력하세요" required></td>
                    </tr>
                    <tr>
                      <td colspan=""><input type="password" name="email" required placeholder="한번 더 입력해주세요"></td>
                    </tr>

                  </table>


                  <br>
                  <div align="center" id="findId">
                    <button class="snip1535" type="submit" >확인</button>
                  </div>
                  <br>  
              </form>



              
            </div>
            
    </div>
	
	
</body>
</html>