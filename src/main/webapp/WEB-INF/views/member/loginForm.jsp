<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Latest compiled and minified CSS -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!--버튼css-->
    <link rel="stylesheet" href="resources/css/button.css">
     <!-- jQuery library -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 
     <!-- Popper JS -->
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 
     <!-- Latest compiled JavaScript -->
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        div{
            box-sizing: border-box;
        }
        /* 전체 감싸는 div */
        .wrap{
            width: 900px;
            height: 800px;
            margin: auto; /*정가운데*/
            margin-top: 20px;
        }
        /* #header, # content, */
        .wrap>div{height: 100%; float: left;}
        #header{ width: 50%;}
        #content{width: 50%;}

        #content>div{
            width: 100%;
        } 
        
        #content_1{height:60%;}
        #content_2{height: 40%;}

        /*로그인 폼*/
        #content_1{
            width:90%;
            height: 50%;
            margin:auto;
            padding:18% 18%;
            border-radius: 20px;
            color: white;
            margin-bottom: 20px;
        }
     
        #loginbutton{
            width: 75%;
           background-color: #ecbf2e;
        }
        a{
            color: white;
            font-size: small;
            margin-left: 15px;
        }
        a:hover{
            text-decoration: none;
            color: gray;
        }
        /*아이디 비번 input*/
        input{
            width: 280px;
            height: 40px;
        }

        /*소셜 로그인 이미지*/
        #content_2 img{
            width: 300px;
            height: 40px;;
        }  
        #img1{
            margin-top: 260px;
            margin-right: 180px;
            width: 250px;
        }
    </style>
</head>
<body style="background-color: #2a2725;">
	 <div class="wrap">
        <div id="header" align="center">
            <img src="resources/images/logo.png" alt="" id="img1"><br>            
        </div>
        <!--로그인 폼-->
        <div id="content">
            <div id="content_1" style="background-color:  rgb(24, 22, 22);" >
     
                <form action="login.me" method="post" >
                    <table id="loginForm">
                        <tr>
                            <td colspan="2">
                                <input type="text" name="userId" placeholder="아이디를 입력하세요" required>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br>
                                <input type="password" name="userPwd" placeholder="비밀번호를 입력하세요" required>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br>
                                <button class="snip1535" type="submit" id="loginbutton">로그인</button>
                            </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2">
                                <br>
                                <a href="idFindForm.me">아이디 찾기 |</a>
                                <a href="pwdFindForm.me">비밀번호 찾기 |</a>
                                <a href="agreeForm.me">회원가입</a>
                            </td>
                        </tr> 
                    </table>
                   
                </form>

            </div>
            <br>
            <!--소셜 로그인 폼-->
            <div id="content_2" style="color: white;">
                <form action="" method="get">
                    <table align="center">
                        <tr>
                            <td colspan="2">* 소셜(SNS) 로그인</td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <br>
                                <a href="https://kauth.kakao.com/oauth/authorize?client_id=3e97e22d6dadb5186b6825cc9c41ac40&redirect_uri=https://localhost:8888/login&response_type=code">
                                <img src="resources/images/kakao.PNG" alt="">
                                </a>
                            </td>
                            <br>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <br>
                                <a href="">
                                <img src="resources/images/네이버로 로그인.PNG" alt="">
                                </a>
                            </td>
                        </tr>
                    </table>
                </form>

            </div><!--content_2-->

        </div><!--content-->
        
    </div><!-- wrap-->
</body>
</html>