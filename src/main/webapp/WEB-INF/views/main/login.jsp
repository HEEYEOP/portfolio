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
<div style="background-color : #f8f8f8;">
<div class="body">
 <div class="loginImg"><span>우리의 목소리가 세상을 바꾸는 힘이 됩니다</span></div>
 <div class="loginBox">
     <h1 class="loginTitle">로그인</h1>
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
             <span>E-amil을 잊으셨나요?</span><span name="searchId" style="float: right; display:inline-block;">가입E-mail찾기</span>
         </li>
         <li>
             <span>비밀번호를 잊으셨나요?</span><span name="searchPw" style="float: right; display:inline-block;">비밀번호찾기</span>
         </li>
      </ul>
    </div>
</div>
</div>
<div id="sendingBox" class="displayNone"></div>
	<!-- 임시비밀번호발송 -->
	<div id="sendingEmailBox" class="loginBox displayNone">
		<h6 style="float:right;">창닫기</h6>
	     <h3 class="tmpPwTitle">임시 비밀번호발송</h3>
	     <form action="<%=request.getContextPath()%>/mail/mailSending" method="post">
		     <div class="input-group mb-3 input-group-lg">
            	 <div class="input-group-prepend">
            		<span class="input-group-text">사용자구분</span>
            	 </div>
                 <input name="userType" type="radio"  value="IndividualUser" class="form-control">개인
                 <input name="userType" type="radio" Value="GroupUser" class="form-control">기관
            </div>
	         <div class="input-group mb-3 input-group-lg">
	             <div class="input-group-prepend">
	             <span class="input-group-text" style="width: 113.98px;">E-mail</span>
	             </div>
	             <input name="userEmail" type="text" class="form-control">
	         </div>

	         <button type="submit" class="btn btn-success" style="float:right;">Email전송하기</button>
	     </form>
     </div>
     
    <!-- 아이디찾기 -->
    <div id="sendingIdSearch" class="displayNone">
    	<h6 style="float:right;">창닫기</h6>
    	<h3 class="tmpPwTitle">가입 E-mail 찾기</h3>
    	<div class="idSearchNotice">가입E-mail은 해당 정보에 사용자의 핸드폰 번호가 등록되어있을때만 찾을 수 있습니다.</div>
    
    	<div class="input-group mb-3 input-group-lg">
   	 		<div class="input-group-prepend">
   				<span class="input-group-text">핸드폰번호</span>
   	 		</div>
        	<input name="userPhone" type="text" class="form-control">
   		</div>
   		
   		<div class="input-group mb-3 input-group-lg">
           	<div class="input-group-prepend">
           		<span class="input-group-text">이름</span>
           	</div>
           	<input name="userName" type="text" class="form-control">
        	</div>
        	<button type="button" class="btn btn-success" style="float:right;">아이디찾기</button><br>	
   	
   		<div id="idSearchRes"></div>
    	
    	
    </div>
     






</html>