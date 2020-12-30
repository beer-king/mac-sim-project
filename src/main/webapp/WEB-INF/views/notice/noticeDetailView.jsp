<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .outer{
        width: 800px;
        height: 600px;
        margin: auto;
        margin-top: 50px;
        background-color: #2a2725;
        color: white;
    }
    
    .paging-area a{
        text-decoration: none;
        color: black;
        margin: 5px;
    }
    .search_bar select{
        float: left;
        margin-left: 100px;
        margin-right: 330px;
    }
    .paging-area a:hover{
        text-decoration: none;
        color: gray;
    }

 
</style>
</head>
<body style="background-color:  #2a2725;">

	<jsp:include page="../common/header.jsp"/> 
	
	<div class="outer">

        <br>
        <!-- <h1 align="left">공지사항</h1>-->


         <!--<hr style="border:solid 0.7px #ecbf2e">-->
            <table style= "width: 80%;">
                <thead>
                    <tr>
                        <th colspan="3" style="width: 400px; font-size: 1.5em;" value="제목제목">${ n.noticeTitle }</th>
                    </tr>
                </thead> 
                <tbody >
                    <tr>
                        <td colspan="3"> </td>
                        <td>${n.noticeDate }</td>  
                    </tr>
                    <tr>
                        <td colspan="4"><hr style="border:solid 0.3px white;"></td>
                    </tr>
                    <tr align="center">
                        <td colspan="4" >
                        	<br>
                            <p style="height:180px;color:#ecbf2e;">${n.noticeContent }</p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4"><hr></td>
                    </tr>
                </tbody>
                

            </table>
            <br>
            
       <br><br>

       <table id="ncoArea" class="table" style="color: white; width: 80%;">
	        <thead>
	            <tr>
	                <th colspan="3">
	                    <textarea class="form-control" name="ncoComment" id="content" cols="55" rows="2" style="resize:none; width:90%; margin-left: 60px;"></textarea>
	                </th>
	                <th style="vertical-align: middle; width: 20%;" >
	                	<button class="btn btn-secondary"onclick="addReply();">댓글</button>
	                </th>
	            </tr>
	            
	            <tr>
	               <td colspan="4">댓글 (<span id="rcount"></span>) </td> 
	            </tr>
	        </thead>
	        <tbody align="center">
	            
	        </tbody>
      </table>
</div>
<br><br>

	<script>
		$(function(){
			selectNcommentList();
			
		})
		
		
		function addReply(){
			// 작성된 댓글내용, 게시글 번호, 로그인한 사용자의 아이디
			if($("#content").val().trim().length > 0){
													   
				$.ajax({
					url:"ninsert.bo",
					data:{
						ncoComment:$("#content").val(),
						noticeNo:${n.noticeNo},
						userNo:"${loginUser.userNo}"
					},
					success:function(result){

						if(result == "success"){

							$("#content").val(""); 
							selectNcommentList(); 
							
						}
						
					},error:function(){
						console.log("댓글 작성용 ajax 통신 실패");
					}
				});
				
			}
		
		
		}
		function selectNcommentList(){
			 
			$.ajax({
				url:"ncolist.no",
				data:{nno:${n.noticeNo}},
				success:function(list){
					

					$("#rcount").text(list.length); 

					var value=""
					for(var i in list){
						value += "<tr>" + 
									"<td>" + list[i].userId + "</td>" +
									"<td>" + list[i].ncoComment + "</td>" + 
									"<td>" + list[i].ncoDate + "</td>" + 
									"<td>"+"<button type='button' id='deleteReply' class='btn btn-secondary btn-sm'>신고</button>" + "</td>" +
								"</tr>"
					}
					
					
					$("#ncoArea tbody").html(value)
					
					
				},error:function(){
					console.log("댓글 리스트 ajax통신 실패")
				}
			});
			
		}
	</script>











	
</body>
</html>