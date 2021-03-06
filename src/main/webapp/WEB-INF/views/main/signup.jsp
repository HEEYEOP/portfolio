<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath()%>/resources/css/signupPage.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/additional-methods.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/signupPage.js"></script>


<title>회원가입페이지</title>

</head>
<div id="body">
	<div id="signupForm">
		<h1>회원가입</h1>
	    <form id="form" action="<%=request.getContextPath()%>/main/signup" method="post" class="form was-validated" enctype="multipart/form-data">
	        <div class="tab">정보를 입력해주세요</div>
	        <button name="typeButton" type="button" class="tab width usertype btn-primary" value="IndividualUser">개인사용자</button>
	        <button name="typeButton" type="button" class="tab width usertype btn-primary" value="GroupUser">기관사용자</button>
	       	<input id="typeValue" type="hidden" name="userType">
	
	        <div id="confirmFileBox" class="input-group mb-3 input-group-lg" style="display:none">
	        	<div class="input-group-prepend">
	        		<span class="input-group-text">첨부파일</span>
	        	</div>
	        	<input name="confirmFile2" type="file" class="form-control">
	        </div>
	        
	        <div class="input-group mb-3 input-group-lg">
	        	<div class="input-group-prepend">
	        		<span class="input-group-text">E-mail</span>
	        	</div>
	        	<input id="userEmail" name="userEmail" type="email" class="form-control" style="background-color:white;" readonly value="${userEmail}" >
	            <button name="confirmButton" type="button" class="input-group-text">인증</button>
			</div>
	            
            <div class="input-group mb-3 input-group-lg">
            	<div class="input-group-prepend">
            		<span class="input-group-text">비밀번호</span>
            	</div>
                <input id="userPw" name="userPw" type="text" class="form-control">
            </div>
	       
            <div class="input-group mb-3 input-group-lg">
            	<div class="input-group-prepend">
            		<span class="input-group-text">비밀번호 확인</span>
            	</div>
                <input id="pwCheck" name="pwCheck" type="text" class="form-control">
            </div>
	            
            <div class="input-group mb-3 input-group-lg">
                <div class="input-group-prepend">
                	<span class="input-group-text">이름</span>
                </div>
                <input id="userName" name="userName" type="text" class="form-control">
            </div>
	            
            <div class="input-group mb-3 input-group-lg">
                <div class="input-group-prepend">
                	<span class="input-group-text">생년월일</span>
                </div>
                <select id="year" class="width" name="birth">
                    <option value="0" selected>선택</option>
                </select>
                <select id="month" class="width" name="birth">
                    <option value="0" selected>선택</option>
                    <option value="01">01월</option>
                    <option value="02">02월</option>
                    <option value="03">03월</option>
                    <option value="04">04월</option>
                    <option value="05">05월</option>
                    <option value="06">06월</option>
                    <option value="07">07월</option>
                    <option value="08">08월</option>
                    <option value="09">09월</option>
                    <option value="10">10월</option>
                    <option value="11">11월</option>
                    <option value="12">12월</option>
                </select>
            
                <select id="date" class="width" name="birth">
                    <option value="0" selected>선택</option>
                </select>
                <input type="hidden" name="userBirth2" id="userBirth">
            </div>
            
            <div class="input-group mb-3 input-group-lg">
                <div class="input-group-prepend">
                	<span class="input-group-text">전화번호</span>
                </div>
                <input id="userPhone" name="userPhone" type="text" class="form-control">
            </div>
            
            <div class="input-group mb-3 input-group-lg">
            	<div class="input-group-prepend">
            		<span class="input-group-text">성별</span>
            	</div>
                <input name="userGender" type="checkbox"  value="M" class="form-control">남성
                <input name="userGender" type="checkbox" Value="F" class="form-control">여성
            </div>
	        <button type="submit" class="btn btn-success tab">회원가입</button>
		</form>
	</div>
</div>


<div id="emailConfirmBox" class="displayNone"></div>
	<div class="emailDupCheck displayNone" >
		<div>
			<h3 style="display:inline-block;">이메일 인증하기</h3>
			<h6>창닫기</h6>
			
			<div class="input-group mb-3 input-group-lg">
			    <input name="sendingUserEmail" type="email" class="form-control" >
			    <button type="button" id="dup" class="input-group-text">인증번호받기</button>
			</div>
			
			<div class="input-group mb-3 input-group-lg">
			    <input name="sendingNum" type="email" class="form-control" placeholder="인증번호">
			    <button type="button" id="matchSendingNum" class="input-group-text">확인</button>
			</div>
			
			<div id="timerBox">
				남은 시간 : 
			</div>
		</div>
	</div>
	


    