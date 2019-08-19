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
            <form id="form" action="<%=request.getContextPath()%>/main/signup" method="post" class="form was-validated">
                <div class="tab">정보를 입력해주세요</div>
                <button name="typeButton" type="button" class="tab width usertype btn-primary" value="IndividualUser">개인사용자</button>
                <button name="typeButton" type="button" class="tab width usertype btn-primary" value="GroupUser">기관사용자</button>
               	<input id="typeValue" type="hidden" name="user_type">
        
                <div class="input-group mb-3 input-group-lg" style="display:none">
                	<div class="input-group-prepend">
                		<span class="input-group-text">첨부파일</span>
                	</div>
                	<input name="confirmFile" type="file" class="form-control">
                </div>
                
                <div class="input-group mb-3 input-group-lg">
                	<div class="input-group-prepend">
                		<span class="input-group-text">E-mail</span>
                	</div>
                	<input id="user_email" name="user_email" type="email" class="form-control" required >
                	<button type="button" id="dup" class="input-group-text">중복체크</button>
                	<div class="valid-feedback">Valid.</div>
      				<div class="invalid-feedback">e-mail을 입력해주시기 바랍니다</div>
                </div>
                
                <div class="input-group mb-3 input-group-lg">
                	<div class="input-group-prepend">
                		<span class="input-group-text">비밀번호</span>
                	</div>
                    <input id="user_pw" name="user_pw" type="text" class="form-control">
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
                    <input id="user_name" name="user_name" type="text" class="form-control">
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
                    <input type="hidden" name="user_birth2" id="user_birth">
                </div>
                <div class="input-group mb-3 input-group-lg">
                	<div class="input-group-prepend">
                		<span class="input-group-text">성별</span>
                	</div>
                    <input name="user_gender" type="checkbox"  value="M" class="form-control">남성
                    <input name="user_gender" type="checkbox" Value="F" class="form-control">여성
                </div>
                <button type="submit" class="btn btn-success tab">회원가입</button>

            </form>
        </div>
        
    </div>
    