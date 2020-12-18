<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap4 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    body {
        background-color: black;
        color: white;
        margin: auto;
        width: 1000px;
    }

    /* 이미지 모달 링크 */
    .col-lg-12 img{
        cursor: pointer;
        transform: scale(1);
    }
    img:hover{
        transform: scale(1.5);
    }

    /* 모달 CSS */
    .modal, .modal-body,.table{
        color:black;
    }
    .modal-body button, .modal-body textarea, 
    .modal-body [input=email], .modal-body [input=text]{
        width: 100%;
    }

    /* 맥주상세정보 */
    .beer {
        color: white;
    }

    .table td {
        width: 200px;
        text-align: center;
    }

    .table div {
        text-align: center;
    }

    .total-score {
        padding: 10px 30px;
        border: 5px solid rgb(255, 204, 0);
        background-color: black;
        color: white;
        font-size: 30px;
        font-weight: 800;
    }

    /* 댓글자리 */
    /* 전체 댓글수 */
    .comments-details {
        padding: 15px 15px;
        font-size: 20px;
    }

    /* 댓글테두리 */
    .comments .comment-box {
        width: 100%; 
        height: 100%;
        float: left;
        background-color: black;
        padding: 20px 10px 10px;
        margin-bottom: 15px;
        border-radius: 5px;
        border: 1px dashed darkslategray;
    }

    .commenter-score,
    .comment-name {
        position: relative;
        top: -20px;
        left: 10px;
        font-size: 18px;
        font-weight: bold;
    }

    .comment-txt{
        padding: 0px 0px 10px;
    }

    /* 사용자 이미지 -> 디폴트 이미지 있음 */
    .commenter-pic {
        width: 40px;
        height: 40px;
        display: inline-block;
        border-radius: 100%;
        border: 2px solid #fff;
        overflow: hidden;
    }

    /* 댓글에서 점수표시 */
    .commenter-score {
        color: rgb(255, 204, 0);
        font-size: 20px;
    }

    /* 작성일 */
    .comment-time {
        float: right;
    }

    /* 댓글달기 버튼 */
    .comments button {
        background-color: rgb(255, 204, 0);
        padding: 5px 20px;
    }

    /* 대댓글  */
    .commenter-name input{
        background-color:transparent;
        border: none;
        color: white;
        padding-top: 5px;
        margin-bottom: 15px;
        width: 100%;
    }

    /* 대댓글 달기 박스 처음에 display:none 처리하기 */
    .comments .reply-box {
        /* display: none; */
        margin-top: 15px;
    }

    .comments .replied {
        background-color:rgb(41, 40, 40);
        float: right;
        margin-top: 15px;
        width:95%;
    }

    /* 대댓글의 댓글버튼 위치*/
    .comments .comment-meta {
        float: right;
    }

    /* 중간 선처리 */
    .comments p.comment-txt { 
        border-bottom: 1px dotted darkslategrey;
    }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<br><br><br><br><br><br>

    <div class="container">
        <div class="col-lg-12" align="right">
            <!-- 1. 공유하기 모달창 띄우기 -->
            <span>
                <img src="images/iconfinder_share_media_network_social_link_6556724.png" width="40px" alt="공유하기" data-toggle="modal"  data-target="#myModal1">
            </span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <!-- 2. 나만의 카테고리 만들기 모달처리  -->
            <span>
                <img src="images/iconfinder_folder_red_favourite_52688.png" width="40px"alt="폴더담기" data-toggle="modal" data-target="#myModal2">
            </span>
        </div>
        <br>
        <table class="table beer">
            <tr>
                <td rowspan="6" width="200px">맥주사진자리</td>
                <td>말표맥주</td>
                <td>Malpyo Dark Beer</td>
                <td rowspan="7">
                    <div class="btn btn-warning total-score">평점<br>
                        <!-- 댓글들의 평균 점수 노출 -->
                        98
                    </div>
                    <br><br>
                    <!-- 제이쿼리로 modal 띄우기 -->
                    <div class="btn btn-warning score" data-toggle="modal"  data-target="#myModal3">나만의 평점매기기</div><br><br>
                    <div class="btn btn-warning request1" data-toggle="modal"  data-target="#myModal4">맥주정보수정요청</div><br><br>
                    <div class="btn btn-warning request2" data-toggle="modal"  data-target="#myModal5">맥주정보등록요청</div>
                </td>
            </tr>
            <tr>
                <td>생산자</td>
                <td>스퀴즈 브루어리</td>
            </tr>
            <tr>
                <td>생산지역</td>
                <td>강원도</td>
            </tr>
            <tr>
                <td>스타일</td>
                <td>다크 에일</td>
            </tr>
            <tr>
                <td>알콜도수</td>
                <td>4.5도</td>
            </tr>
            <tr>
                <td>맥주용기</td>
                <td>캔</td>
            </tr>
        </table>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="comments">

                <div class="comments-details"> 댓글 수 ( 117 )</div>

                <!-- <div class="comment-box add-comment">
                    <span class="commenter-pic">
                        <img src="images/네이버밴드.png" class="img-fluid">
                    </span>
                    <span class="commenter-name">
                        <input type="text" placeholder="나만의 맥주 점수를 매겨주세요" name="Add Comment">
                        <button type="submit" class="btn btn-default">등록</button>
                        <button type="reset" class="btn btn-default">캔슬</button>
                    </span>
                </div> -->

                <div class="comment-box">

                    <span class="commenter-pic">
                        <img src="images/user.png" class="img-fluid">
                    </span>
                    <span class="comment-name">user01</span>
                    <span class="commenter-score"> 스코어 : 98 </span>
                    <span class="comment-time">등록일: 2020-10-13</span>
                    <p class="comment-txt more">
                        흑백주 맛있어요!! 기네스는 넘 진해서 잘 못마시는데 이건 그보다 부드러워요 <br>
                        ㅋㅋㅋㅋㅋ
                        ㅋㅋㅋㅋㅋㅋㅋㅋ
                        ㅋㅋㅋ
                    </p>
                    <p>댓글수(0)</p>
                    <div class="comment-meta">
                        <button class="btn btn-sm popup">댓글달기</button>
                    </div>

                    <!--  댓글달기 버튼 누를시 뜨는 댓글 div -> 모달처리해야함  -->
                    <div class="comment-box add-comment reply-box">
                        <span class="commenter-pic">
                            <img src="images/iconfinder_users-5_984104.png" class="img-fluid">
                        </span>
                        <span class="commenter-name">
                            <input type="text" placeholder="댓글을 달아보세요" name="">
                        </span>
                        <div class="comment-meta">
                            <button class="btn btn-sm">댓글달기</button>
                        </div>
                    </div>

                </div>


                <div class="comment-box">
                    <span class="commenter-pic">
                        <img src="images/iconfinder_Beer_Barrel_drink_3017863.png" class="img-fluid">
                    </span>
                    <span class="comment-name">user02</span>
                    <span class="commenter-score">score : 95 </span>
                    <span class="comment-time">등록일: 2020-10-11</span>
                    <p class="comment-txt more">이름이 말표라 웃겨서 사먹었는데 맛은 찐이네요!</p>
                    <p>댓글수(2)</p>
                    <div class="comment-meta">
                        <button class="btn btn-sm popup">댓글달기</button>
                    </div>

                    <div class="comment-box replied">
                        <span class="commenter-pic">
                            <img src="images/iconfinder_Beer_clover_st_patrick_3017883.png" class="img-fluid">
                        </span>
                        <span class="comment-name">user03</span>
                        <span class="comment-time">등록일: 2020-10-11</span>
                        <p class="comment-txt">말표맥주말고 전 스타우트가 좋던데요!! 다른 맛있가요? </p>
                        <div class="comment-meta">
                            <button class="btn btn-sm popup comment-reply"> 댓글달기</button>
                        </div>

                        <div class="comment-box replied">
                            <span class="commenter-pic">
                                <img src="images/iconfinder_Food_Drink_Drinks_Beverage_Soda_Cold_Beer-23_3929520.png" class="img-fluid">
                            </span>
                            <span class="comment-name">user02</span>
                            <span class="comment-time">등록일: 2020-10-12</span>
                            <p class="comment-txt">저처럼 위에 보이는 버튼 눌러서 점수참여해보세요!! 댓글로는 점수반영이 안돼요!</p>
                            <div class="comment-meta">
                                <button class="btn btn-sm popup comment-reply">댓글달기</button>
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>

    <!-- 모달  -->
    <!-- 1. 공유하기 -->
    <div class="modal fade" id="myModal1">
        <div class="modal-dialog modal-sm">
        <div class="modal-content">
        
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title">공유하기</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
                <div class="row">
                    <div class="col"><img src="images/페이스북.png" width="30px" alt=""></div>
                    <div class="col"><img src="images/카카오톡.png" width="30px"  alt=""></div>
                    <div class="col"><img src="images/인스타그램1.png" width="30px"  alt=""></div>
                    <div class="col"><img src="images/트위터1.png" width="30px"  alt=""></div>
                </div>
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
            
        </div>
        </div>
    </div>

    <!-- 2. 나만의 카테고리 1) 임시보관함 화면 -->
    <div class="modal fade" id="myModal2">
        <div class="modal-dialog modal-sm">
        <div class="modal-content">
        
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title"> 카테고리 만들기</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
                <div>
                    <button onclick="" class="btn btn-dark" width="100%">폴더생성</button>
                </div><br>
                <div>
                    <input type="checkbox"> 임시보관함(2)
                </div>
<!--                 
                <div>
                    <input type="checkbox"> 페일에일(3)
                </div> -->
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>

                <!-- 1. 완료버튼 누르면 alert 로 '임시보관함(폴더명 노출)에 담았습니다.'  처리 -->
                <!-- 2. 새로운 폴더명이 생성된 후 새로운 폴더명이 생긴 모달창으로 보여지고, 그때 다시 완료버튼 누르면 체크박스 선택한 '폴더명으로 담았습니다'로 alert 처리 -->
                <button type="submit"  id="submit-new" class="btn btn-secondary btn-warning" data-dismiss="modal">완료</button>
            </div>
            
        </div>
        </div>
    </div>

    <script>
        $(function(){
            $("#submit-new").click(function(){
                location href = "$(""; 
            })
        })
    </script>


    <!-- 2. 나만의 카테고리 2) 폴더생성화면 -->
    <div class="modal fade" id="myModal2-2">
    <div class="modal-dialog modal-sm">
    <div class="modal-content">
    
        <!-- Modal Header -->
        <div class="modal-header">
        <h4 class="modal-title"> 카테고리 만들기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            <div>
                <button onclick="" class="btn btn-dark" width="100%">폴더생성</button>
            </div><br>
            <div>
                <input type="text" placeholder="폴더명을 입력하세요">
            </div>

        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            <!-- 완료버튼 클릭하면 alert 로 '페일폴더(폴더명)를 만들었습니다'로 처리시킨후 새로 생성된 폴더명이 있는 모달창을 보여준다. -->
            <button type="submit" class="btn btn-secondary btn-warning" data-dismiss="modal">완료</button>
        </div>
            
        </div>
        </div>
    </div>

     <!-- 3. 나만의 평점 -->
     <div class="modal fade" id="myModal3">
        <div class="modal-dialog modal-lg">
        <div class="modal-content">
        
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title"> 말표맥주</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body">
                <div class="col">
                    <select class="form-control search-slt" id="exampleFormControlSelect11">
                        <option selected>나의 점수</option>
                        <option value="">100</option>
                        <option value="">99</option>
                        <option value="">98</option>
                        <option value="">97</option>
                        <option value="">96</option>
                        <option value="">95</option>
                        <option value="">94</option>
                        <option value="">93</option>
                        <option value="">92</option>
                        <option value="">91</option>
                        <option value="">90</option>
                        <option value="">89</option>
                        <option value="">88</option>
                        <option value="">87</option>
                        <option value="">86</option>
                        <option value="">85</option>
                        <option value="">84</option>
                        <option value="">83</option>
                        <option value="">82</option>
                        <option value="">81</option>
                        <option value="">80</option>
                        <option value="">79</option>
                        <option value="">78</option>
                        <option value="">77</option>
                        <option value="">76</option>
                        <option value="">75</option>
                        <option value="">74</option>
                        <option value="">73</option>
                        <option value="">72</option>
                        <option value="">71</option>
                        <option value="">70</option>
                        <option value="">69</option>
                        <option value="">68</option>
                        <option value="">67</option>
                        <option value="">66</option>
                        <option value="">65</option>
                        <option value="">64</option>
                        <option value="">63</option>
                        <option value="">62</option>
                        <option value="">61</option>
                    </select>
                </div><br>
                <div class="col">
                    <textarea name="" id="review" cols="30" rows="10" style="resize: none;">맥주를 마신 테이스팅도 남겨주세요!
                    </textarea>
                </div>

            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
                <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button> -->
                <button type="submit" class="btn btn-secondary btn-warning" data-dismiss="modal">완료</button>
            </div>
            
        </div>
        </div>
    </div>


    <!-- 4. 맥주정보수정요청 -->
    <div class="modal fade" id="myModal4">
    <div class="modal-dialog modal-lg">
    <div class="modal-content">
    
        <!-- Modal Header -->
        <div class="modal-header">
        <h4 class="modal-title">정보수정요청 : 말표맥주 (Malpyo Dark Beer)</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            <div class="row">
                <div class="col"><b>생산자</b> </div>                       
                <div class="col">: 스퀴즈 브루어리</div>
                <div class="col"><b>생산지역</b></div>
                <div class="col">: 강원도</div>
            </div>
            <div class="row">
                <div class="col"><b>스타일</b></div>
                <div class="col">: 다크 에일</div>
                <div class="col"><b>알콜도수</b></div>
                <div class="col">: 4.5도</div>
            </div>       
            <div class="row">
                <div class="col"><b>맥주용기</b></div>
                <div class="col">: 캔</div>
                <div class="col"></div>
                <div class="col"></div>
            </div><hr>
            <div class="row">
                <div class="col"><b>수정카테고리</b></div>
                <div class="col"><input type="checkbox"> 맥주명 (한글)</div>
                <div class="col"><input type="checkbox"> 맥주명 (영어)</div>
                <div class="col"><input type="checkbox"> 생산자</div>
            </div>
            <div class="row">
                <div class="col"></div>
                <div class="col"><input type="checkbox"> 생산지역</div>
                <div class="col"><input type="checkbox"> 맥주스타일</div>    
                <div class="col"><input type="checkbox"> 알콜도수</div>
            </div>
            <div class="row">
                <div class="col"></div>
                <div class="col"><input type="checkbox"> 맥주용기</div>
                <div class="col"><input type="checkbox"> 맥주사진</div>
                <div class="col"></div>
            </div>
            <div class="row"> 
                <div class="col-sm-2"><b>수정정보</b></div> 
            </div>
            <div class="row">
                <div class="col"><textarea name="" id="" cols="30" rows="8" style="resize: none;"></textarea></div>
            </div>
            <div class="row">
                <div class="col">
                    <input type="file" placeholder="">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8">
                    <input type="email" style="width: 100%;padding: 5px;" placeholder="이메일을 입력해주세요"> 
                </div>
                <div class="col-lg-4">
                    <!-- 관리자 이메일로 발송하는 방식  -->
                    <!-- 보내기 누르고 alert 처리 "발송되었습니다. 내용확인후 반영하는데 일주일가량 소요됩니다." -->
                    <input type="submit" value="보내기" class="btn btn-dark" style="width: 100%;">
                </div>
            </div>

        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
            <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button> -->
            <button type="submit" class="btn btn-secondary btn-warning" data-dismiss="modal">취소</button>
        </div>
        
    </div>
    </div>
</div>

         <!-- 5. 맥주정보등록요청 -->
         <div class="modal fade" id="myModal5">
            <div class="modal-dialog modal-lg">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title"> 정보등록요청</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="row">
                        <table class="table">
                            <tr>
                                <td rowspan="7" style="width: 15%;">
                                    <input type="file">
                                </td>
                                <td style="width: 25%;">(한)맥주이름</td>
                                <td><input type="text" style="width: 100%;" placeholder="맥주 한글로 입력해주세요"></td>
                            </tr>
                            <tr>
                                <td>(영)맥주이름</td>
                                <td><input type="text" style="width: 100%;" placeholder="맥주 영문으로 입력해주세요"></td>
                            </tr>
                            <tr>
                                <td>맥주스타일</td>
                                <td><input type="text" style="width: 100%;" placeholder="예)페일에일, 라거...."></td>
                            </tr>
                            <tr>
                                <td>제조사</td>
                                <td><input type="text" style="width: 100%;" placeholder="예)진로, 롯데"></td>
                            </tr>
                            <tr>
                                <td>생산지역</td>
                                <td><input type="text" style="width: 100%;" placeholder="예)강원도 홍천"></td>
                            </tr>
                            <tr>
                                <td>알콜도수</td>
                                <td><input type="text" style="width: 100%;" placeholder="숫자만 입력해주세요. 예)4.5"></td>
                            </tr>
                            <tr>
                                <td>맥주용기</td>
                                <td>
                                    <select name="beer-container" id="" style="width: 100%;padding: 3px;">
                                        <option value="">포장상태</option>
                                        <option value="">캔</option>
                                        <option value="">병</option>
                                        <option value="">케그</option>
                                        <option value="">기타</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-8">
                            <input type="email" style="width: 100%;padding: 5px;" placeholder="이메일을 입력해 주세요.">
                        </div>
                        <div class="col-lg-4" >
                            <input type="submit" value="전송" class="btn btn-dark" style="width: 100%;">
                        </div>
                    </div>
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button> -->
                    <button type="submit" class="btn btn-secondary btn-warning" data-dismiss="modal">완료</button>
                </div>
                
            </div>
            </div>
        </div>
</body>
</html>