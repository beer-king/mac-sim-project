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
           height: 480px;
           margin: auto;
           margin-top: 100px;
           background-color: rgb(24, 22, 22);
           color: white;
           border-radius: 10px;
        }

        .content{margin-left:10px;}

        button {
          width: 265px;
          height: 40px;
          background-color: #ecbf2e;;
        }
        a{
          color: gray;
        }
        a:hover{
            text-decoration: none;
            color: darkgray
        }
    </style>
</head>
<body style="background-color:  #2a2725;">
    
    <div class="outer">
            <br><br>
            <div id="image" align="center">
              <img src="resources/images/logo.png" alt="">
            </div>
            <br><br>
            <div id="findIdForm">
              <form action="" method="">
                  <table align="center">
                    <tr>
                      <th>이름</th>
                      <td><input type="text" name="userName" required></td>
                    </tr>

                    <tr>
                      <th>전화번호&nbsp&nbsp</th>
                      <td><input type="text" name="userName" required placeholder="-없이 입력하세요"></td>
                    </tr>

                  </table>

                  <br>
                  <br>
                  <div align="center" id="findId">
                    <button type="submit" class="snip1535">아이디 찾기</button>
                  </div>
                  <br>
                  <div align="center">
                   <a href="pwdFindForm.me">&nbsp&nbsp비밀번호 찾기 &nbsp&nbsp|</a>
                   <a href="agreeForm.me">&nbsp&nbsp회원가입 &nbsp&nbsp</a>
                  </div>
                  
              </form>



              
            </div>
            
    </div>
         
      

</body>
	
</body>
</html>