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
              <a href="/macSim"><img src="resources/images/logo.png" alt=""></a><br><br>
              <span style="font-size: small;">고객님의 정보와 일치하는 아이디 입니다.</span>
            </div>
            <br>
            <div id="findIdForm">
            
              <form action="" method="">
                     <table align="center">
                   
                   <c:choose>
	                   	<c:when test="${ empty findId }">
		                    <tr>
		                      <th><h3>조회된 정보가 없습니다.</h1></th>        
		                    </tr>
		                </c:when>
		                <c:otherwise>
		                    <tr>
		                      <th><h1>${findId.userId}</h1></th>        
		                    </tr>
	                    </c:otherwise>
                   </c:choose> 
                    
                  </table>

                  <br>
                  <div align="center" id="findId">
                    <button type="button" class="snip1535" onclick="location.href='loginForm.me'">로그인 하기</button>
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
</html>