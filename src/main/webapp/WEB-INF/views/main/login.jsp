<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/loginPage.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/loginPage.js"></script>


<title>로그인화면</title>

</head>

<div class="body">
 <div id="loginImg">이미지</div>
 <div class="loginBox">
     <h1>로그인</h1>
     <form action="<%=request.getContextPath()%>/main/login" method="POST">
         <div class="input-group mb-3 input-group-lg">
             <div class="input-group-prepend">
             <span class="input-group-text" style="width: 113.98px;">E-mail</span>
             </div>
             <input name="userEmail" type="text" class="form-control">
         </div>
         <div class="input-group mb-3 input-group-lg">
             <div class="input-group-prepend">
             <span class="input-group-text">비밀번호</span>
             </div>
             <input name="userPw" type="text" class="form-control">
         </div>
         <button type="submit" class="btn btn-success" style="width:478px;">로그인</button>
     </form>
     <ul id="searchInfoBox">
         <li>
             <span>홈페이지가 처음이신가요?</span><a href="<%=request.getContextPath()%>/main/signup" style="float: right;">회원가입하기</a>
         </li>
         <li>
             <span>E-amil을 잊으셨나요?</span><a href="#" style="float: right;">가입E-mail찾기</a>
         </li>
         <li>
             <span>비밀번호를 잊으셨나요?</span><a name="searchPw" href="#" style="float: right;">비밀번호찾기</a>
         </li>
      </ul>
    </div>
</div>
<div id="sendingBox" class="displayNone"></div>
	<div id="sendingEmailBox" class="loginBox displayNone">
		<div class="textBox">
	     	<h3>임시 비밀번호발송</h3>
	    </div>
	     <form>
		     <div class="input-group mb-3 input-group-lg">
            	 <div class="input-group-prepend">
            		<span class="input-group-text">사용자구분</span>
            	 </div>
                 <input name="userGender" type="radio"  value="IndividualUser" class="form-control">개인
                 <input name="userGender" type="radio" Value="GroupUser" class="form-control">기관
            </div>
	         <div class="input-group mb-3 input-group-lg">
	             <div class="input-group-prepend">
	             <span class="input-group-text" style="width: 113.98px;">E-mail</span>
	             </div>
	             <input name="userEmail" type="text" class="form-control">
	         </div>

	         <button type="submit" class="btn btn-success" style="width:478px;">Email전송하기</button>
	         <button type="button" class="btn btn-success" style="width:478px; margin-top:20px;">닫기</button>
	     </form>
	     
     </div>






</html>