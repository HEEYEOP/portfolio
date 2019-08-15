<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
<style>
	#body{
        border: 1px solid black;
        min-height: 900px;
        max-width: 1050px;
        margin: 0 auto;
        padding: 50px;
    }
    h1{
    	text-align:center;
    	margin:20px;
    }
    .tab{
        background-color: #2f2f2f;
        color: white;
        display: block;
        font-size: 13px;
        text-align: center;
        line-height: 50px;
        margin: 5px;
        margin-bottom:20px;
        position: relative;
        border-radius: 10px;
    }
    #signupForm{
        border: 1px solid deeppink;
        height: 800px;
    }
    .form{
        border: 1px solid darkgreen;
        width: 800px;
        margin: 0 auto;
    }
    .width{
    	width: 20%;
    }
    .usertype{
    	width: 50%;
    	margin:0;
    	margin-bottom: 20px;
    	display:inline-block;
    	background-color:#e9ecef;
    	color: #495057;
    	float:left;
    	border: 1px solid #ced4da;
  
    }
</style>
</head>
<div id="body">
        <div id="signupForm">
            <form action="<%=request.getContextPath()%>/main/signup" method="post" class="form was-validated">
                <h1>회원가입</h1>
                <li class="tab">정보를 입력해주세요</li>
                <button type="button" class="tab width usertype">개인사용자</button>
                <button type="button" class="tab width usertype">기관사용자</button>
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
                	<input name="user_email" type="text" class="form-control" required >
                	<div class="valid-feedback">Valid.</div>
      				<div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="input-group mb-3 input-group-lg">
                	<div class="input-group-prepend">
                		<span class="input-group-text">비밀번호</span>
                	</div>
                    <input name="user_pw" type="text" class="form-control">
                </div>
                <div class="input-group mb-3 input-group-lg">
                	<div class="input-group-prepend">
                		<span class="input-group-text">비밀번호 확인</span>
                	</div>
                    <input name="pwCheck" type="text" class="form-control">
                </div>
                <div class="input-group mb-3 input-group-lg">
                    <div class="input-group-prepend">
                    	<span class="input-group-text">이름</span>
                    </div>
                    <input name="user_name" type="text" class="form-control">
                </div>
                <div class="input-group mb-3 input-group-lg">
                    <div class="input-group-prepend">
                    	<span class="input-group-text">생년월일</span>
                    </div>
                    <select id="year" class="width">
                        <option value="0" selected>선택</option>
                    </select>
                    <select id="month" class="width">
                        <option value="0" selected>선택</option>
                        <option value="1">1월</option>
                        <option value="2">2월</option>
                        <option value="3">3월</option>
                        <option value="4">4월</option>
                        <option value="5">5월</option>
                        <option value="6">6월</option>
                        <option value="7">7월</option>
                        <option value="8">8월</option>
                        <option value="9">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                    </select>
                
                    <select id="date" class="width">
                        <option value="0" selected>선택</option>
                    </select>
                </div>
                <div class="input-group mb-3 input-group-lg">
                	<div class="input-group-prepend">
                		<span class="input-group-text">성별</span>
                	</div>
                    <input name="user_gender" type="checkbox"  value="M" class="form-control">남성
                    <input name="user_gender" type="checkbox" Value="F" Sclass="form-control">여성
                </div>
              
                <button type="submit" class="btn btn-success tab">회원가입</button>

            </form>
        </div>
        
    </div>