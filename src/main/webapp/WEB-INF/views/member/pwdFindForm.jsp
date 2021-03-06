<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="resources/css/button.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
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
          width: 240px;
          height: 35px;
          background-color: #ecbf2e;;
        }
        img{
          width: 100px;
          height: 100px;
          margin: auto;
          margin-top: 40px;
        }

    </style>
</head>
<body style="background-color:  #2a2725;">
    
    <div class="outer">
            <br>
            <div id="image" align="center">
              <a href="/macSim"><img src="resources/images/macsimXy.png" alt="" style="width: 180px; height: 40px;"></a><br><br>
            </div>
            <br><br>
            <div id="findIdForm">
              <form action="" method="">
                  <table align="center">
                    <tr>
                      <th>아이디</th>
                      <td><input type="text" name="userId" id="userId" placeholder="ex)macsim" required></td>
                    </tr>

                    <tr>
                      <th>이메일&nbsp&nbsp</th>
                      <td><input type="email" name="email" id="email"required placeholder="ex)macsim@gmail.com"></td>
                    </tr>

                  </table>

                  <br>
                  <br>
                  <div align="center" id="findId">
                    <button class="snip1535" type="submit" onclick="findBtn();">임시비밀번호받기</button>
                  </div>
                  <br>  
              </form>
 
            </div>
            
    </div>
    
    <script>

		function findBtn(){
			
				$.ajax({
					type:"post",
					url:"findPwd.me",
					data:{
						userId : $("#userId").val(),
						email : $("#email").val()
					},
					success:function(result){
						
						console.log(result);
						if(result != "fail"){
							//alert("임시비밀번호가 발송 되었습니다.");
						}else{
							//alert("이메일 발송 실패되었습니다.");
						}
						
					},error:function(){
						console.log("메일 보내기 ajax 통신 실패");
						return false;
					}
				});
					
	
		}
			
    </script> 

</body>
</html>