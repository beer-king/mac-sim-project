<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
    <!--버튼css-->
    <link rel="stylesheet" href="resources/css/button.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
     <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
		  .outer{
           width: 600px;
           margin: auto;
           margin-top: 50px;
           background-color: rgb(24, 22, 22) ;
           color: white;
        }
        .content{
        width:100%;
        margin:auto;
        }
        .innerOuter{
            width:80%;
            margin:auto;
            padding:5% 10%;
            border-radius: 10px;
        }
    </style>
</head>
<body style="background-color:  #2a2725;">
	<div class="outer">
        <br>
        <div class="image" align="center">
            <img src="resources/images/logo.png" alt="">
        </div>
        <div class="content">
            
            <div class="innerOuter">
                
                <br>
    
                <form action="insert.me" method="post" onsubmit="">
                    <div class="form-group">
                        <label for="userId">* 아이디 </label>
                        <input type="text" class="form-control" id="userId" name="userId" placeholder="" required>
                        <button type="button" class="btn btn-secondary btn-sm">중복체크</button><br>
                        <label style="font-size: 0.8em; color: gray;" >영문자, 숫자 포함하여 총 4~12자로 입력하시오.</label><br>

                        <label for="userPwd">* 비밀번호 </label>
                        <input type="password" class="form-control" id="userPwd1" name="userPwd" placeholder="" required>
                        <label style="font-size: 0.8em; color: gray;" >영문자, 숫자, 특수문자(!@#$%^&*)로만 총 8~15 사이로 입력</label><br>

                        <label for="checkPwd">* 비밀번호 확인 </label>
                        <input type="password" class="form-control" id="userPwd2" name="userPwd2" required>
                        <label style="font-size: 0.8em; color: gray;" >위와 동일하게 입력하세요</label><br>

                        <label for="userName">* 이름 </label>
                        <input type="text" class="form-control" id="userName" name="userName" placeholder="" required>
                        <label style="font-size: 0.8em; color: gray;" >한글로만 이루어져야되며 2글자 이상으로 입력하시오</label><br>

                        <label for="email"> * 이메일 </label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="" required>
                        <label style="font-size: 0.8em; color: gray;" >이메일 형식에 맞춰서 입력하시오.</label><br>

                        <label for="age"> &nbsp; 주소 </label><br>
                        <input type="text" class="form-control"id="sample6_postcode" placeholder="우편번호" name="postCode">
                        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br><br>
                        <input type="text" class="form-control"id="sample6_address" placeholder="주소" name="address"><br>
                        <input type="text" class="form-control"id="sample6_detailAddress" placeholder="상세주소" name="detailAddress"><br>
                        <input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목" name="extraAddress"> 

                        <br>
                        <label for="phone"> &nbsp; 전화번호 </label>
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="-없이 입력해주세요"><br>
                        
                        <label for="birth"> &nbsp; 생년월일 </label>
                        <input type="date" class="form-control" id="address" name="birth"><br>
                        
                        <label for=""> &nbsp; * 성별  </label> &nbsp;&nbsp;
                        <input type="radio" name="gender" id="Male" value="M" required>
                        <label for="Male">남자</label> &nbsp;&nbsp;
                        <input type="radio" name="gender" id="Female" value="F" required>
                        <label for="Female">여자</label><br>
                        
                    </div>
                    <br>
                    <div class="btns" align="center">
                        <button type="submit" class="btn btn-primary" style="background-color: #ecbf2e;" onclick="return validate();">회원가입</button>
                        <button type="reset" class="btn btn-secondary"> 초기화</button>
                    </div>
                </form>
            </div>
            <br><br>
        </div>

        <script>
		
        //주소
         function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
        
        
        
        function validate(){

            var userId = document.getElementById("userId");
            var userPwd1 = document.getElementById("userPwd1");
            var userPwd2 = document.getElementById("userPwd2");
            var userName = document.getElementById("userName");
            
            // 1)아이디 검사
            var regExp = /^[A-Za-z0-9_\-]{4,12}$/;

            if(!regExp.test(userId.value)){
            alert("유효한 아이디를 입력하세요!");

            userId.value = "";
            userId.focus();

            return false;
            }

            // 2) 비밀번호 검사
            
            // 영문자, 숫자, 특수문자(!@#$%^&*)로만 총 8!15 사이로 입력
            
            var regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;

            if(!regExp.test(userPwd1.value)){
                alert("유효한 비밀번호를 입력하세요!!")

                userPwd1.value="";
                userPwd1.focus();

                return false;
            }
            // 3) 비밀번호와 비밀번호확인이 일치하는지
            if(userPwd1.value != userPwd2.value){
                alert("동일한 비밀번호를 입력하세요!!")

                userPwd2.select(); 

                return false;
            }

            // 4) 이름 검사
            regExp = /^[가-힣]{2,6}$/;

            if(!regExp.test(userName.value)){
                alert("유효한 이름을 입력하세요!!")

                userName.value="";
                username.focus();

                return false;
            }
        }



        </script>
    

    </div>
	
	
</body>
</html>