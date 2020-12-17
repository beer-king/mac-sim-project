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

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .outer{
           width: 500px;
           margin: auto;
           margin-top: 50px;
           background-color: rgb(24, 22, 22);
           color: white;
           border-radius: 10px;
        }

        .content{margin-left:10px;}
 
        .enrollTerm > h2 {
          margin-top: 100px;
          font-size: 30px;
          margin-bottom: 30px;
        }  
        button {
          width: 95px;
          height: 40px;
        }

        .termDetail {
          /*이용약관 상세전용*/
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          height: 200px;
          margin-right:50px;
        }
        
        .termDetail > textarea {
          text-align:left;
          border: 1px solid gray;
          width: 320px;
          height: 200px;
          resize: none;
        }

        .checkWrap span {
          color: gray;
        }
        
        .checkWrap span:hover {
          cursor: pointer;
          color: black;
          font-weight:bold;
        }
        
        .termDetail {
          display: none;
        }

        .termDetail > textarea {
          text-align: left;
          border: 1px solid gray;
          width: 220px;
          height: 200px;
          resize: none;
        }
    </style>
</head>
<body  style="background-color:  #2a2725;">
    
    <div class="outer">
      <br>
            <div id="image" align="center">
              <img src="resources/images/logo.png" alt="">
            </div>

            <form action="enrollForm.me" method="post">  
              <div class="main">
                      
                <div class="enrollTerm" align="center">
                  <h2>약관 동의</h2>
                  <div class="terms">
                      <div class="checkWrap">
                        <div class="fill"></div>
                        <input type="checkbox" id="checkAll"> &nbsp;&nbsp;회원가입 약관에 모두 동의합니다.
                      </div>
                    <br>
                      <div class="checkWrap">
                        <div class="fill"></div>
                        <input type="checkbox" name="terms" value="termAgree" required>&nbsp;&nbsp; [필수]회원가입약관&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span id="see1" style="color: #ecbf2e;;">&nbsp;&nbsp;></span>
                      </div>
                      <div class="termDetail term1">
                        <textarea cols="30" rows="10" readonly>
                            기업마당은 「개인정보보호법」 제15조제1항제1호, 제17조제1항제1호, 제23조제1호, 제24조제1항 제1호에 따라
                            아래와 같이 개인정보의 수집. 이용에 관하여 귀하의 동의를 얻고자 합니다.
                            
                            기업마당은 이용자의 사전 동의 없이는 이용자의 개인정보를 함부로 공개하지 않으며, 수집된 정보는 아래와 같이 이용하고 있습니다.
                            이용자가 제공한 모든 정보는 아래의 목적에 필요한 용도 이외로는 사용되지 않으며 이용 목적이 변경될 시에는 이를 알리고 동의를 구할 것입니다.
                        </textarea>
                    </div>
                    <br>
                      <div class="checkWrap">
                        <div class="fill"></div>
                        <input type="checkbox" name="terms" value="dataAgree" required>&nbsp;&nbsp;&nbsp;[필수]개인정보 처리방침안내&nbsp;&nbsp;
                        <span id="see2" style="color: #ecbf2e;;">&nbsp;&nbsp;></span>
                      </div>
                      <div class="termDetail term2">
                          <textarea cols="30" rows="10" readonly>   
                            개인정보의 수집 및 이용 동의 개인정보의 수집 및 이용 목적
                            가. 서비스 제공에 관한 업무 이행 - 컨텐츠 제공, 특정 맞춤 서비스 제공(마이페이지, 뉴스레터 등), 기업 애로상담
                            나. 회원관리 - 회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 가입의사 확인, 가입 및 가입횟수 제한, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 공지사항 전달
                          </textarea>
                      </div>
                      <br>
                      <div class="checkWrap">
                        <div class="fill"></div>
                        <input type="checkbox" name="terms"required>&nbsp;&nbsp;[필수]만 19세 이상입니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      </div>

                      <br>
                      <div id="btnWrap">
                        <button type="reset" class="btn btn-secondary" onclick="history.back();">취소</button>&nbsp;&nbsp;&nbsp;
                        <button type="submit" class="btn btn-secondary " style="background-color: #ecbf2e;">다음 단계</button>
                      </div>
                   
                  </div>
                </div>
             </form>         
        
        <br><br>
    </div>
         
      
      <script>
      
      $(function(){
      
             //클릭하면 약관상세 보여지거나 숨겨짐
             $('#see1').click(function(){
               $('.term1').toggle();
             })
             $('#see2').click(function(){
               $('.term2').toggle();
             })
      
             //클릭하면 전체동의선택됨
             $('#checkAll').click(function(){
               if($('#checkAll').prop('checked')){ 
                $('input[name=terms]').prop("checked",true); //전부 체크
               }else{
                $('input[name=terms]').prop("checked",false); //전부 체크 해제
               }
             })
           })
      </script> 




</body>
</html>