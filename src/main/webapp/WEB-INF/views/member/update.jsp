<%--
  Created by IntelliJ IDEA.
  User: chois
  Date: 2020-12-16
  Time: 오전 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>정보수정</title>
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

        #mypageMenu a:hover{color: rgb(236, 191, 46);}

        #btnGroup{ margin-left: 30px;}

        #btnGroup span{color :white;}

        #userInfo{display:none;}
        #changePwd{display: none;}
        #userInfo li{list-style: none;}
        #userInfo span{ color:white;}
        .subBtn{ margin-left: 30px;}
        #changePwd li{list-style: none;}
        #changePwd span{ color:white;}
        #deleteMember{display: none;}
        #deleteMember li{color:white;}

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
<div class="btn-group" id="btnGroup" >
    <button type="button" class="btn btn-warning" id="info" onclick="info();"><span>회원정보</span></button>
    <button type="button" class="btn btn-warning" id="chPwd" onclick="chPwd();" ><span>비밀번호</span> </button>
    <button type="button" class="btn btn-warning" id="delete" onclick="d();" ><span>회원탈퇴</span></button>
</div>

<script>
    function info(){
        $("#userInfo").show();
        $("#changePwd").hide();
        $("#deleteMember").hide();
    }

    function chPwd(){
        $("#userInfo").hide();
        $("#deleteMember").hide();
        $("#changePwd").show();
    }

    function d(){
        $("#deleteMember").show();
        $("#userInfo").hide();
        $("#changePwd").hide();
    }
</script>

<br><br>

<form action="memberUpdate.me" method="POST">
    <div id="userInfo">
        <ul>
            <li><span>*아이디</span> <input  type="text" value="${loginUser.userId}" name="userId" readonly > </li>
            <li><span>이름</span> <input type="text" value="${loginUser.userName}" name="userName"></li>
            <li>
                <span>성별</span> <span>M</span> <input type="radio" name="gender" value="M" id="Male">
                <span>F</span> <input type="radio"name="gender" value="F" id="Female">
            </li>

            <li><span>전화번호</span> <input type="text"  name="phone" value="${loginUser.phone}" ></li>
            <li><span>이메일</span> <input type="email" name="email" value="${loginUser.email}"></li>
            <li><span>주소</span> <input type="text" name="address" value="${loginUser.address}"></li>
        </ul>

        <div align="left" class="subBtn">
            <button type="submit" class="btn btn-warning">수정하기</button>
        </div>

    </div>
</form>

<script>
    $(function(){
        if("${loginUser.gender}"=="M"){
            $("#Male").attr("checked",true);

        }else if("${loginUser.gender}"=="F"){
            $("#Female").attr("checked",true);
        }
    });

</script>



<form action="memberPwdUpdate.me" method="get">
    <div id="changePwd">
        <ul>
            <li> <span>아이디 : ${loginUser.userId}</span> </li>
            <li> <span>현재비밀번호 :</span> <input type="password" name="userPwd"> </li>
            <li> <span>신규비밀번호 : </span> <input type="password" id="newPwd" name="newPwd"> </li>
            <li> <span>신규비밀번호 확인 : </span> <input type="password" id="checkPwd"> </li>
        </ul>

        <div align="left" class="subBtn">
            <button type="button" class="btn btn-warning">취소</button>
            <button type="submit" id="updateBtn"  class="btn btn-warning" disabled >수정</button>
        </div>
    </div>
</form>

<!--새로운비밀번호와 새로운비밀번호 확인-->
<script>
    $(function(){
        var newPwd = $("#newPwd");
        var checkPwd = $("#checkPwd");
        newPwd.keyup(function(){

            var i = newPwd.val();

            checkPwd.keyup(function(){
                var y = checkPwd.val();


                if(i == y){
                    $("#updateBtn").removeAttr("disabled");
                }else{
                    $("#updateBtn").attr("disabled",true)
                }

            });

        });

    });
</script>



    <div id="deleteMember">
        <ol>
            <li><span>탈퇴할거유?진짜루?</span> </li>
            <li><span>탈퇴할거유?진짜루?</span></li>
            <li><span>탈퇴할거유?진짜루?</span></li>
        </ol>

        <!-- Button to Open the Modal -->
        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" style="margin-left: 20px;">
            탈퇴하기
        </button>

        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">회원 탈퇴</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
					
                    <!-- Modal body -->
					<form action="memberDelete.me" method="post">
	                    <div class="modal-body">
	                    	    현재 비밀번호를 입력해주세요
	                        <input type="password" name="pwd" >
	                    </div>
	
	                   
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	                        <button type="submit" class="btn btn-danger" data-dismiss="modal">탈퇴</button>
	                    </div>
					</form>	
                
                </div>
            </div>
        </div>
    </div>


</body>
</html>
